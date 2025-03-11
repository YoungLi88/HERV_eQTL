smr_tool="path/of/software/smr/smr-1.3.1-linux-x86_64/smr-1.3.1"
celltype=$1

input_dir="/path/of/smr/${celltype}"

${smr_tool} --beqtl-summary ${input_dir}/${celltype} --update-esi ${input_dir}/${celltype}_update.esi



