%include 'C:\Users\secci\Workspace\TFM\Base\todas macros regresion 5.0.sas';


data kgat_results; 
	set 'C:\Users\secci\Workspace\TFM\Lib\kgat_results.sas7bdat'; 
run;

proc print;
run;

%randomselect(
	data=kgat_results,
	vardepen=test_auc,
	listclass=,
	modelo=attention_layer embedding_layer learning_rate mess_dropout prediction_layer reg_weight,
	criterio=AIC,
	sinicio=12345,
	sfinal=13345,
	fracciontrain=0.8,
	directorio=C:\Users\secci\Workspace\TFM\Tmp
);
/*
Obs    efecto                  												COUNT    PERCENT

 1     Intercept mess_dropout prediction_layer                              947     94.6054
 2     Intercept mess_dropout prediction_layer reg_weight                    31      3.0969
 3     Intercept learning_rate mess_dropout prediction_layer                 16      1.5984
 4     Intercept embedding_layer mess_dropout prediction_layer                4      0.3996
 5     Intercept learning_rate mess_dropout prediction_layer reg_weight       2      0.1998
 6     Intercept attention_layer mess_dropout prediction_layer                1      0.0999

*/

/*
Pruebo con las 3 mejores variables del Random Select
*/
%cruzada(
	archivo=kgat_results,
	vardepen=test_auc,
	conti=mess_dropout prediction_layer reg_weight,
	categor=,
	ngrupos=4,
	sinicio=12345,
	sfinal=12375
);

data lsr; 
	set final; 
	modelo='LSR';
run;
