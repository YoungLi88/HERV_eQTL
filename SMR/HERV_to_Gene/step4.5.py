import pandas as pd
import sys
celltype = sys.argv[1]
df = pd.read_csv(f"/path/of/{celltype}_eqtl.csv")
snp = pd.read_csv("/path/of/annotation/snp_info_uniq.txt")
snp_dict = dict(zip(snp['rsid'],snp['alt']))
snp_ref_dict = dict(zip(snp['rsid'],snp['ref']))
df['effect']=df['snpid'].apply(lambda x : snp_dict[x])
df['ref']=df['snpid'].apply(lambda x : snp_ref_dict[x])
df[['snpid','effect','ref','af']].to_csv(f"/path/of/smr/{celltype}/{celltype}_af.csv",header = None,index = None)
