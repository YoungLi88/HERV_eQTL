library(peer)

set.seed(1234)
celllable<-"CD4-T"
expr = read.csv(sprintf("/path/of/GSE196830/expression/%s/%s_herv_.csv",celllable,celllable))
names(expr)[1] <-"Individual.ID"
rnames = as.character(expr$Individual.ID)
head(rnames)
expr2 = expr[,-1]
expr2[1:5,1:5]
cnames = colnames(expr2)
head(cnames)
covs = read.csv('/path/of/GSE196830_covs.csv',sep='\t',row.names =1)
table(expr$Individual.ID %in% covs$Individual.ID)
covs = covs[match(expr$Individual.ID, covs$Individual.ID),]
covs2 = covs[,-1]
model = PEER()
PEER_setPhenoMean(model, as.matrix(expr2))
PEER_setCovariates(model, as.matrix(covs2))
dim(PEER_getPhenoMean(model))
PEER_setNk(model,10)
PEER_getNk(model)
save.image(file=sprintf( '/path/of/GSE196830/peer_factors/%s/%s_PEER_OUT1.RData',celllable,celllable))
PEER_update(model)
save.image(file =sprintf( '/path/of/GSE196830/peer_factors/%s/%s_PEER_OUT2.RData',celllable,celllable))
factors = PEER_getX(model)
dim(factors)
factors_df = data.frame(factors)
factors_df$sampleid = rnames
factors_df = factors_df[c(19,1:18)]
colnames(factors_df) = c("sampleid","age", "sex", "pc1", "pc2", "pc3", "pc4", "pc5", "pc6", "pf1", "pf2","pf3", "pf4", "pf5", "pf6", "pf7","pf8", "pf9", "pf10")
write.table(factors_df, file=sprintf("/path/of/GSE196830/peer_factors/%s/%s_peer_factors.tsv", celllable,celllable), sep="\t", col.names=T, row.names=F, quote=F) 
weights = PEER_getW(model)
dim(weights)
weights_df = data.frame(weights)
weights_df$geneid = cnames
weights_df = weights_df[c(19,1:18)]
colnames(weights_df) = c("hervid","age", "sex", "pc1", "pc2", "pc3", "pc4", "pc5", "pc6",
    "pf1", "pf2","pf3", "pf4", "pf5",
    "pf6", "pf7","pf8", "pf9", "pf10")
write.table(weights_df, file=sprintf("/path/of/GSE196830/peer_factors/%s/%s_peer_factor_weights.tsv",celllable,celllable)  sep="\t", col.names=T, quote=F, row.names=F)

# Calculate and save the precision values
precision = PEER_getAlpha(model)
dim(precision)
precision_df = data.frame(precision)
precision_df$covariate = c("age","sex", "pc1", "pc2", "pc3", "pc4", "pc5", "pc6",
    "pf1", "pf2","pf3", "pf4", "pf5",
    "pf6", "pf7","pf8", "pf9", "pf10")
write.table(precision_df, file=sprintf("/path/of/GSE196830/peer_factors/%s/%s_peer_factor_precision.tsv",celllable,celllable) 
    sep="\t", col.names=T, quote=F, row.names=F)

residuals = PEER_getResiduals(model)
dim(residuals)
residuals_df = data.frame(residuals)
colnames(residuals_df) = cnames
residuals_df = cbind(sampleid=rnames, residuals_df)
write.table(residuals_df, file=sprintf("/path/of/GSE196830/peer_factors/%s/%s_peer_factor_residuals.tsv",celllable,celllable)    sep="\t", col.names=T, quote=F, row.names=F)
