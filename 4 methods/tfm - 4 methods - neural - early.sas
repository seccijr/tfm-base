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
Early Stopping
Stop = 
N = 2
Algo = Levmar
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=2,
	meto=levmar,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 2
Algo = Bprop
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=2,
	meto=bprop,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 3
Algo = Levmar
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=3,
	meto=levmar,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 3
Algo = Bprop
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=3,
	meto=bprop,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 4
Algo = Levmar
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=4,
	meto=levmar,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 4
Algo = Bprop
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=4,
	meto=bprop,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 5
Algo = Levmar
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=5,
	meto=levmar,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 5
Algo = Bprop
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=5,
	meto=bprop,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 6
Algo = Levmar
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=6,
	meto=levmar,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 6
Algo = Bprop
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=6,
	meto=bprop,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 7
Algo = Levmar
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=7,
	meto=levmar,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 7
Algo = Bprop
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=7,
	meto=bprop,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 8
Algo = Levmar
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=8,
	meto=levmar,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 8
Algo = Bprop
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=8,
	meto=bprop,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 9
Algo = Levmar
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=9,
	meto=levmar,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 9
Algo = Bprop
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=9,
	meto=bprop,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 10
Algo = Levmar
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=10,
	meto=levmar,
	acti=tanh
);

/*
Early Stopping
Stop = 
N = 10
Algo = Bprop
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_four_methods,
	vardep=REP_clicked,
	listclass=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=10,
	meto=bprop,
	acti=tanh
);

/*
Red Neuronal
groups = 4
seeds = 10
n = 2
algo = levmar
early = 234
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=2,
	algo=levmar,
	objetivo=tasafallos,
	early=234,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\levtanhearlyXn2v4
);

data Results.levtanhearlyXn2v4;
	set final;
run;

data Results.sal_levtanhearlyXn2v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 2
algo = bprop
early = 13
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=2,
	algo=bprop,
	objetivo=tasafallos,
	early=13,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\bproptanhearlyXn2v4
);

data Results.bproptanhearlyXn2v4;
	set final;
run;

data Results.sal_bproptanhearlyXn2v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 3
algo = levmar
early = 431
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=3,
	algo=levmar,
	objetivo=tasafallos,
	early=431,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\levtanhearlyXn3v4
);

data Results.levtanhearlyXn3v4;
	set final;
run;

data Results.sal_levtanhearlyXn3v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 3
algo = bprop
early = 13
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=3,
	algo=bprop,
	objetivo=tasafallos,
	early=13,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\bproptanhearlyXn3v4
);

data Results.bproptanhearlyXn3v4;
	set final;
run;

data Results.sal_bproptanhearlyXn3v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 4
algo = levmar
early = 504
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=4,
	algo=levmar,
	objetivo=tasafallos,
	early=504,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\levtanhearlyXn4v4
);

data Results.levtanhearlyXn4v4;
	set final;
run;

data Results.sal_levtanhearlyXn4v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 4
algo = bprop
early = 13
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=4,
	algo=bprop,
	objetivo=tasafallos,
	early=13,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\bproptanhearlyXn4v4
);

data Results.bproptanhearlyXn4v4;
	set final;
run;

data Results.sal_bproptanhearlyXn4v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 5
algo = levmar
early = 541
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=5,
	algo=levmar,
	objetivo=tasafallos,
	early=541,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\levtanhearlyXn5v4
);

data Results.levtanhearlyXn5v4;
	set final;
run;

data Results.sal_levtanhearlyXn5v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 5
algo = bprop
early = 13
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=5,
	algo=bprop,
	objetivo=tasafallos,
	early=13,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\bproptanhearlyXn5v4
);

data Results.bproptanhearlyXn5v4;
	set final;
run;

data Results.sal_bproptanhearlyXn5v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 6
algo = levmar
early = 136
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=6,
	algo=levmar,
	objetivo=tasafallos,
	early=136,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\levtanhearlyXn6v4
);

data Results.levtanhearlyXn6v4;
	set final;
run;

data Results.sal_levtanhearlyXn6v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 6
algo = bprop
early = 13
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=6,
	algo=bprop,
	objetivo=tasafallos,
	early=13,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\bproptanhearlyXn6v4
);

data Results.bproptanhearlyXn6v4;
	set final;
run;

data Results.sal_bproptanhearlyXn6v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 7
algo = levmar
early = 652
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=7,
	algo=levmar,
	objetivo=tasafallos,
	early=652,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\levtanhearlyXn7v4
);

data Results.levtanhearlyXn7v4;
	set final;
run;

data Results.sal_levtanhearlyXn7v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 7
algo = bprop
early = 13
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=7,
	algo=bprop,
	objetivo=tasafallos,
	early=13,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\bproptanhearlyXn7v4
);

data Results.bproptanhearlyXn7v4;
	set final;
run;

data Results.sal_bproptanhearlyXn7v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 8
algo = levmar
early = 84
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=8,
	algo=levmar,
	objetivo=tasafallos,
	early=84,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\levtanhearlyXn8v4
);

data Results.levtanhearlyXn8v4;
	set final;
run;

data Results.sal_levtanhearlyXn8v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 8
algo = bprop
early = 13
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=8,
	algo=bprop,
	objetivo=tasafallos,
	early=13,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\bproptanhearlyXn8v4
);

data Results.bproptanhearlyXn8v4;
	set final;
run;

data Results.sal_bproptanhearlyXn8v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 9
algo = levmar
early = 123
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=9,
	algo=levmar,
	objetivo=tasafallos,
	early=123,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\levtanhearlyXn9v4
);

data Results.levtanhearlyXn9v4;
	set final;
run;

data Results.sal_levtanhearlyXn9v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 9
algo = bprop
early = 13
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=9,
	algo=bprop,
	objetivo=tasafallos,
	early=13,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\bproptanhearlyXn9v4
);

data Results.bproptanhearlyXn9v4;
	set final;
run;

data Results.sal_bproptanhearlyXn9v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 10
algo = levmar
early = 62
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=10,
	algo=levmar,
	objetivo=tasafallos,
	early=62,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\levtanhearlyXn10v4
);

data Results.levtanhearlyXn10v4;
	set final;
run;

data Results.sal_levtanhearlyXn10v4;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 10
algo = bprop
early = 13
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_four_methods,
	vardepen=REP_clicked,
	categor=REP_P1343_tail REP_P17_tail REP_P27_tail REP_P31_head REP_P31_tail REP_P361_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=10,
	algo=bprop,
	objetivo=tasafallos,
	early=13,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\4 methods\Tmp\bproptanhearlyXn10v4
);

data Results.bproptanhearlyXn10v4;
	set final;
run;

data Results.sal_bproptanhearlyXn10v4;
	set sal_final;
run;
