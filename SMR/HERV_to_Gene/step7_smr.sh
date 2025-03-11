smr_tool="/path/of/software/smr/smr-1.3.1-linux-x86_64/smr-1.3.1"
celltype=$1
input_dir="/path/of/smr/${celltype}"

${smr_tool} --bfile /path/to/gwas/1kg.v3/EUR --beqtl-summary ${input_dir}/${celltype}  --beqtl-summary ${input_dir}/gene/${celltype} --peqtl-smr 0.05 --diff-freq 0.1 --diff-freq-prop 0.2 --out ${input_dir}/${celltype}_gene_out --thread-num 16
