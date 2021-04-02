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
Logistic
seeds = 10
groups = 4
*/
%cruzadalogistica(
	archivo=news_reduced_clean_five_methods,
	vardepen=REP_clicked,
	categor=REP_P31_head REP_P31_tail REP_subcategory,
	ngrupos=4,
	sinicio=12345,
	sfinal=12354,
	objetivo=Area
);

data Results.llv5;
	set final;
run;

data Results.sal_llv5;
	set sal_final;
run;
