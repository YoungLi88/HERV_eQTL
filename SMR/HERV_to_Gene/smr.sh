#!/bin/bash

celltypes=("CD4-T" "CD8-T" "NK" "Bcells" "Myeloid")

for celltype in "${celltypes[@]}"; do
        bash step7_smr.sh "$celltype" 
        python step8_qvalue.py "$celltype"
done

