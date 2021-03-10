%include 'C:\Users\secci\Workspace\TFM\Base\binary pack.sas';


data mind; 
	set 'C:\Users\secci\Workspace\TFM\Lib\news.sas7bdat'; 
run;

proc print data=mind;
run;
/**

user
new
date
category
subcategory
P102_head
P102_tail
P103_head
P103_tail
P1050_head
P1050_tail
P106_head
P106_tail
P118_head
P118_tail
P131_head
P131_tail
P1340_head
P1340_tail
P1343_head
P1343_tail
P1411_head
P1411_tail
P1412_head
P1412_tail
P1532_head
P1532_tail
P1622_head
P1622_tail
P166_head
P166_tail
P17_head
P17_tail
P172_head
P172_tail
P1884_head
P1884_tail
P206_head
P206_tail
P21_head
P21_tail
P27_head
P27_tail
P2936_head
P2936_tail
P30_head
P30_tail
P31_head
P31_tail
P361_head
P361_tail
P37_head
P37_tail
P39_head
P39_tail
P421_head
P421_tail
P463_head
P463_tail
P495_head
P495_tail
P5008_head
P5008_tail
P530_head
P530_tail
P552_head
P552_tail
P641_head
P641_tail
P6886_head
P6886_tail
P937_head
P937_tail

**/

%randomselectlog(
	data=mind,
	vardepen=clicked,
	listclass=category subcategory P102_head P102_tail P103_head P103_tail P1050_head P1050_tail P106_head P106_tail P118_head P118_tail P131_head P131_tail P1340_head P1340_tail P1343_head P1343_tail P1411_head P1411_tail P1412_head P1412_tail P1532_head P1532_tail P1622_head P1622_tail P166_head P166_tail P17_head P17_tail P172_head P172_tail P1884_head P1884_tail P206_head P206_tail P21_head P21_tail P27_head P27_tail P2936_head P2936_tail P30_head P30_tail P31_head P31_tail P361_head P361_tail P37_head P37_tail P39_head P39_tail P421_head P421_tail P463_head P463_tail P495_head P495_tail P5008_head P5008_tail P530_head P530_tail P552_head P552_tail P641_head P641_tail P6886_head P6886_tail P937_head P937_tail,
	modelo=category subcategory P102_head P102_tail P103_head P103_tail P1050_head P1050_tail P106_head P106_tail P118_head P118_tail P131_head P131_tail P1340_head P1340_tail P1343_head P1343_tail P1411_head P1411_tail P1412_head P1412_tail P1532_head P1532_tail P1622_head P1622_tail P166_head P166_tail P17_head P17_tail P172_head P172_tail P1884_head P1884_tail P206_head P206_tail P21_head P21_tail P27_head P27_tail P2936_head P2936_tail P30_head P30_tail P31_head P31_tail P361_head P361_tail P37_head P37_tail P39_head P39_tail P421_head P421_tail P463_head P463_tail P495_head P495_tail P5008_head P5008_tail P530_head P530_tail P552_head P552_tail P641_head P641_tail P6886_head P6886_tail P937_head P937_tail,
	sinicio=12345,
	sfinal=12346,
	fracciontrain=0.8,
	directorio=C:\Users\secci\Workspace\TFM\Tmp
);

