smr_tool="/path/of/software/smr/smr-1.3.1-linux-x86_64/smr-1.3.1"
celltype=$1
gwas_file=$2
probe=$3
input_dir="/path/of/smr/${celltype}"
${smr_tool}  --bfile "/path/of/gwas/1kg.v3/EUR"  \
        --beqtl-summary ${input_dir}/${celltype} \
       	--out myplot --plot --probe ${probe}  \
       	--probe-wind 1000kb --diff-freq 0.1 --diff-freq-prop 0.2  --gene-list "/path/of/smr/herv.info.bed" \
	--gwas-summary /path/of/gwas/${gwas_file}/${gwas_file}_har.tsv 
