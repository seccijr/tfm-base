/* VALIDACIÓN CRUZADA LOGÍSTICA PARA VARIABLES DEPENDIENTES BINARIAS 

*********************************************************************************
								PARÁMETROS
*********************************************************************************

BÁSICOS

archivo=		archivo de datos
vardepen=		variable dependiente binaria 
categor=		lista de variables independientes categóricas
ngrupos=		número de grupos validación cruzada
sinicio=		semilla inicial para repetición
sfinal=			semilla final para repetición
objetivo=		tasafallos,sensi,especif,porcenVN,porcenFN,porcenVP,porcenFP,precision,tasaciertos


El archivo final se llama final. La variable media es la media del obejtivo en todas las pruebas de validación cruzada
(habitualmente tasa de fallos).

*/

%macro cruzadalogistica(archivo=,vardepen=,categor=,ngrupos=,sinicio=,sfinal=,objetivo=tasafallos);
	title ' ';
	
	data final;
	run;

	data sal_final;
	run;

	%do semilla=&sinicio %to &sfinal;
		data dos;
			set &archivo;
			u=ranuni(&semilla);
		run;
		
		proc sort data=dos;
			by u;
		run;
		
		data dos (drop=nume);
			retain grupo 1;
			set dos nobs=nume;
			if _n_>grupo*nume/&ngrupos then grupo=grupo+1;
		run;
		
		data fantasma;
		run;
		
		%do exclu=1 %to &ngrupos;
			data tres;
				set dos;
				if grupo ne &exclu then vardep=&vardepen;
			run;
			
			proc logistic data=tres noprint;
				class &categor;
				model vardep=&categor;
				output out=sal p=predi;
			run;
			
			data sal_final;
				set sal_final sal;
			run;
			
			data sal2;
				set sal;pro=1-predi;
				if pro>0.5 then pre11=1;
				else pre11=0; 
				if grupo=&exclu then output;
			run;
			
			proc freq data=sal2;
				tables pre11*&vardepen/out=sal3;
			run;
			
			data estadisticos (drop=count percent pre11 &vardepen); 
				retain vp vn fp fn suma 0; 
				set sal3 nobs=nume; 
				suma=suma+count; 
				if pre11=0 and &vardepen=0 then vn=count; 
				if pre11=0 and &vardepen=1 then fn=count; 
				if pre11=1 and &vardepen=0 then fp=count; 
				if pre11=1 and &vardepen=1 then vp=count; 
				if _n_=nume then do; 
				porcenVN=vn/suma; 
				porcenFN=FN/suma; 
				porcenVP=VP/suma; 
				porcenFP=FP/suma; 
				sensi=vp/(vp+fn); 
				especif=vn/(vn+fp); 
				tasafallos=1-(vp+vn)/suma; 
				tasaciertos=1-tasafallos; 
				precision=vp/(vp+fp); 
				F_M=2*Sensi*Precision/(Sensi+Precision); 
				output; 
				end; 
			run; 
			
			data fantasma;
				set fantasma estadisticos;
			run;
		%end;
		
		proc means data=fantasma sum noprint;
			var &objetivo;
			output out=sumaresi sum=suma mean=media;
		run;
		
		data sumaresi;
			set sumaresi;
			semilla=&semilla;
		run;
		
		data final (keep=suma media semilla);
			set final sumaresi;
			if suma=. then delete;
		run;
	%end;
	
	proc print data=final;
	run;
%mend;



/* LA MACRO CRUZADABINARIANEURAL GENERA RESULTADOS POR CLASIFICACIÓN BINARIA 
CON RED NEURONAL CON VARIAS SEMILLAS

PARÁMETROS:

archivo
vardepen 	debe de ser variable con dos categorías excluyentes
conti 		lista de variables continuas en el modelo	
categor		lista de variables categóricas en el modelo	
ngrupos		grupos de validación cruzada
sinicio		semilla inicial de aleatorización
sifinal		semilla final de aleatorización
nodos		número de nodos red
algo		algoritmo
objetivo	función objetivo para resumir en archivos y boxplot. Palabras clave:
			
		tasafallos (habitualmente se utilizará esta)
		porcenVN
		porcenFN
		porcenVP
		porcenFP
		sensi
		especif
		tasaciertos
		precision
		F_M
basura 	archivo basura

El archivo llamado final contiene la media y suma de la función objetivo por validación cruzada

NOTA: A VECES EL PROCESO DE OPTIMIZACIÓN ES DEFECTUOSO (EL EARLY STOPPING NO SIEMPRE FUNCIONA BIEN).
SUELE TAMBIÉN HABER CIERTA DEPENDENCIA DE LA SEMILLA INICIAL UTILIZADA PARA LOS PESOS.
EN ESTOS CASOS HABRÁ QUE 
1) UTILIZAR PRELIM
2)CAMBIAR  EL NÚMERO DE ITERACIONES Y/O CAMBIAR EL ALGORITMO
(o sus parámetros, aumentar por ejemplo mom en BPROP)
	
*/


%macro cruzadabinarianeural(archivo=, vardepen=, categor=, ngrupos=, sinicio=, sfinal=, nodos=, algo=, objetivo=, early=, acti=tanh, directorio=);
	title ' ';
	data final;
	run;

	data sal_final;
	run;
	
	proc printto print="&directorio\basura.txt";
	run;

	/* Bucle semillas */
	%do semilla=&sinicio %to &sfinal;
		data dos;
			set &archivo;
			u=ranuni(&semilla);
		run;
		
		proc sort data=dos;
			by u;
		run;
		
		data dos (drop=nume);
			retain grupo 1;
			set dos nobs=nume;
			if _n_> grupo * nume / &ngrupos then grupo = grupo + 1;
		run;
		
		data fantasma;
		run;
		%do exclu=1 %to &ngrupos;
			
			data trestr tresval;
				set dos;
				if grupo ne &exclu then output trestr;
				else output tresval;
			run;
			
			proc dmdb data=trestr dmdbcat=catatres;
				target &vardepen;
				class &categor &vardepen;
			run;
			
			proc neural data=trestr dmdbcat=catatres random=789;
				input &categor /level=nominal;
				target &vardepen /level=nominal;
				hidden &nodos /act=&acti;
				netoptions randist=normal ranscale=0.15 random=15459;
				prelim 15 preiter=10 pretech=&algo;
				%if &early ne %then %do;
					train maxiter=&early outest=mlpest technique=&algo;
				%end;
				%else %do;
					train outest=mlpest technique=&algo;
				%end;
				score data=tresval role=valid out=sal;
			run;
			
			data sal2;
				set sal;
				pro=1-%str(p_&vardepen)0;
				if pro>0.5 then pre11=1;
				else pre11=0;
			run;
			
			data sal_final;
				set sal_final sal;
			run;
			
			proc freq data=sal2;
				tables pre11 * &vardepen /out=sal3;
			run;

			data estadisticos (drop=count percent pre11 &vardepen); 
				retain vp vn fp fn suma 0; 
				set sal3 nobs=nume; 
				suma=suma+count; 
				if pre11=0 and &vardepen=0 then vn=count; 
				if pre11=0 and &vardepen=1 then fn=count; 
				if pre11=1 and &vardepen=0 then fp=count; 
				if pre11=1 and &vardepen=1 then vp=count; 
				if _n_=nume then do; 
					porcenVN=vn/suma; 
					porcenFN=FN/suma; 
					porcenVP=VP/suma; 
					porcenFP=FP/suma; 
					sensi=vp/(vp+fn); 
					especif=vn/(vn+fp); 
					tasafallos=1-(vp+vn)/suma; 
					tasaciertos=1-tasafallos; 
					precision=vp/(vp+fp); 
					F_M=2*Sensi*Precision/(Sensi+Precision); 
					output; 
				end; 
			run; 
			
			data fantasma;
				set fantasma estadisticos;
			run;
		%end;
		
		proc means data=fantasma sum noprint;
			var &objetivo;
			output out=sumaresi sum=suma mean=media;
		run;
		
		data sumaresi;
			set sumaresi;
			semilla=&semilla;
		run;
		
		data final (keep=suma media semilla);
			set final sumaresi;
			if suma=. then delete;
		run;
	%end;
	proc printto; 
	run;
	
	proc print data=final;
	run;
%mend;


/*************************************************************************************

MACRO REDNEURONALBINARIA

PARA OBSERVAR EARLY STOPPING USAR ESTA MACRO, 
PARA OTRAS COSAS MEJOR LAS MACROS BINARIAS BÁSICAS
(ESTA MACRO NO TIENE COMO FUNCIÓN DE ERROR LA TASA DE FALLOS)

MACRO redneuronalbinaria(archivo=,listclass=,listconti=,vardep=,porcen=,semilla=,ocultos=,meto=,acti=);

archivo= archivo de datos
listclass= lista de variables de clase
listconti= lista de variables continuas
vardep=variable dependiente
porcen= porcentaje de training
semilla=semilla para hacer la partición
ocultos=número de nodos ocultos

LA MACRO SE PUEDE CAMBIAR A CONVENIENCIA INTERNAMENTE PARA LAS OPCIONES DE LA RED
PARA CAMBIAR OTROS PARÁMETROS VER LAS MACROS AL FINAL DEL DOCUMENTO

		*************************************************************************************
		NOTA IMPORTANTE:
		*************************************************************************************
		LA FUNCIÓN DE ERROR EN EARLY STOPPING NO ES LA TASA DE FALLOS, 
		ES ENTROPÍA O FUNCIÓN DE ERROR DE BERNOULLI

		suma de 	-[y*log(ygorro)+(1-y)*log(1-ygorro)]

		*************************************************************************************
*************************************************************************************/

%macro redneuronalbinaria(archivo=,listclass=,vardep=,porcen=,semilla=,ocultos=,meto=levmar,acti=);
	proc dmdb data=&archivo dmdbcat=catauno;
		target &vardep;
		class &vardep &listclass;
	run;

	data ooo;
		set &archivo;
	run;
	
	data datos;
		set ooo nobs=nume;
		tr=int(&porcen*nume);
		call symput('tr',left(tr));
		u=ranuni(&semilla);
	run;
	
	proc sort data=datos;
		by u;
	run;
	
	data datos valida;
		set datos;if _n_>tr then output valida;
		else output datos;
	run;

	proc neural data=datos dmdbcat=catauno validata=valida graph;
		input &listclass /level=nominal;
		target &vardep /level=nominal id=o error=ENT;
		hidden &ocultos /id=h act=&acti;
		nloptions maxiter=10000;
		netoptions randist=normal ranscale=0.1 random=15115;
		prelim 0;
		train maxiter=10000 outest=mlpest estiter=1 technique=&meto;
		score data=datos out=mlpout outfit=mlpfit;
		score data=valida out=mlpout2 outfit=mlpfit2 role=valid;
	run;

	data mlpest2 ;
		k=3;
		retain iterepocas 0;
		set mlpest nobs=nume;
		call symput('numeroit',left(nume));
		eval=_VOBJERR_;
		x3=lag3(eval);
		x6=lag6(eval);
		if _n_>6 and eval>x3 and eval>x6 then iterepocas=_n_;
	run;

	data;
		set mlpest2 nobs=nume;
		if iterepocas ne 0 then do;
			call symput('earlystop',left(iterepocas));
			stop;
		end;
		else if _n_=nume and iterepocas=0 then do;
			iterepocas=&numeroit;
			call symput('earlystop',left(iterepocas));
			stop;
		end;
	run;

	data fin;
		j=&earlystop;
		set mlpest point=j;
		output;
		stop;
	run;

	data mlpest;
		set mlpest nobs=nume;
		if _n_=&earlystop then do;
			cosa1=put(_OBJERR_,20.6);
			cosa2=put(_VOBJERR_,20.6);
		end;
		else do;cosa1=' ';cosa2=' ';end;
	run;

	title1 
	h=2 box=1 j=c c=red 'TRAIN' c=blue '  VALIDA' 
	h=1.5 j=c c=black "EARLY STOPPING=&earlystop " "semilla=&semilla" 
	h=1 j=c c=green "NODOS OCULTOS: &ocultos  " " METODO: &meto "  "ACTIVACIÓN: &acti"
	h=1 j=c c=black "EL ERROR ES EL VALOR DE LA ENTROPÍA";

	symbol1 c=red v=circle i=join pointlabel=("#cosa1" h=1 c=red position=bottom  j=c);
	symbol2 c=blue v=circle i=join pointlabel=("#cosa2" h=1 c=blue position=top j=c);

	axis1 label=none;
	proc gplot data=mlpest;
		plot _OBJERR_ *_iter_=1 _VOBJERR_*_iter_=2 /overlay href=&earlystop vaxis=axis1 haxis=axis1;
	run;

	proc print data=fin;
		var  _iter_ _OBJERR_  _AVERR_  _VNOBJ_   _VOBJ_  _VOBJERR_  _VAVERR_;
	run;
%mend;


/* LA MACRO CRUZADARANDOMFORESTBIN REALIZA VALIDACIÓN CRUZADA REPETIDA PARA VARIABLE 
DEPENDIENTE BINARIA

SI SE DESEA HACER BAGGING SIMPLEMENTE SE PONE EL NÚMERO TOTAL DE VARIABLES EN 
EL PARAMETRO variables=

PARÁMETROS:

porcenbag=porcentaje de observaciones en cada iteración
variables=número de variables a sortear en cada nodo
tamhoja=tamaño mínimo de hoja final
maxtrees=iteraciones
maxbranch=divisiones máximas en un nodo
maxdepth=máxima profundidad
pvalor=p-valor para las divisiones de nodos

*/


%macro cruzadarandomforestbin(archivo=,vardep=,categor=,maxtrees=100,variables=3,porcenbag=0.80,maxbranch=2,tamhoja=5,maxdepth=10,pvalor=0.1,ngrupos=4,sinicio=12340,sfinal=12345,objetivo=tasafallos);

	data final;
	run;

	data sal_final;
	run;
	
	%do semilla=&sinicio %to &sfinal;
		data dos;
			set &archivo;
			u=ranuni(&semilla);
		run;
		
		proc sort data=dos;
			by u;
		run;
		
		data dos ;
			retain grupo 1;
			set dos nobs=nume;
			if _n_>grupo*nume/&ngrupos then grupo=grupo+1;
		run;

		data fantasma;
		run;

		%do exclu=1 %to &ngrupos;
			data tres;
				set dos;
				if grupo ne &exclu then vardep=&vardep;
			run;

			ods listing close;
			proc hpforest data=tres maxtrees=&maxtrees vars_to_try=&variables trainfraction=&porcenbag leafsize=&tamhoja maxdepth=&maxdepth alpha=&pvalor exhaustive=5000 missing=useinsearch;
				target vardep/level=nominal;  
				input &categor/level=nominal;
				score out=salo;
			run;
			
			ods listing;
			
			data sal_final;
				set sal_final salo;
			run;

			data salo;
				merge salo tres;
				if p_vardep1>0.5 then pre11=1;else pre11=0;
				if grupo=&exclu;
			run;

			proc freq data=salo;
				tables pre11*&vardep/out=sal3;
			run;
			
			data estadisticos (drop=count percent pre11 &vardep); 
				retain vp vn fp fn suma 0; 
				set sal3 nobs=nume; 
				suma=suma+count; 
				if pre11=0 and &vardep=0 then vn=count; 
				if pre11=0 and &vardep=1 then fn=count; 
				if pre11=1 and &vardep=0 then fp=count; 
				if pre11=1 and &vardep=1 then vp=count; 
				if _n_=nume then do; 
					porcenVN=vn/suma; 
					porcenFN=FN/suma; 
					porcenVP=VP/suma; 
					porcenFP=FP/suma; 
					sensi=vp/(vp+fn); 
					especif=vn/(vn+fp); 
					tasafallos=1-(vp+vn)/suma; 
					tasaciertos=1-tasafallos; 
					precision=vp/(vp+fp); 
					F_M=2*Sensi*Precision/(Sensi+Precision); 
					output; 
				end; 
			run; 
			
			data fantasma;
				set fantasma estadisticos;
			run;

		%end;
		
		proc means data=fantasma sum noprint;
			var &objetivo;
			output out=sumaresi sum=suma mean=media;
		run;
		
		data sumaresi;
			set sumaresi;
			semilla=&semilla;
		run;
		
		data final (keep=suma media semilla);
			set final sumaresi;
			if suma=. then delete;
		run;
	%end;

	proc print data=final;
	run;
%mend;



/********************************************************************
********************************************************************
						CRUZADAbaggingbin
********************************************************************
********************************************************************/

%macro cruzadabaggingbin(archivo=,vardepen=,listcategor=,ngrupos=4,sinicio=12340,sfinal=12345,siniciobag=12340,sfinalbag=12345,porcenbag=0.80,maxbranch=2,nleaves=6,tamhoja=5,reemplazo=1,objetivo=tasafallos);

	data final;
	run;

	data sal_final;
	run;
	
	%do semilla=&sinicio %to &sfinal;

		data dos;
			set &archivo;
			u=ranuni(&semilla);
		run;
		
		proc sort data=dos;
			by u;
		run;
		
		data dos;
			retain grupo 1;
			set dos nobs=nume;
			if _n_>grupo*nume/&ngrupos then grupo=grupo+1;
		run;

		data fantasma;
		run;

		%do exclu=1 %to &ngrupos;
			data tres;
				set dos;
				if grupo ne &exclu then vardep=&vardepen*1;
			run;

			data tresbis trespred;
				set tres;
				if grupo ne &exclu then output tresbis;
				else output trespred;
			run;

			%do sem=&siniciobag %to &sfinalbag;
				data;
					numero=&sem-&siniciobag+1;
					call symput('numero',left(numero));
					total=&sfinalbag-&siniciobag+1;
					call symput('total',left(total));
				run;

				%if &reemplazo=0 %then %do;
					proc surveyselect data=tresbis out=muestra2 outall method=srs seed=&sem samprate=&porcenbag noprint;
					run;
				%end;
				%else %do;
					proc surveyselect data=tresbis out=muestra2 outall method=urs seed=&sem samprate=&porcenbag noprint;
					run;
				%end;
				
				data entreno1;
					set muestra2;
					if selected=1 then output entreno1;
					drop selected;
				run;

				proc arbor data=entreno1 ; 
					input &listcategor/level=nominal;
					target vardep /level=nominal;
					interact largest;
					train maxbranch=&maxbranch leafsize=&tamhoja;
					subtree nleaves=&nleaves;
					score data=trespred out=sal;
				run;
				
				data sal;
					set sal;
					vardepen&numero=p_vardep1;
				run;
			
				data sal_final;
					set sal_final sal;
				run;
				
				%if &numero=1 %then %do;
					data uni;
						set sal;ypredi=vardepen&numero;
						keep ypredi &vardepen;
					run;
				%end;
				%else %do;
					data uni;
						merge uni sal;
						ypredi=vardepen&numero+ypredi;
						keep ypredi &vardepen;
					run;
				%end;
			%end;

			data sal2;
				set uni ;ypredi=ypredi/&total;
				if ypredi>0.5 then pre11=1;
				else pre11=0;
			run;

			proc freq data=sal2;
				tables pre11*&vardepen/out=sal3;
			run;
			data estadisticos (drop=count percent pre11 &vardepen); 
				retain vp vn fp fn suma 0; 
				set sal3 nobs=nume; 
				suma=suma+count; 
				if pre11=0 and &vardepen=0 then vn=count; 
				if pre11=0 and &vardepen=1 then fn=count; 
				if pre11=1 and &vardepen=0 then fp=count; 
				if pre11=1 and &vardepen=1 then vp=count; 
				if _n_=nume then do; 
					porcenVN=vn/suma; 
					porcenFN=FN/suma; 
					porcenVP=VP/suma; 
					porcenFP=FP/suma; 
					sensi=vp/(vp+fn); 
					especif=vn/(vn+fp); 
					tasafallos=1-(vp+vn)/suma; 
					tasaciertos=1-tasafallos; 
					precision=vp/(vp+fp); 
					F_M=2*Sensi*Precision/(Sensi+Precision); 
					output; 
				end; 
			run; 
			
			data fantasma;
				set fantasma estadisticos;
			run;
		%end;
		
		proc means data=fantasma sum noprint;
			var &objetivo;
			output out=sumaresi sum=suma mean=media;
		run;
		
		data sumaresi;
			set sumaresi;
			semilla=&semilla;
		run;
		
		data final (keep=suma media semilla);
			set final sumaresi;
			if suma=. then delete;
		run;
	%end;

	proc print data=final;
	run;
%mend;



/* LA MACRO CRUZADATREEBOOSTBIN REALIZA VALIDACIÓN CRUZADA REPETIDA PARA VARIABLE 
DEPENDIENTE BINARIA

PARÁMETROS:

leafsize=tamaño mínimo de hoja final
iteraciones
shrink=constante v de regularización
maxbranch=divisiones máximas en un nodo
maxdepth=máxima profundidad
mincatsize=minimo número de observaciones var. categórica
minobs=mínimo número de observaciones para dividir un nodo

criterion=ProbF,

*/


%macro cruzadatreeboostbin(archivo=,vardepen=,categor=,ngrupos=,sinicio=,sfinal=,leafsize=5,iteraciones=100,shrink=0.01,maxbranch=2,maxdepth=4,mincatsize=15,minobs=20,objetivo=tasafallos);
	data final;
	run;
		
	data sal_final;
	run;
	
	%do semilla=&sinicio %to &sfinal;
		data dos;
			set &archivo;
			u=ranuni(&semilla);
		run;
		
		proc sort data=dos;
			by u;
		run;
		
		data dos;
			retain grupo 1;
			set dos nobs=nume;
			if _n_>grupo*nume/&ngrupos then grupo=grupo+1;
		run;
		
		data fantasma;
		run;
		
		%do exclu=1 %to &ngrupos;
			data tres;
				set dos;
				if grupo ne &exclu then vardep=&vardepen;
			run;

			proc treeboost data=tres exhaustive=1000 intervaldecimals=max leafsize=&leafsize iterations=&iteraciones maxbranch=&maxbranch maxdepth=&maxdepth mincatsize=&mincatsize missing=useinsearch shrinkage=&shrink splitsize=&minobs;
				input &categor/level=nominal;
				target vardep /level=binary;
				save fit=iteraciones importance=impor model=modelo rules=reglas;
				subseries largest;
				score out=sal;
			run;

			data sal2;
				set sal;
				pro=1-p_vardep0;
				if pro>0.5 then pre11=1; 
				else pre11=0;
				if grupo=&exclu then output;
			run;
			
			data sal_final;
				set sal_final sal;
			run;
			
			proc freq data=sal2;
				tables pre11*&vardepen/out=sal3;
			run;
			
			data estadisticos (drop=count percent pre11 &vardepen); 
				retain vp vn fp fn suma 0; 
				set sal3 nobs=nume; 
				suma=suma+count; 
				if pre11=0 and &vardepen=0 then vn=count; 
				if pre11=0 and &vardepen=1 then fn=count; 
				if pre11=1 and &vardepen=0 then fp=count; 
				if pre11=1 and &vardepen=1 then vp=count; 
				if _n_=nume then do; 
					porcenVN=vn/suma; 
					porcenFN=FN/suma; 
					porcenVP=VP/suma; 
					porcenFP=FP/suma; 
					sensi=vp/(vp+fn); 
					especif=vn/(vn+fp); 
					tasafallos=1-(vp+vn)/suma; 
					tasaciertos=1-tasafallos; 
					precision=vp/(vp+fp); 
					F_M=2*Sensi*Precision/(Sensi+Precision); 
					output; 
				end; 
			run; 
				
			data fantasma;
				set fantasma estadisticos;
			run;
		%end;
		
		proc means data=fantasma sum noprint;
			var &objetivo;
			output out=sumaresi sum=suma mean=media;
		run;
		
		data sumaresi;
			set sumaresi;
			semilla=&semilla;
		run;
		
		data final (keep=suma media semilla);
			set final sumaresi;
			if suma=. then delete;
		run;
	%end;
	
	proc print data=final;
	run;
%mend;

options mprint=0;



/********************************************************************
********************************************************************
						CRUZADASVM

El parámetro C controla el soft margin 
(C más grande, modelo más ajustado, menos sesgo más varianza; C más pequeño, modelo más simple, 
más sesgo menos varianza)

Nota: El parámetro kernel puede ser de las siguientes formas:

kernel=linear
kernel=polynom k_par=2 (2 o 3 grado del polinomio; más alto más complejo)
kernel=RBF k_par=gamma (más bajo, más suavizado, más alto, más agresivo en cuanto a las zonas) 

Para un ejemplo de la interdependencia entre C y gamma 
http://scikit-learn.org/stable/auto_examples/svm/plot_rbf_parameters.html

El procedimiento SVM es experimental y FALLA A MENUDO con kernel RBF

********************************************************************
********************************************************************/

%macro cruzadaSVMbin(archivo=,vardepen=,listclass=,ngrupos=,sinicio=,sfinal=,kernel=linear,c=10,directorio=c:);
	data final;
	run;
		
	data sal_final;
	run;
	
	%do semilla=&sinicio %to &sfinal;
		data dos;
			set &archivo;
			u=ranuni(&semilla);
		run;
		
		proc sort data=dos;
			by u;
		run;
		
		data dos (drop=nume);
			retain grupo 1;
			set dos nobs=nume;
			if _n_>grupo*nume/&ngrupos then grupo=grupo+1;
		run;

		data fantasma;
		run;

		%do exclu=1 %to &ngrupos;

			data tres valida;
				set dos;
				if grupo ne &exclu then do;
					vardep=&vardepen;
					output tres;
				end;
				else output valida;
			run;
			
			proc dmdb data=tres dmdbcat=catatres out=cua;
				target vardep;
				class vardep &listclass;
			run;

			proc svm data=cua dmdbcat=catatres testdata=valida kernel=&kernel testout=sal6 c=&c;
			   var &listclass;
			   target vardep;
			run;
			
			data sal_final;
				set sal_final sal6;
			run;
			
			data sal1(keep=&vardepen predi1 grupo vardep);
				set sal6;
				predi1=_i_;
			run;

			data salbis;
				set sal1;
				if grupo=&exclu;
				if predi1>0.5 then pre1=1;
				if predi1<=0.5 then pre1=0;
			run;

			data salbos;
			run;
			
			proc freq data=salbis noprint;
				tables pre1*&vardepen /out=salconfu;
			run;
			
			data confu1 (keep=tasa1);
				retain buenos 0 malos 0;
				set salconfu nobs=nume;
				if &vardepen=pre1 then buenos=buenos+count;
				if &vardepen ne pre1 then malos=malos+count;
				if _n_=nume then do;
					tasa1=malos/(malos+buenos);
					output;
				end;
			run;
			
			data salbos;
				merge salbos confu1;
			run;

			data fantasma;
				set fantasma salbos;
			run;

		%end;  
		
		proc means data=fantasma noprint;
			var tasa1;
			output out=mediaresi mean=media;
		run;
		
		data mediaresi;
			set mediaresi;
			semilla=&semilla;
		run;
		
		data final (keep=media semilla);
			set final mediaresi;
			if media=. then delete;
		run;
	%end;
	
	proc printto;
	run;
	
	proc print data=final;
	run;
%mend;



/* 
MACRO CRUZADASTACK PARA BINARIA

HACE VALIDACIÓN CRUZADA CON LOS SIGUIENTES MÉTODOS:

RED NEURONAL (parámetro nodos de la macro; cualquier otra especificación 
				de la red como algoritmo, iteraciones, activación, etc. se cambia dentro del código)
LOGÍSTICA

RANDOM FOREST

GRADIENT BOOSTING (párámetros itera y v)

SVM (si no se quiere se pone kernel=0)

1) LA MACRO SE PUEDE CAMBIAR A CONVENIENCIA INTERNAMENTE, SOBRE TODO LOS PARÁMETROS DE LA RED NEURONAL, boosting, etc.

2) SI NO HAY VARIABLES DE CLASE EN EL ARCHIVO:

	A) QUITAR TODOS LOS APARTADOS CLASS O PONER * AL PRINCIPIO PARA QUE APAREZCA COMO COMENTARIO
	B) BORRAR &listclass DE TODA LA MACRO


*/

%macro cruzadastack(archivo=,vardepen=,listclass=,listconti=,ngrupos=,seminicio=,semifinal=,nodos=10,algo=levmar,rediter=100,maxtrees=,vars_to_try=,trainfraction=,leafsize=,maxdepth=,bleafsize=,iterations=,bmaxbranch=,bmaxdepth=,shrinkage=,kernel=linear,c=10);
	data final;
	run;
	
	%do semilla=&seminicio %to &semifinal;
		data dos;
			set &archivo;
			u=ranuni(&semilla);
		run;
		
		proc sort data=dos;
			by u;
		run;

		data dos (drop=nume);
			retain grupo 1;
			set dos nobs=nume;
			if _n_>grupo*nume/&ngrupos then grupo=grupo+1;
		run;

		data fantasma;
		run;
		
		data unionsalfin;
		run;
		
		data unifin;
		run;

		%do exclu=1 %to &ngrupos;
			data tres;
				set dos;
				semilla=&semilla;
				if grupo ne &exclu then vardep=&vardepen*1;
			run;

			proc logistic data=tres noprint;
				class &listclass;
				model vardep=&listconti &listclass;
				score out=saco;
			run;

			data sal1(drop=p_1);
				set saco;
				predi1=p_1;
			run;
			
			proc dmdb data=tres dmdbcat=catatres;
				target vardep ;
				var &listconti;
				class vardep &listclass;
			run;

			proc neural data=tres dmdbcat=catatres;
				input &listconti/ id=i;
				input &listclass /level=nominal;
				target vardep/ id=o level=nominal;
				hidden 10/ id=h act=tanh;
				netoptions randist=normal ranscale=0.15 random=15459;
				prelim 15 preiter=10 ;
				train maxiter=&rediter technique=&algo;
				score data=tres out=salred;
			run;

			data sal2 (keep=&vardepen predi2 grupo vardep semilla);
				set salred;
				predi2=p_vardep1;
			run;

			proc hpforest data=tres
				maxtrees=&maxtrees vars_to_try=&vars_to_try trainfraction=&trainfraction leafsize=&leafsize maxdepth=&maxdepth
				exhaustive=5000 
				missing=useinsearch ;
				target vardep/level=nominal;
				input &listconti/level=interval;   
				input &listclass/level=nominal;
				score out=salo;
			run;

			data sal3 (keep=&vardepen predi3 grupo vardep);
				set salo;
				predi3=p_vardep1;
			run;


			proc treeboost data=tres
				exhaustive=1000 intervaldecimals=max
				leafsize=&bleafsize iterations=&iterations maxbranch=&bmaxbranch
				maxdepth=&bmaxdepth mincatsize=10 missing=useinsearch shrinkage=&shrinkage
				splitsize=10; 
				input &listclass/level=nominal;
				input &listconti/level=interval;
				target vardep /level=binary;
				subseries largest;
				score out=salboost;
			run;
			
			data sal4 (keep=&vardepen predi4 grupo vardep);
				set salboost;predi4=p_vardep1;
			run;

			%if &kernel ne %then %do;
				data tresbis cua;
					set tres;
					if vardep=. then output cua;
					else output tresbis;
				run;

				proc dmdb data=tresbis dmdbcat=catatres out=tresbis;
					target vardep ;
					var &listconti;
					class vardep &listclass;
				run;

				proc svm data=tresbis dmdbcat=catatres testdata=cua kernel=&kernel c=&c testout=sal5 ppred method=psvm;
				   var &listconti &listclass;
				   target vardep;
				run;

				data sal5 (keep=&vardepen predi5 grupo vardep _p_);
					set sal5;
					predi5=_i_*1;
				run;

				data sal5(keep=&vardepen predi5 grupo vardep _p_);
					set tresbis sal5;
				run;
			%end;

			%if &kernel ne %then %do;
				data unionsal (drop=ygorro);
					merge sal1 sal2 sal3 sal4 sal5;
					predi6=(predi1+predi2)/2; /* RED -LOG */
					predi7=(predi1+predi3)/2;/* RED -RFOR */
					predi8=(predi1+predi4)/2;/* RED -BOOST*/
					predi9=(predi2+predi3)/2;/* LOG-RFOR */
					predi10=(predi2+predi4)/2;/* LOG-BOOST */
					predi11=(predi3+predi4)/2;/* RFOR-BOOST */
					predi12=(predi1+predi2+predi3)/3;/* RED -LOG-RFOR */
					predi13=(predi1+predi2+predi4)/3;/* RED -LOG-BOOST*/
					predi14=(predi1+predi3+predi4)/3;/* RED -RFOR-BOOST*/
					predi15=(predi2+predi3+predi4)/3;/* LOG-RFOR-BOOST*/
					predi16=(predi1+predi2+predi3+predi4)/4;/* RED-LOG-RFOR-BOOST*/
					predi17=(predi1*0.2+predi2*0.1+predi3*0.5+predi4*0.2);/* RED-LOG-RFOR-BOOST ponderado*/
					predi18=(predi1+predi5)/2; /* RED -SVM */
					predi19=(predi3+predi5)/2; /* RFOR -SVM */
					predi20=(predi2+predi5)/2; /* LOG-SVM */
					predi21=(predi4+predi5)/2; /* BOOST-SVM */
					predi22=(predi5+predi2+predi3)/3;/* SVM-LOG-RFOR */
					predi23=(predi1+predi2+predi3+predi4+predi5)/4;/* RED-LOG-RFOR-BOOST-SVM*/
				run;
			%end;
			
			%if &kernel ne %then %do;
				data salfin (keep=&vardepen vardep predi1-predi23 grupo);
					set unionsal;
					if grupo=&exclu then output;
				run;

				data unionsalfin;
					set unionsalfin salfin;
				run;

				data salbis;
					array predi{23};
					array pre{23};
					set salfin;
					do i=1 to 23;
					if predi{i}>0.5 then pre{i}=1;
					if predi{i}<=0.5 then pre{i}=0;
					end;
				run;
				
				data salbos;
				run;
				
				%do j=1 %to 23;
					proc freq data=salbis noprint;
						tables pre&j*&vardepen /out=salconfu;
					run;
					
					data confu&j (keep=tasa&j);
						retain buenos 0 malos 0;
						set salconfu nobs=nume;
						if &vardepen=pre&j then buenos=buenos+count;
						if &vardepen ne pre&j then malos=malos+count;
						if _n_=nume then do;
							tasa&j=malos/(malos+buenos);
							output;
						end;
					run;
					
					data salbos;
						merge salbos confu&j;
					run;
				%end;
				
				data fantasma;
					set fantasma salbos;
				run;
			%end;
			%else %do;
				data unionsal (drop=ygorro);
					merge sal1 sal2 sal3 sal4 ;
					predi6=(predi1+predi2)/2; /* RED -LOG */
					predi7=(predi1+predi3)/2;/* RED -RFOR */
					predi8=(predi1+predi4)/2;/* RED -BOOST*/
					predi9=(predi2+predi3)/2;/* LOG-RFOR */
					predi10=(predi2+predi4)/2;/* LOG-BOOST */
					predi11=(predi3+predi4)/2;/* RFOR-BOOST */
					predi12=(predi1+predi2+predi3)/3;/* RED -LOG-RFOR */
					predi13=(predi1+predi2+predi4)/3;/* RED -LOG-BOOST*/
					predi14=(predi1+predi3+predi4)/3;/* RED -RFOR-BOOST*/
					predi15=(predi2+predi3+predi4)/3;/* LOG-RFOR-BOOST*/
					predi16=(predi1+predi2+predi3+predi4)/4;/* RED-LOG-RFOR-BOOST*/
					predi17=(predi1*0.2+predi2*0.1+predi3*0.5+predi4*0.2);/* RED-LOG-RFOR-BOOST ponderado*/
				run;

				data salfin (keep=&vardepen vardep predi1-predi17 grupo);
					set unionsal;
					if grupo=&exclu then output;
				run;

				data unionsalfin;
					set unionsalfin salfin;
				run;

				data salbis;
					array predi{17};
					array pre{17};
					set salfin;
					do i=1 to 17;
						if predi{i}>0.5 then pre{i}=1;
						if predi{i}<=0.5 then pre{i}=0;
					end;
				run;
				
				data salbos;
				run;
				
				%do j=1 %to 17;
					proc freq data=salbis noprint;
						tables pre&j*&vardepen /out=salconfu;
					run;
					
					data confu&j (keep=tasa&j);
						retain buenos 0 malos 0;
						set salconfu nobs=nume;
						if &vardepen=pre&j then buenos=buenos+count;
						if &vardepen ne pre&j then malos=malos+count;
						if _n_=nume then do;
							tasa&j=malos/(malos+buenos);
							output;
						end;
					run;
					
					data salbos;
						merge salbos confu&j;
					run;
				%end;

				data fantasma;
					set fantasma salbos;
				run;
			%end;
		%end;  

		%if &kernel ne %then %do;
			proc means data=fantasma noprint;
				var tasa1-tasa23;
				output out=mediaresi mean=ase1-ase23 ;
			run;
			
			data mediaresi;
				set mediaresi;semilla=&semilla;
			run;
			
			data final (keep=ase1-ase23 semilla);
				set final mediaresi;
				if ASE1=. then delete;
			run;

			data unifin;
				set unifin unionsalfin;
			run;
		%end;  

		%else %do;
			proc means data=fantasma noprint;
				var tasa1-tasa17;
				output out=mediaresi mean=ase1-ase17;
			run;
			
			data mediaresi;
				set mediaresi;
				semilla=&semilla;
			run;
				
			data final (keep=ase1-ase17 semilla);
				set final mediaresi;
				if ASE1=. then delete;
			run;

			data unifin;
				set unifin unionsalfin;
			run;
		%end;
	%end;
	
	proc printto;
	run;
	
	proc print data=final;
	run;
%mend;

