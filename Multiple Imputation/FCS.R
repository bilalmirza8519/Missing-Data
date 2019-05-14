rm(list = ls(all = T)) 
library(mice)
library(data.table)

dat <- fread("data.out")


#10 imputations, predictive mean matching method for all continous variables
mice_impute <- mice(dat, m=10,method=c('pmm','pmm','pmm','pmm','pmm',
                                             'pmm','pmm'), maxiter=10)    

summary(mice_impute)
mice_imp<- complete(mice_impute,1) #first imputed dataset

}
