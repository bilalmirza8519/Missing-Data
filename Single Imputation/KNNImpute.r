###Imputation for microarray data..original KNN


##bioconductor impute for KNN
#if (!requireNamespace("BiocManager", quietly = TRUE))
#  +     install.packages("BiocManager")

#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("impute")

## try http:// if https:// URLs are not supported
#source("https://bioconductor.org/biocLite.R")
#biocLite("impute")

library(impute)
rm(list = ls(all = T))
data_NA<-read.csv("data_NA.csv")

#each row is a protein/gene/ptm while column are differnt observations

data_NA<-as.matrix(data_NA)
ximp<-impute.knn(data_NA ,k = 5, rowmax = 0.3, colmax = 0.8, maxp = 15000)
knn_impute<-as.data.frame(ximp$data)
