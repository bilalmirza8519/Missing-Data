libname mydata '/folders/myfolders/'; 
/*Regression WIHTOUT AUX variables*/
PROC CALIS DATA=mydata.college METHOD=FIML;
PATH gradrat <- lenroll rmbrd private stufac csat;
RUN;

/*Regression WIth AUX variables*/

PROC CALIS DATA=mydata.college METHOD=FIML;
PATH gradrat <- lenroll rmbrd private stufac csat,
act <- gradrat lenroll rmbrd private stufac csat;
RUN;
