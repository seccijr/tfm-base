%include 'C:\Users\secci\Workspace\TFM\Base\binary pack.sas';

data news_reduced_clean_four_methods; 
	set 'C:\Users\secci\Workspace\TFM\Lib\news_reduced_clean_four_methods.sas7bdat'; 
run;

libname Results 'C:\Users\secci\Workspace\TFM\Lib\Results';

/*
Variables 4 methods

REP_clicked
REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory

*/

/*
Logistic
seeds = 10
groups = 4
*/
%cruzadalogistica(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	objetivo=tasafallos
);

data Results.llv4;
	set final;
run;

data Results.sal_llv4;
	set sal_final;
run;

/*
Gradient Boosting news_reduced_clean_four_methods las variables
shrink = 0.03
depth = 4
trees = 100
category size = 15
split size = 20
seeds = 10
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadatreeboostbin(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	leafsize=5,
	iteraciones=100,
	shrink=0.03,
	maxbranch=2,
	maxdepth=4,
	mincatsize=15,
	minobs=20,
	objetivo=tasafallos
);

data Results.gb003v4;
	set final;
run;

data Results.sal_gb003v4;
	set sal_final;
run;

/*
Gradient Boosting news_reduced_clean_four_methods las variables
shrink = 0.1
depth = 4
trees = 100
category size = 15
split size = 20
seeds = 10
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadatreeboostbin(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	leafsize=5,
	iteraciones=100,
	shrink=0.1,
	maxbranch=2,
	maxdepth=4,
	mincatsize=15,
	minobs=20,
	objetivo=tasafallos
);

data Results.gb01v4;
	set final;
run;

data Results.sal_gb01v4;
	set sal_final;
run;

/*
Gradient Boosting news_reduced_clean_four_methods las variables
shrink = 0.1
depth = 6
trees = 100
category size = 15
split size = 20
seeds = 10
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadatreeboostbin(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	leafsize=5,
	iteraciones=100,
	shrink=0.1,
	maxbranch=2,
	maxdepth=6,
	mincatsize=15,
	minobs=20,
	objetivo=tasafallos
);

data Results.gbd601v4;
	set final;
run;

data Results.sal_gbd601v4;
	set sal_final;
run;

/*
Gradient Boosting news_reduced_clean_four_methods las variables
shrink = 0.001
depth = 4
trees = 100
category size = 15
split size = 20
seeds = 10
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadatreeboostbin(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	leafsize=5,
	iteraciones=100,
	shrink=0.001,
	maxbranch=2,
	maxdepth=4,
	mincatsize=15,
	minobs=20,
	objetivo=tasafallos
);

data Results.gb0001v4;
	set final;
run;

data Results.sal_gb0001v4;
	set sal_final;
run;

/*
Bagging news_reduced_clean_four_methods las variables
maxbranch = 2
depth = 4
nleaves = 6
tamhoja = 5
seeds = 10
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabaggingbin(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	listcategor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	siniciobag=12345,
	sfinalbag=12354,
	porcenbag=0.80,
	maxbranch=2,
	nleaves=6,
	tamhoja=5,
	reemplazo=1,
	objetivo=tasafallos
);

data Results.bagn6m5v4;
	set final;
run;

data Results.sal_bagn6m5v4;
	set sal_final;
run;

/*
Random Forest news_reduced_clean_four_methods las variables
maxtrees = 100
variables = 6
seeds = 10
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadarandomforestbin(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	maxtrees=100,
	variables=6,
	porcenbag=0.80,
	maxbranch=2,
	tamhoja=5,
	maxdepth=10,
	pvalor=0.1,
	sinicio=12345,
	sfinal=12354,
	objetivo=tasafallos
);

data Results.rfnt100var6v4;
	set final;
run;

data Results.sal_rfnt100var6v4;
	set sal_final;
run;

/*
Random Forest news_reduced_clean_four_methods las variables
maxtrees = 200
variables = 12
seeds = 10
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadarandomforestbin(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	maxtrees=200,
	variables=12,
	porcenbag=0.80,
	maxbranch=2,
	tamhoja=5,
	maxdepth=10,
	pvalor=0.1,
	sinicio=12345,
	sfinal=12354,
	objetivo=tasafallos
);

data Results.rfnt200var12v4;
	set final;
run;

data Results.sal_rfnt200var12v4;
	set sal_final;
run;

