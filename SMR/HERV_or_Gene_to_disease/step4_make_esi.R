library(data.table)
library(dplyr)
library(qvalue)
library(tibble)
args = commandArgs(trailingOnly=TRUE)
celltype <- args[1]

snp_input <-fread("/path/of/annotation/snp_info_uniq.txt")
esi <- fread(sprintf("/path/of/smr/%s/%s.esi",celltype,celltype))
names(esi) <- c("V1","rsid","V3","V4","V5","V6","V7")
df_esi <- left_join(esi,snp_input,by = "rsid")
df_esi <- df_esi %>% select(chr, rsid, V3, start, alt, ref,maf)
df_esi$chr <- gsub("chr*","", df_esi$chr)
fwrite(df_esi,sprintf("/path/of/smr/%s/%s_update.esi",celltype,celltype),sep="\t", quote=F, col.names=F)
