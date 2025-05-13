bamCoverage=/software/bin/bamCoverage

bam="input.bam"
outbw="output.bw"
#samtools index "$bam"
$bamCoverage \
    -b $bam \
    -o $outbw \
    --filterRNAstrand reverse \   # strand 
    --binSize 1 \
    --normalizeUsing RPKM \
    --exactScaling \
    --minMappingQuality 10
