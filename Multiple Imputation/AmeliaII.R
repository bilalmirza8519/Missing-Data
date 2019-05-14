rm(list = ls(all = T)) 
library(Amelia)
library(data.table)

dat <- fread("data.out")


#getting 0 to 1 bound for each varaible, first 2 are aux variables
bds <- matrix(c(3, 4,5,6,7,8,9,0,0,0,0,0,0,0,1 ,1,1,1,1,1,1), nrow = 7, ncol = 3) 
#25 imputed dataset using EMB/Amelia algorithm
amelia_impute <- amelia(data_withNA1, m = 25,  bounds = bds, max.resample = 1000)


amelia_imp<- amelia_impute$imputations[[i]] #first imputed datasets
