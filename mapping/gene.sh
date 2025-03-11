cellranger count \
--fastqs ./ \
--sample=${line} \
--localcores 16 \
--nosecondary \
--id=out_${line} \
--transcriptome=/genome/gene_reference/
