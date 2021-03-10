%include 'C:\Users\secci\Workspace\TFM\Base\binary pack.sas';


data mind; 
	set 'C:\Users\secci\Workspace\TFM\Lib\news_dummy.sas7bdat'; 
run;

proc print data=mind;
run;

ods output  SelectedEffects=efectos;
proc glmselect data=mind;
	class TI_TG_REP_P1340_tail1 TI_TG_REP_P1340_tail2 TI_TG_REP_P1884_tail1 TI_TG_REP_P1884_tail2 TI_TG_REP_P21_tail1 TI_TG_REP_P21_tail2 TI_TG_REP_P21_tail3 TI_TG_REP_P21_tail4 TI_TG_REP_P30_tail1 TI_TG_REP_P30_tail2 TI_TG_REP_P30_tail3 TI_TG_REP_P5008_tail1 TI_TG_REP_P5008_tail2 TI_TG_REP_P5008_tail3 TI_TG_REP_category1 TI_TG_REP_category2 TI_TG_REP_category3 TI_TG_REP_category4;
   	model REP_clicked=TI_TG_REP_P1340_tail1 TI_TG_REP_P1340_tail2 TI_TG_REP_P1884_tail1 TI_TG_REP_P1884_tail2 TI_TG_REP_P21_tail1 TI_TG_REP_P21_tail2 TI_TG_REP_P21_tail3 TI_TG_REP_P21_tail4 TI_TG_REP_P30_tail1 TI_TG_REP_P30_tail2 TI_TG_REP_P30_tail3 TI_TG_REP_P5008_tail1 TI_TG_REP_P5008_tail2 TI_TG_REP_P5008_tail3 TI_TG_REP_category1 TI_TG_REP_category2 TI_TG_REP_category3 TI_TG_REP_category4
   	/ selection=stepwise(select=AIC choose=AIC);
run;

proc print data=efectos;
run;

proc logistic data=mind;
    class TI_TG_REP_P1340_tail1 TI_TG_REP_P1340_tail2 TI_TG_REP_P1884_tail1 TI_TG_REP_P1884_tail2 TI_TG_REP_P21_tail1 TI_TG_REP_P21_tail2 TI_TG_REP_P21_tail3 TI_TG_REP_P21_tail4 TI_TG_REP_P30_tail1 TI_TG_REP_P30_tail2 TI_TG_REP_P30_tail3 TI_TG_REP_P5008_tail1 TI_TG_REP_P5008_tail2 TI_TG_REP_P5008_tail3 TI_TG_REP_category1 TI_TG_REP_category2 TI_TG_REP_category3 TI_TG_REP_category4;
    model REP_clicked=TI_TG_REP_P1340_tail1 TI_TG_REP_P1340_tail2 TI_TG_REP_P1884_tail1 TI_TG_REP_P1884_tail2 TI_TG_REP_P21_tail1 TI_TG_REP_P21_tail2 TI_TG_REP_P21_tail3 TI_TG_REP_P21_tail4 TI_TG_REP_P30_tail1 TI_TG_REP_P30_tail2 TI_TG_REP_P30_tail3 TI_TG_REP_P5008_tail1 TI_TG_REP_P5008_tail2 TI_TG_REP_P5008_tail3 TI_TG_REP_category1 TI_TG_REP_category2 TI_TG_REP_category3 TI_TG_REP_category4;
    output out=sal p=predi;
run;
			

%cruzadalogistica(
	archivo=mind,
	vardepen=REP_clicked,
	conti=,
	categor=TI_TG_REP_P1340_tail1 TI_TG_REP_P1340_tail2 TI_TG_REP_P1884_tail1 TI_TG_REP_P1884_tail2 TI_TG_REP_P21_tail1 TI_TG_REP_P21_tail2 TI_TG_REP_P21_tail3 TI_TG_REP_P21_tail4 TI_TG_REP_P30_tail1 TI_TG_REP_P30_tail2 TI_TG_REP_P30_tail3 TI_TG_REP_P5008_tail1 TI_TG_REP_P5008_tail2 TI_TG_REP_P5008_tail3 TI_TG_REP_category1 TI_TG_REP_category2 TI_TG_REP_category3 TI_TG_REP_category4,
    ngrupos=4,
	sinicio=12345,
	sfinal=12375,
	objetivo=tasafallos
);
