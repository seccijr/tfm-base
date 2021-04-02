%include 'C:\Users\secci\Workspace\TFM\Base\binary pack.sas';

data news_reduced_clean_five_methods; 
	set 'C:\Users\secci\Workspace\TFM\Lib\news_reduced_clean_five_methods.sas7bdat'; 
run;

libname Results 'C:\Users\secci\Workspace\TFM\Lib\Results';

/*
Variables 5 methods

REP_clicked
REP_P31_head REP_P31_tail REP_subcategory

*/

/*
Logistic
seeds = 10
groups = 4
*/
%cruzadalogistica(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	objetivo=Area
);

data Results.llv5;
	set final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 2
algo = levmar
early = None
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=2,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\levtanhearly680n2v5
);

data Results.levtanhearly680n2v5;
	set final;
run;

data Results.sal_levtanhearly680n2v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 3
algo = levmar
early = None
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=3,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\levtanhearly0n3v5
);

data Results.levtanhearly0n3v5;
	set final;
run;

data Results.sal_levtanhearly0n3v5;
	set sal_final;
run;

/*
Early Stopping
Stop = 
N = 2
Algo = Levmar
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=2,
	meto=levmar,
	acti=tanh
);

/*
Red Neuronal
groups = 4
seeds = 10
n = 2
algo = levmar
early = 
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=2,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\levtanhearly0n2v5
);

data Results.levtanhearly0n2v5;
	set final;
run;

data Results.sal_levtanhearly0n2v5;
	set sal_final;
run;

/*
Gradient Boosting news_reduced_clean_five_methods las variables
shrink = 0.03
depth = 4
trees = 100
category size = 15
split size = 20
seeds = 31
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadatreeboostbin(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12375,
	leafsize=5,
	iteraciones=100,
	shrink=0.03,
	maxbranch=2,
	maxdepth=4,
	mincatsize=15,
	minobs=20,
	objetivo=tasafallos
);

data Results.gb003v5;
	set final;
run;

data Results.sal_gb003v5;
	set sal_final;
run;

/*
Gradient Boosting news_reduced_clean_five_methods las variables
shrink = 0.1
depth = 4
trees = 100
category size = 15
split size = 20
seeds = 31
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadatreeboostbin(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12375,
	leafsize=5,
	iteraciones=100,
	shrink=0.1,
	maxbranch=2,
	maxdepth=4,
	mincatsize=15,
	minobs=20,
	objetivo=tasafallos
);

data Results.gb01v5;
	set final;
run;

data Results.sal_gb01v5;
	set sal_final;
run;

/*
Gradient Boosting news_reduced_clean_five_methods las variables
shrink = 0.1
depth = 6
trees = 100
category size = 15
split size = 20
seeds = 31
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadatreeboostbin(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12375,
	leafsize=5,
	iteraciones=100,
	shrink=0.1,
	maxbranch=2,
	maxdepth=6,
	mincatsize=15,
	minobs=20,
	objetivo=tasafallos
);

data Results.gbd601v5;
	set final;
run;

data Results.sal_gbd601v5;
	set sal_final;
run;

/*
Gradient Boosting news_reduced_clean_five_methods las variables
shrink = 0.001
depth = 4
trees = 100
category size = 15
split size = 20
seeds = 31
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadatreeboostbin(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12375,
	leafsize=5,
	iteraciones=100,
	shrink=0.001,
	maxbranch=2,
	maxdepth=4,
	mincatsize=15,
	minobs=20,
	objetivo=tasafallos
);

data Results.gb0001v5;
	set final;
run;

data Results.sal_gb0001v5;
	set sal_final;
run;

/*
Bagging news_reduced_clean_five_methods las variables
maxbranch = 2
depth = 4
nleaves = 6
tamhoja = 5
seeds = 31
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabaggingbin(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	listcategor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12375,
	siniciobag=12345,
	sfinalbag=12375,
	porcenbag=0.80,
	maxbranch=2,
	nleaves=6,
	tamhoja=5,
	reemplazo=1,
	objetivo=tasafallos
);

data Results.bagn6m5v5;
	set final;
run;

data Results.sal_bagn6m5v5;
	set sal_final;
run;

/*
Random Forest news_reduced_clean_five_methods las variables
maxtrees = 100
variables = 6
seeds = 31
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadarandomforestbin(
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	maxtrees=100,
	variables=6,
	porcenbag=0.80,
	maxbranch=2,
	tamhoja=5,
	maxdepth=10,
	pvalor=0.1,
	sinicio=12345,
	sfinal=12375,
	objetivo=tasafallos
);

data Results.rfnt100var6v5;
	set final;
run;

data Results.sal_rfnt100var6v5;
	set sal_final;
run;

/*
Random Forest news_reduced_clean_five_methods las variables
maxtrees = 200
variables = 12
seeds = 31
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadarandomforestbin(
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	maxtrees=200,
	variables=12,
	porcenbag=0.80,
	maxbranch=2,
	tamhoja=5,
	maxdepth=10,
	pvalor=0.1,
	sinicio=12345,
	sfinal=12375,
	objetivo=tasafallos
);

data Results.rfnt200var12v5;
	set final;
run;

data Results.sal_rfnt200var12v5;
	set sal_final;
run;

