library(data.table)
library(dplyr)
library(qvalue)
library(tibble)
args = commandArgs(trailingOnly=TRUE)
celltype <- args[1]


herv_input <- "/path/of/GSE196830/hervLoc/HERV_gene_info.txt"
herv_input <- fread(herv_input)
herv_input$probeID <- herv_input$V5
herv_input$distance <- 0
herv_input$orientation <- "+"
names(herv_input) <- c("chr","exon","start","end","herv","probeID","distance","orientation")
epi = fread(sprintf("/path/of/smr/%s/%s.epi",celltype,celltype),sep='\t')
names(epi) <- c("chr","herv","distance","pos","probeID","orientation")
df_epi = left_join(epi,herv_input,by = "herv")
df_epi <- df_epi %>% select(chr.y, herv, distance.x, start, probeID.y, orientation.y)
df_epi$chr.y <- gsub("chr*","", df_epi$chr.y)
fwrite(df_epi,sprintf("/path/of/smr/%s/%s_update.epi",celltype,celltype), sep="\t", quote=F, col.names=F)
