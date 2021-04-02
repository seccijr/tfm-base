%include 'C:\Users\secci\Workspace\TFM\Base\binary pack.sas';


data mind; 
	set 'C:\Users\secci\Workspace\TFM\Lib\news.sas7bdat'; 
run;

/*
Validación cruzada de Gradient Boosting sel5 las variables
shrink = 0.03
depth = 4
trees = 100
category size = 15
split size = 20
seeds = 31
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(Número de muestras)]
*/
%cruzadatreeboostbin(
	archivo=mind,
	vardepen=clicked,
	conti=,
	categor=category subcategory P102_head P102_tail P103_head P103_tail P1050_head P1050_tail P106_head P106_tail P118_head P118_tail P131_head P131_tail P1340_head P1340_tail P1343_head P1343_tail P1411_head P1411_tail P1412_head P1412_tail P1532_head P1532_tail P1622_head P1622_tail P166_head P166_tail P17_head P17_tail P172_head P172_tail P1884_head P1884_tail P206_head P206_tail P21_head P21_tail P27_head P27_tail P2936_head P2936_tail P30_head P30_tail P31_head P31_tail P361_head P361_tail P37_head P37_tail P39_head P39_tail P421_head P421_tail P463_head P463_tail P495_head P495_tail P5008_head P5008_tail P530_head P530_tail P552_head P552_tail P641_head P641_tail P6886_head P6886_tail P937_head P937_tail,
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

data lib.gb003;
	length modelo $256;
	set final;
	modelo='GB-003';
run;
