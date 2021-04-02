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
Early Stopping
Stop = 
N = 2
Algo = Bprop
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
	archivo=news_reduced_clean_five_methods,
	vardep=REP_clicked,
	listclass=REP_P31_head REP_P31_tail REP_subcategory,
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
early = 141
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
	early=141,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearlyXn2v5
);

data Results.levtanhearlyXn2v5;
	set final;
run;

data Results.sal_levtanhearlyXn2v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 2
algo = bprop
early = x
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
	algo=bprop,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearlyXn2v5
);

data Results.bproptanhearlyXn2v5;
	set final;
run;

data Results.sal_bproptanhearlyXn2v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 3
algo = levmar
early = x
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
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearlyXn3v5
);

data Results.levtanhearlyXn3v5;
	set final;
run;

data Results.sal_levtanhearlyXn3v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 3
algo = bprop
early = x
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
	algo=bprop,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearlyXn3v5
);

data Results.bproptanhearlyXn3v5;
	set final;
run;

data Results.sal_bproptanhearlyXn3v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 4
algo = levmar
early = x
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=4,
	algo=levmar,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearlyXn4v5
);

data Results.levtanhearlyXn4v5;
	set final;
run;

data Results.sal_levtanhearlyXn4v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 4
algo = bprop
early = x
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=4,
	algo=bprop,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearlyXn4v5
);

data Results.bproptanhearlyXn4v5;
	set final;
run;

data Results.sal_bproptanhearlyXn4v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 5
algo = levmar
early = x
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=5,
	algo=levmar,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearlyXn5v5
);

data Results.levtanhearlyXn5v5;
	set final;
run;

data Results.sal_levtanhearlyXn5v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 5
algo = bprop
early = x
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=5,
	algo=bprop,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearlyXn5v5
);

data Results.bproptanhearlyXn5v5;
	set final;
run;

data Results.sal_bproptanhearlyXn5v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 6
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
	nodos=6,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearlyXn6v5
);

data Results.levtanhearlyXn6v5;
	set final;
run;

data Results.sal_levtanhearlyXn6v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 6
algo = bprop
early = x
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=6,
	algo=bprop,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearlyXn6v5
);

data Results.bproptanhearlyXn6v5;
	set final;
run;

data Results.sal_bproptanhearlyXn6v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 7
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
	nodos=7,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearlyXn7v5
);

data Results.levtanhearlyXn7v5;
	set final;
run;

data Results.sal_levtanhearlyXn7v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 7
algo = bprop
early = x
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=7,
	algo=bprop,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearlyXn7v5
);

data Results.bproptanhearlyXn7v5;
	set final;
run;

data Results.sal_bproptanhearlyXn7v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 8
algo = levmar
early = x
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=8,
	algo=levmar,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearlyXn8v5
);

data Results.levtanhearlyXn8v5;
	set final;
run;

data Results.sal_levtanhearlyXn8v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 8
algo = bprop
early = x
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=8,
	algo=bprop,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearlyXn8v5
);

data Results.bproptanhearlyXn8v5;
	set final;
run;

data Results.sal_bproptanhearlyXn8v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 9
algo = levmar
early = x
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=9,
	algo=levmar,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearlyXn9v5
);

data Results.levtanhearlyXn9v5;
	set final;
run;

data Results.sal_levtanhearlyXn9v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 9
algo = bprop
early = x
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=9,
	algo=bprop,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearlyXn9v5
);

data Results.bproptanhearlyXn9v5;
	set final;
run;

data Results.sal_bproptanhearlyXn9v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 10
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
	nodos=10,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearlyXn10v5
);

data Results.levtanhearlyXn10v5;
	set final;
run;

data Results.sal_levtanhearlyXn10v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 10
algo = bprop
early = x
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=10,
	algo=bprop,
	objetivo=tasafallos,
	early=x,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearlyXn10v5
);

data Results.bproptanhearlyXn10v5;
	set final;
run;

data Results.sal_bproptanhearlyXn10v5;
	set sal_final;
run;
