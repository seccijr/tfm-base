%include 'C:\Users\secci\Workspace\ml\p2\base\p2 - Pack.sas';

data sel1; 
	set 'C:\Users\secci\Workspace\ml\p2\lib\seleccion_metodo_1.sas7bdat'; 
run;

data sel2; 
	set 'C:\Users\secci\Workspace\ml\p2\lib\seleccion_metodo_2.sas7bdat'; 
run;

data sel3; 
	set 'C:\Users\secci\Workspace\ml\p2\lib\seleccion_metodo_3.sas7bdat'; 
run;

libname lib 'C:\Users\secci\Workspace\ml\p2\lib';

/* 
	V1
	Rede Neuronal Levenberg-Marquardt, Nodos = 2, Early Stoping = 0
	Random Forest Vars To Try = 6, Max Trees = 100, Number Variables = 6, Train Fraction = 0.8, Leaf Size = 5, Max Depth = 10
	Gradient Boosting Leaf Size = 5, Iterations = 100, Max Branch  2, Max Depth = 4, Shrinkage = 0.1
	Sin SVM
*/
options mprint;
%cruzadastack(
	archivo=sel1,
	vardepen=result,
	listconti=assists cspm damagetochampions deaths dragons earned_gpm earnedgold goldspent gspd inhibitors kills monsterkillsenemyjungle opp_csat15 opp_elders opp_inhibitors opp_towers team_kpm totalgold towers,
	listclass=T10_game_side T1_game_side T2_game_side T3_game_side T4_game_side T5_game_side T6_game_side T7_game_side T8_game_side T9_game_side firsttothreetowers,
	ngrupos=4,
	seminicio=12345,
	semifinal=12375,
	nodos=2,
	algo=levmar,
	rediter=,
	maxtrees=100,
	vars_to_try=6,
	trainfraction=0.8,
	leafsize=5,
	maxdepth=10,
	bleafsize=5,
	iterations=100,
	bmaxbranch=2,
	bmaxdepth=4,
	shrinkage=0.1,
	kernel=,
	c=
);

data lib.assemble_v1;
	set final;
run;


/*PREPARACION GRAFICO Y ETIQUETAS */
data lib.cajas_v1;
	array ase{17};
	set lib.assemble_v1;
	length modelo $ 19;
	do i=1 to 17;
		if i ne 5 then
		do;
			select (i);
				when (1) 
					modelo='V1-RED';
				when (2) 
					modelo='V1-LOG';
				when (3) 
					modelo='V1-RFOR';
				when (4) 
					modelo='V1-BOOST';
				when (6) 
					modelo='V1-RLOG';
				when (7) 
					modelo='V1-REDFOR';
				when (8) 
					modelo='V1-REDBOO';
				when (9) 
					modelo='V1-LRFOR';
				when (10) 
					modelo='V1-LBOOST';
				when (11) 
					modelo='V1-RFORBOO';
				when (12) 
					modelo='V1-R-L-RFOR';
				when (13) 
					modelo='V1-R-L-BOO';
				when (14) 
					modelo='V1-R-RF-BOO';
				when (15) 
					modelo='V1-L-RF-BOO';
				when (16) 
					modelo='V1-R-L-RF-BOO';
				when (17) 
					modelo='V1-R-L-RF-BOO ponde';
				otherwise
					modelo='V1-DESCONOCIDO';
			end;
			error=ase{i};
			output;
		end;
	end;
run;

/* 
	V2
	Rede Neuronal Levenberg-Marquardt, Nodos = 2, Early Stoping = 38
	Random Forest Vars To Try = 6, Max Trees = 100, Number Variables = 6, Train Fraction = 0.8, Leaf Size = 5, Max Depth = 10
	Gradient Boosting Leaf Size = 5, Iterations = 100, Max Branch  2, Max Depth = 4, Shrinkage = 0.1
	Sin SVM
*/
options mprint;
%cruzadastack(
	archivo=sel2,
	vardepen=result,
	listconti=assists deaths earned_gpm earnedgold gspd inhibitors monsterkillsenemyjungle opp_inhibitors opp_towers team_kpm towers,
	listclass=firsttothreetowers,
	ngrupos=4,
	seminicio=12345,
	semifinal=12375,
	nodos=2,
	algo=levmar,
	rediter=38,
	maxtrees=100,
	vars_to_try=6,
	trainfraction=0.8,
	leafsize=5,
	maxdepth=10,
	bleafsize=5,
	iterations=100,
	bmaxbranch=2,
	bmaxdepth=4,
	shrinkage=0.1,
	kernel=,
	c=
);

data lib.assemble_v2;
	set final;
run;


/*PREPARACION GRAFICO Y ETIQUETAS */
data lib.cajas_v2;
	array ase{17};
	set lib.assemble_v2;
	length modelo $ 19;
	do i=1 to 17;
		if i ne 5 then
		do;
			select (i);
				when (1) 
					modelo='V2-RED';
				when (2) 
					modelo='V2-LOG';
				when (3) 
					modelo='V2-RFOR';
				when (4) 
					modelo='V2-BOOST';
				when (6) 
					modelo='V2-RLOG';
				when (7) 
					modelo='V2-REDFOR';
				when (8) 
					modelo='V2-REDBOO';
				when (9) 
					modelo='V2-LRFOR';
				when (10) 
					modelo='V2-LBOOST';
				when (11) 
					modelo='V2-RFORBOO';
				when (12) 
					modelo='V2-R-L-RFOR';
				when (13) 
					modelo='V2-R-L-BOO';
				when (14) 
					modelo='V2-R-RF-BOO';
				when (15) 
					modelo='V2-L-RF-BOO';
				when (16) 
					modelo='V2-R-L-RF-BOO';
				when (17) 
					modelo='V2-R-L-RF-BOO ponde';
				otherwise
					modelo='V2-DESCONOCIDO';
			end;
			error=ase{i};
			output;
		end;
	end;
run;


/* 
	V3
	Rede Neuronal Levenberg-Marquardt, Nodos = 2, Early Stoping = 11
	Bagging Vars To Try = 6 (Todas), Max Trees = 100, Number Variables = 3, Train Fraction = 0.8, Leaf Size = 5, Max Depth = 10
	Gradient Boosting Leaf Size = 5, Iterations = 100, Max Branch  2, Max Depth = 4, Shrinkage = 0.1
	SVM Pol = R2 
*/
options mprint source notes;
%cruzadastack(
	archivo=sel3,
	vardepen=result,
	listconti=assists earned_gpm gspd opp_towers towers,
	listclass=firsttothreetowers,
	ngrupos=4,
	seminicio=12345,
	semifinal=12375,
	nodos=2,
	algo=levmar,
	rediter=11,
	maxtrees=100,
	vars_to_try=3,
	trainfraction=0.8,
	leafsize=5,
	maxdepth=10,
	bleafsize=5,
	iterations=100,
	bmaxbranch=2,
	bmaxdepth=4,
	shrinkage=0.1,
	kernel=polynom k_par=2,
	c=10
);

data lib.assemble_v3;
	set final;
run;


/*PREPARACION GRAFICO Y ETIQUETAS */
data lib.cajas_v3;
	array ase{23};
	set lib.assemble_v3;
	length modelo $ 19;
	do i=1 to 23;
		if i=18 or i=20 or i=21 then
		do;
			select (i);
				when (1) 
					modelo='V3-RED';
				when (2) 
					modelo='V3-LOG';
				when (3) 
					modelo='V3-RFOR';
				when (4) 
					modelo='V3-BOOST';
				when (6) 
					modelo='V3-RLOG';
				when (7) 
					modelo='V3-REDFOR';
				when (8) 
					modelo='V3-REDBOO';
				when (9) 
					modelo='V3-LRFOR';
				when (10) 
					modelo='V3-LBOOST';
				when (11) 
					modelo='V3-RFORBOO';
				when (12) 
					modelo='V3-R-L-RFOR';
				when (13) 
					modelo='V3-R-L-BOO';
				when (14) 
					modelo='V3-R-RF-BOO';
				when (15) 
					modelo='V3-L-RF-BOO';
				when (16) 
					modelo='V3-R-L-RF-BOO';
				when (17) 
					modelo='V3-R-L-RF-BOO ponde';
				when (18) 
					modelo='V3-R-SVM';
				when (19) 
					modelo='V3-RF-SVM';
				when (20) 
					modelo='V3-L-SVM';
				when (21) 
					modelo='V3-BOO-SVM';
				when (22) 
					modelo='V3-SVMLRF';
				when (23) 
					modelo='V3-RLRFBSVM';
				otherwise
					modelo='V3-DESCONOCIDO';
			end;
			error=ase{i};
			output;
		end;
	end;
run;

data lib.cajas;
	length modelo $ 19;
	set lib.cajas_v1 lib.cajas_v2 lib.cajas_v3;
run;

data lib.cajas_sel;
	length modelo $ 19;
	set lib.cajas;
	if modelo ne 'V1-LOG' 
		and modelo ne 'V1-L-RF-BOO' 
		and modelo ne 'V1-R-L-BOO'
		and modelo ne 'V1-R-L-RF-BOO'
		and modelo ne 'V1-R-L-RF-BOO ponde'
		and modelo ne 'V1-R-L-RFOR'
		and modelo ne 'V1-R-RF-BOO'
		and modelo ne 'V1-REDBOO'
		and modelo ne 'V1-REDFOR'
		and modelo ne 'V2-LOG'
		and modelo ne 'V2-L-RF-BOO'
		and modelo ne 'V2-LBOOST'
		and modelo ne 'V2-R-L-RF-BOO'
		and modelo ne 'V2-REDBOO'
		and modelo ne 'V2-REDFOR'
		then delete;
run;

proc sgplot data=lib.cajas;
   vbox error / category = modelo;
   title 'BER Medio';
run;	

proc sgplot data=lib.cajas_sel;
   vbox error / category = modelo;
   title 'BER Medio';
run;

proc sort data=cajas;
	by i;
run;

proc boxplot data=cajas;
	plot error*modelo /BOXSTYLE=SCHEMATIC;
run;
