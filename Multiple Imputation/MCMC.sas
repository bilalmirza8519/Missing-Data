libname mydata '/folders/myfolders/'; 
filename testdatawithNA '/folders/myfolders/ValidationSet_45perNA.csv';
proc import datafile= testdatawithNA dbms=csv out=mydata.test;
run;


PROC MI DATA=mydata.test OUT=miout NIMPUTE=25 /*25 imputed datasets */
MINIMUM= . . 0 0 0 0 0 0 0 /*minimum bound */
MAXIMUM= . . 1 1 1 1 1 1 1; /*maximum bound */
VAR a N X0 X1 X3 X5 X7 X10 X14; /*a & N are aux variables */
run;
