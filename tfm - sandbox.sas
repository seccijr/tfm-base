%include 'C:\Users\secci\Workspace\TFM\Base\binary pack.sas';


data news_reduced_clean; 
	set 'C:\Users\secci\Workspace\TFM\Lib\news_reduced_clean.sas7bdat'; 
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
Validaci�n cruzada de Regresi�n Lineal 
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
Validaci�n cruzada de Red neuronal sel1 las variables
groups = 4
seeds = 31
n = 2
algo = levmar
early = 0
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N�mero de muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean,
	vardepen=REP_clicked,
	categor=REP_P102_head REP_P106_tail REP_P131_tail REP_P1340_tail REP_P1343_tail REP_P1532_head REP_P166_tail REP_P172_head REP_P17_tail REP_P206_tail REP_P27_tail REP_P2936_tail REP_P31_head REP_P31_tail REP_P361_tail REP_P37_head REP_P421_tail REP_P463_tail REP_P641_tail REP_P6886_head REP_category REP_subcategory,
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
