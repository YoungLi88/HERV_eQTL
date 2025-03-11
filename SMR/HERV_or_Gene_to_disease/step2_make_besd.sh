smr_tool="/path/of/software/smr/smr-1.3.1-linux-x86_64/smr-1.3.1"
input_dir="/path/of/smr"
output_dir="/path/of/smr"
celltype=$1
$smr_tool --eqtl-summary ${input_dir}/${celltype}/${celltype}.tsv --fastqtl-nominal-format  --make-besd --out ${input_dir}/${celltype}/${celltype}
