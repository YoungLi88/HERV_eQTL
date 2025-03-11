smr_tool="/path/of/software/smr/smr-1.3.1-linux-x86_64/smr-1.3.1"
celltype=$1
gwas_type=$2
input_dir="/path/of/smr/${celltype}"
${smr_tool} --gwas-summary /path/of/gwas_summary/${gwas_type}/${gwas_type}_har.tsv --bfile /path/of/gwas/1kg.v3/EUR --beqtl-summary ${input_dir}/${celltype} --peqtl-smr 0.05 --diff-freq 0.1 --diff-freq-prop 0.2  --out ${input_dir}/${celltype}_${gwas_type}_out --thread-num 16 
