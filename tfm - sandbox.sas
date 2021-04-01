%include 'C:\Users\secci\Workspace\TFM\Base\binary pack.sas';


data news_reduced_clean_2_methods; 
	set 'C:\Users\secci\Workspace\TFM\Lib\news_reduced_clean_two_methods.sas7bdat'; 
run;

data news_reduced_clean_3_methods; 
	set 'C:\Users\secci\Workspace\TFM\Lib\news_reduced_clean_three_methods.sas7bdat'; 
run;

data news_reduced_clean_4_methods; 
	set 'C:\Users\secci\Workspace\TFM\Lib\news_reduced_clean_four_methods.sas7bdat'; 
run;

libname Lib 'C:\Users\secci\Workspace\TFM\Lib';

/*
Variables 2 methods

REP_clicked
REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory 

*/
			
proc logistic data = news_reduced_clean;
	class REP_clicked REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory;
	model REP_clicked=REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory / OUTROC = ROC;
    ROC;
    ODS OUTPUT ROCASSOCIATION = AUC;
run;

PROC PRINT DATA=AUC NOOBS LABEL;
    WHERE ROCMODEL = 'Model';
    VAR AREA;
RUN;

data Lib.PruebaEstadisticos;
	set AUC (where = (ROCMODEL = 'Model') keep = Area);
	output;
run;

/*
Validación cruzada de Regresión Lineal 
seeds = 10
groups = 4
*/
%cruzadalogistica(
	archivo=news_reduced_clean,
	vardepen=REP_clicked,
	categor=REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12346,
	objetivo=Area
);

/*
Validación cruzada de Red neuronal sel1 las variables
groups = 4
seeds = 31
n = 2
algo = levmar
early = 0
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(Número de muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean,
	vardepen=REP_clicked,
	categor=REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory,
	ngrupos=2,
	sinicio=12345,
	sfinal=12345,
	nodos=1,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\tmp
);

%cruzadaSVMbin(
	archivo=news_reduced_clean_2_methods,
	vardepen=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=2,
	sinicio=12345,
	sfinal=12345,
	kernel=polynom k_par=2,
	c=10
);


%cruzadaSVMbin(
	archivo=news_reduced_clean_4_methods,
	vardepen=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=2,
	sinicio=12345,
	sfinal=12345,
	kernel=polynom k_par=2,
	c=10
);

data dos;
	set news_reduced_clean_4_methods;
	u=ranuni(12345);
run;

proc sort data=dos;
	by u;
run;

data dos (drop=nume);
	retain grupo 1;
	set dos nobs=nume;
	if _n_>grupo*nume/4 then grupo=grupo+1;
run;

data tres valida;
	set dos;
	if grupo ne 1 then do;
		vardep=REP_clicked;
		output tres;
	end;
	else output valida;
run;

proc dmdb data=tres dmdbcat=catatres out=cua;
	target vardep ;
	class vardep REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory;
run;

proc svm data=cua dmdbcat=catatres testdata=valida kernel=polynom k_par=2 testout=sal6 c=1;
   var REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory;
   target vardep;
run;
