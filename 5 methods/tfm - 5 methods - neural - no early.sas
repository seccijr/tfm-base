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
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearly0n2v5
);

data Results.levtanhearly0n2v5;
	set final;
run;

data Results.sal_levtanhearly0n2v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 2
algo = bprop
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
	algo=bprop,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearly0n2v5
);

data Results.bproptanhearly0n2v5;
	set final;
run;

data Results.sal_bproptanhearly0n2v5;
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
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearly0n3v5
);

data Results.levtanhearly0n3v5;
	set final;
run;

data Results.sal_levtanhearly0n3v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 3
algo = bprop
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
	algo=bprop,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearly0n3v5
);

data Results.bproptanhearly0n3v5;
	set final;
run;

data Results.sal_bproptanhearly0n3v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 4
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
	nodos=4,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearly0n4v5
);

data Results.levtanhearly0n4v5;
	set final;
run;

data Results.sal_levtanhearly0n4v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 4
algo = bprop
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
	nodos=4,
	algo=bprop,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearly0n4v5
);

data Results.bproptanhearly0n4v5;
	set final;
run;

data Results.sal_bproptanhearly0n4v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 5
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
	nodos=5,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearly0n5v5
);

data Results.levtanhearly0n5v5;
	set final;
run;

data Results.sal_levtanhearly0n5v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 5
algo = bprop
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
	nodos=5,
	algo=bprop,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearly0n5v5
);

data Results.bproptanhearly0n5v5;
	set final;
run;

data Results.sal_bproptanhearly0n5v5;
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
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearly0n6v5
);

data Results.levtanhearly0n6v5;
	set final;
run;

data Results.sal_levtanhearly0n6v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 6
algo = bprop
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
	algo=bprop,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearly0n6v5
);

data Results.bproptanhearly0n6v5;
	set final;
run;

data Results.sal_bproptanhearly0n6v5;
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
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearly0n7v5
);

data Results.levtanhearly0n7v5;
	set final;
run;

data Results.sal_levtanhearly0n7v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 7
algo = bprop
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
	algo=bprop,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearly0n7v5
);

data Results.bproptanhearly0n7v5;
	set final;
run;

data Results.sal_bproptanhearly0n7v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 8
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
	nodos=8,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearly0n8v5
);

data Results.levtanhearly0n8v5;
	set final;
run;

data Results.sal_levtanhearly0n8v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 8
algo = bprop
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
	nodos=8,
	algo=bprop,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearly0n8v5
);

data Results.bproptanhearly0n8v5;
	set final;
run;

data Results.sal_bproptanhearly0n8v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 9
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
	nodos=9,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearly0n9v5
);

data Results.levtanhearly0n9v5;
	set final;
run;

data Results.sal_levtanhearly0n9v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 9
algo = bprop
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
	nodos=9,
	algo=bprop,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearly0n9v5
);

data Results.bproptanhearly0n9v5;
	set final;
run;

data Results.sal_bproptanhearly0n9v5;
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
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\levtanhearly0n10v5
);

data Results.levtanhearly0n10v5;
	set final;
run;

data Results.sal_levtanhearly0n10v5;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 10
algo = bprop
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
	algo=bprop,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\5 methods\Tmp\bproptanhearly0n10v5
);

data Results.bproptanhearly0n10v5;
	set final;
run;

data Results.sal_bproptanhearly0n10v5;
	set sal_final;
run;