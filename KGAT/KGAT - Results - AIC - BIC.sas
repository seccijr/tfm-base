%include 'C:\Users\secci\Workspace\TFM\Base\lineal pack.sas';

data kgat_results; 
	set 'C:\Users\secci\Workspace\TFM\Lib\kgat_results.sas7bdat'; 
run;

proc print;
run;

ods output  SelectedEffects=efectos;
proc glmselect data=kgat_results;
    model test_auc=attention_layer embedding_layer learning_rate mess_dropout prediction_layer reg_weight
   / selection=stepwise(select=AIC choose=AIC);
run;

proc print data=efectos;
run;

/*
The SAS System                                                                                                                                                                                                             14:15 Sunday, February 28, 2021 17247

The GLMSELECT Procedure
Selected Model

                       Parameter Estimates

                                              Standard
Parameter           DF        Estimate           Error    t Value

Intercept            1        0.766177        0.004655     164.60
mess_dropout         1       -0.274018        0.010616     -25.81
prediction_layer     1       -0.008558        0.000695     -12.32

*/

data; 
	set efectos; 
	put effects; 
run;
/* 
*/

ods output  SelectedEffects=efectos;
proc glmselect data=kgat_results;
    model test_auc=attention_layer embedding_layer learning_rate mess_dropout prediction_layer reg_weight
   / selection=stepwise(select=BIC choose=BIC);
;

proc print data=efectos;
run;

/*
The SAS System                                                                                                                                                                                                             14:15 Sunday, February 28, 2021 17252

The GLMSELECT Procedure
Selected Model

                       Parameter Estimates

                                              Standard
Parameter           DF        Estimate           Error    t Value

Intercept            1        0.766177        0.004655     164.60
mess_dropout         1       -0.274018        0.010616     -25.81
prediction_layer     1       -0.008558        0.000695     -12.32

*/

data; 
	set efectos; 
	put effects; 
run;
/*
*/

/*
Pruebo con todas las que dieron el mejor modelo AIC y BIC
*/
%cruzada(
	archivo=kgat_results,
	vardepen=test_auc,
	conti=attention_layer embedding_layer learning_rate mess_dropout prediction_layer reg_weight,
	categor=,
	ngrupos=4,
	sinicio=12345,
	sfinal=12375
);

data lsi;
	set final;
	modelo='LSI';
run;