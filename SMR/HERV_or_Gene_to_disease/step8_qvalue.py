from statsmodels.stats.multitest import multipletests
import pandas as pd
import sys
celltype = sys.argv[1]
gwas_type = sys.argv[2]
df = pd.read_csv(f"./{celltype}/{celltype}_{gwas_type}_out.smr",sep = "\t")
pvalues = df['p_SMR']
_, qvalues, _, _ = multipletests(pvalues, method='fdr_bh')
df['qvalue'] = qvalues
df.to_csv(f"./{celltype}/{celltype}_{gwas_type}_out_qvalue.smr",sep = "\t")
