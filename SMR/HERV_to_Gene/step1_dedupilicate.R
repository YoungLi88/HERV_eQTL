library("dplyr")
library("data.table")
#library("valr")
# Call variables
args = commandArgs(trailingOnly=TRUE)
celltype <- args[1]
cis <- read.csv(sprintf("/path/of/tensorqtl/%s_eqtl.csv", celltype),sep = ',',row.names = 1)
      
cis <- cis %>% select(hervid,snpid,start_distance,pval_nominal,beta)
#names(cis) <- c("SNP","gene","","p-value","FDR")
cis_clean <- cis  %>% distinct( hervid,snpid, .keep_all = T)
fwrite(cis_clean, sprintf("/path/of/smr/%s/%s.tsv", celltype, celltype),row.names=FALSE, sep="\t", quote=F,col.names = F)
