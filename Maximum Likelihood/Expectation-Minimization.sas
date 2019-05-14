PROC MI DATA=mydata.college NIMPUTE=0;
VAR gradrat lenroll rmbrd private stufac csat act;
EM OUTEM=collem;
RUN;

/*CORRELATION ESTIMATES*/

PROC REG DATA=collem CORR;
VAR gradrat csat lenroll private stufac rmbrd act;
RUN;

/*EM as input to Regression*/
PROC REG DATA=collem;
MODEL gradrat=lenroll stufac rmbrd private csat;
RUN;

/*Bootstrap*/
PROC SURVEYSELECT DATA=mydata.college METHOD=URS N=1302
REPS=1000 OUT=bootsamp OUTHITS;
PROC MI DATA=bootsamp NIMPUTE=0 NOPRINT;
VAR gradrat lenroll rmbrd private stufac csat act;
EM OUTEM=collem;
BY replicate;
PROC REG DATA=collem OUTEST=a NOPRINT;
MODEL gradrat=lenroll stufac rmbrd private csat;
BY replicate;
PROC MEANS DATA=a STD;
VAR lenroll rmbrd private stufac csat;
RUN;
