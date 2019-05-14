
rm(list = ls(all = T)) 

library(missForest)

data_NA<-read.csv("data_NA.csv")

imp <- missForest(data_NA, maxiter = 25, ntree = 500, verbose=TRUE)
rf_impute<-as.data.frame(imp$ximp)
