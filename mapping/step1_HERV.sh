cellranger count \
--fastqs ./ \
--sample=${line} \
--localcores 16 \
--nosecondary \
--id=out_${line} \
--transcriptome=/genome/HERV_repeatmasker/
