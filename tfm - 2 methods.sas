%include 'C:\Users\secci\Workspace\TFM\Base\binary pack.sas';

data news_reduced_clean_two_methods; 
	set 'C:\Users\secci\Workspace\TFM\Lib\news_reduced_clean_two_methods.sas7bdat'; 
run;

libname Results 'C:\Users\secci\Workspace\TFM\Lib\Results';

/*
Variables 2 methods

REP_clicked
REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory

*/

/*
Logistic
seeds = 10
groups = 4
*/
%cruzadalogistica(
	archivo=news_reduced_clean_two_methods,
	vardepen=REP_clicked,
	categor=REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	objetivo=Area
);

data Results.llv2;
	set final;
run;

/*
Early Stopping
Stop = 680
N = 2
Algo = Levmar
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_two_methods,
	vardep=REP_clicked,
	listclass=REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory,
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
early = 680
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_two_methods,
	vardepen=REP_clicked,
	categor=REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=2,
	algo=levmar,
	objetivo=tasafallos,
	early=680,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\tmp
);

data Results.levtanhearly680n2v2;
	set final;
run;

data Results.sal_levtanhearly680n2v2;
	set sal_final;
run;

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
	archivo=news_reduced_clean_two_methods,
	vardepen=REP_clicked,
	categor=REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=2,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\tmp
);

data Results.levtanhearly0n2v2;
	set final;
run;

data Results.sal_levtanhearly0n2v2;
	set sal_final;
run;

/*
Early Stopping
Stop = 
N = 3
Algo = Levmar
Acti = Tanh
*/
%redneuronalbinaria(
	archivo=news_reduced_clean_two_methods,
	vardep=REP_clicked,
	listclass=REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory,
	porcen=0.8,
	semilla=12345,
	ocultos=3,
	meto=levmar,
	acti=tanh
);

/*
Red Neuronal
groups = 4
seeds = 10
n = 3
algo = levmar
early = 
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_two_methods,
	vardepen=REP_clicked,
	categor=REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=3,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\tmp
);

data Results.levtanhearly0n3v2;
	set final;
run;

data Results.sal_levtanhearly0n3v2;
	set sal_final;
run;

/*
Red Neuronal
groups = 4
seeds = 10
n = 3
algo = levmar
early = 
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabinarianeural(
	archivo=news_reduced_clean_two_methods,
	vardepen=REP_clicked,
	categor=REP_P102_head REP_P103_head REP_P103_tail REP_P1050_head REP_P1050_tail REP_P106_head REP_P106_tail REP_P118_head REP_P131_tail REP_P1340_tail REP_P1343_head REP_P1343_tail REP_P1412_head REP_P1412_tail REP_P1532_head REP_P1622_head REP_P166_head REP_P166_tail REP_P172_head REP_P172_tail REP_P17_tail REP_P1884_tail REP_P206_head REP_P206_tail REP_P21_head REP_P27_tail REP_P2936_head REP_P2936_tail REP_P30_head REP_P30_tail REP_P31_head REP_P31_tail REP_P361_head REP_P361_tail REP_P37_head REP_P37_tail REP_P39_tail REP_P421_tail REP_P463_tail REP_P495_head REP_P5008_head REP_P5008_tail REP_P552_tail REP_P641_tail REP_P6886_head REP_P6886_tail REP_P937_head REP_P937_tail REP_category REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	nodos=3,
	algo=levmar,
	objetivo=tasafallos,
	early=,
	acti=tanh,
	directorio=C:\Users\secci\Workspace\TFM\Base\tmp
);

data Results.levtanhearly0n3v2;
	set final;
run;

data Results.sal_levtanhearly0n3v2;
	set sal_final;
run;

/*
Gradient Boosting sel1 las variables
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
	archivo=sel1,
	vardepen=result,
	conti=assists cspm damagetochampions deaths dragons earned_gpm earnedgold goldspent gspd inhibitors kills monsterkillsenemyjungle opp_csat15 opp_elders opp_inhibitors opp_towers team_kpm totalgold towers,
	categor=T10_game_side T1_game_side T2_game_side T3_game_side T4_game_side T5_game_side T6_game_side T7_game_side T8_game_side T9_game_side firsttothreetowers,
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

data Results.gb003v2;
	set final;
run;

/*
Gradient Boosting sel1 las variables
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
	archivo=sel1,
	vardepen=result,
	conti=assists cspm damagetochampions deaths dragons earned_gpm earnedgold goldspent gspd inhibitors kills monsterkillsenemyjungle opp_csat15 opp_elders opp_inhibitors opp_towers team_kpm totalgold towers,
	categor=T10_game_side T1_game_side T2_game_side T3_game_side T4_game_side T5_game_side T6_game_side T7_game_side T8_game_side T9_game_side firsttothreetowers,
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

data Results.gb01v1;
	length modelo $256;
	set final;
	modelo='GB-01-V1';
run;

/*
Gradient Boosting sel1 las variables
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
	archivo=sel1,
	vardepen=result,
	conti=assists cspm damagetochampions deaths dragons earned_gpm earnedgold goldspent gspd inhibitors kills monsterkillsenemyjungle opp_csat15 opp_elders opp_inhibitors opp_towers team_kpm totalgold towers,
	categor=T10_game_side T1_game_side T2_game_side T3_game_side T4_game_side T5_game_side T6_game_side T7_game_side T8_game_side T9_game_side firsttothreetowers,
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

data Results.gbd601v1;
	length modelo $256;
	set final;
	modelo='GB-D6-01-V1';
run;

/*
Gradient Boosting sel1 las variables
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
	archivo=sel1,
	vardepen=result,
	conti=assists cspm damagetochampions deaths dragons earned_gpm earnedgold goldspent gspd inhibitors kills monsterkillsenemyjungle opp_csat15 opp_elders opp_inhibitors opp_towers team_kpm totalgold towers,
	categor=T10_game_side T1_game_side T2_game_side T3_game_side T4_game_side T5_game_side T6_game_side T7_game_side T8_game_side T9_game_side firsttothreetowers,
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

data Results.gb0001v1;
	length modelo $256;
	set final;
	modelo='GB-0001-V1';
run;

/*
Bagging sel1 las variables
maxbranch = 2
depth = 4
nleaves = 6
tamhoja = 5
seeds = 31
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadabaggingbin(
	archivo=sel1,
	vardepen=result,
	listconti=assists cspm damagetochampions deaths dragons earned_gpm earnedgold goldspent gspd inhibitors kills monsterkillsenemyjungle opp_csat15 opp_elders opp_inhibitors opp_towers team_kpm totalgold towers,
	listcategor=T10_game_side T1_game_side T2_game_side T3_game_side T4_game_side T5_game_side T6_game_side T7_game_side T8_game_side T9_game_side firsttothreetowers,
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

data Results.bagn6m5v1;
	length modelo $256;
	set final;
	modelo='BAG-N6-M5-V1';
run;

/*
Random Forest sel1 las variables
maxtrees = 100
variables = 6
seeds = 31
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadarandomforestbin(
	archivo=sel1,
	vardep=result,
	conti=assists cspm damagetochampions deaths dragons earned_gpm earnedgold goldspent gspd inhibitors kills monsterkillsenemyjungle opp_csat15 opp_elders opp_inhibitors opp_towers team_kpm totalgold towers,
	categor=T10_game_side T1_game_side T2_game_side T3_game_side T4_game_side T5_game_side T6_game_side T7_game_side T8_game_side T9_game_side firsttothreetowers,
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

data Results.rfnt100nv6v1;
	length modelo $256;
	set final;
	modelo='RF-NT100-NV6-V1';
run;

/*
Random Forest sel1 las variables
maxtrees = 200
variables = 12
seeds = 31
groups = 4
Esta macro me devuelve la media de la tasa de fallos = 1 - (Tasa de aciertos) = 1 - [(Verdaderos Positivos + Verdaderos Negativos)/(N Muestras)]
*/
%cruzadarandomforestbin(
	archivo=sel1,
	vardep=result,
	conti=assists cspm damagetochampions deaths dragons earned_gpm earnedgold goldspent gspd inhibitors kills monsterkillsenemyjungle opp_csat15 opp_elders opp_inhibitors opp_towers team_kpm totalgold towers,
	categor=T10_game_side T1_game_side T2_game_side T3_game_side T4_game_side T5_game_side T6_game_side T7_game_side T8_game_side T9_game_side firsttothreetowers,
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

data Results.rfnt200nv12v1;
	length modelo $256;
	set final;
	modelo='RF-NT200-NV12-V1';
run;


data Results.union;
	length modelo $256;
	set Results.rnlve74n2v1 Results.rnlve0n2v1 Results.bagn6m5v1 Results.gb01v1 Results.gbd601v1 Results.gb003v1 Results.gb0001v1 Results.llv1 Results.rfnt100nv6v1 Results.rfnt200nv12v1 Results.svmpolr2v1 Results.svmpolr3v1 Results.svmpolr3c100v1 Results.svmpolr4v1;
run;

title '';

AXIS1 LABEL=(HEIGHT=1.8 'Modelo' FONT='ARIAL' JUSTIFY=CENTER) VALUE=('RN-LV-E74-N2-V1' 'RN-LV-E0-N2-V1' 'BAG-N6-M5-V1' 'GB-01-V1' 'GB-D6-01-V1' 'GB-003-V1' 'GB-0001-V1' 'LL-V1' 'RF-NT100-NV6-V1' 'RF-NT200-NV12-V1' 'SVM-POL-R2-V1' 'SVM-POL-R3-V1'  'SVM-POL-R3-C100-V1' 'SVM-POL-R4-V1' ANGLE=90) MAJOR=();

AXIS2 LABEL=(HEIGHT=1.8 'BER Media en 31 semillas' FONT='ARIAL' JUSTIFY=CENTER);

proc boxplot data=Results.union;
	plot media*modelo /BOXSTYLE=SCHEMATIC HAXIS=AXIS1 VAXIS=AXIS2;
run;

