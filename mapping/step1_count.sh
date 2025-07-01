/cellranger-7.1.0/cellranger count \
	--fastqs "fastq" \
	--sample "sample_name" \
	--localcores 16 \
	--include-introns false \
	--id "new_matrix" \
	--transcriptome=/genome/herv_gene_merge/ 
