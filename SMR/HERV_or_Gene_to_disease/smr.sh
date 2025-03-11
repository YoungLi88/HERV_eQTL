#!/bin/bash


celltypes=("CD4-T" "CD8-T" "NK" "Bcells" "Myeloid")
gwas_type=('SLE' 'RA' 'psoriatic_arthritis' 'ankylosing_spondylitis' 'myasthenia_gravis' 'polymyositis' 'psoriasis' 'pemphigus' 'MS' 'narcolepsy' 'T1D' 'graves' 'hashimoto_thyroiditis' 'sjogren_syndrome' 'CD' 'UC' 'celiac' 'aplastic_anemia' 'vitiligo' 'behcet_disease' 'autoimmune_hepatitis'  'bladder' 'breast_cancer' 'gallbladder_neoplasm' 'colon_carcinoma' 'lymphoma' 'esophageal' 'brain_neoplasm'  'clear_cell_renal_carcinoma' 'papillary_renal_cell_carcinoma' 'acute_myeloblastic_leukaemia' 'liver_cancer'  'lung_adenocarcinoma' 'squamous_cell_lung_carcinoma' 'mesothelioma' 'pancreatic_neoplasm' 'prostate_cancer' 'sarcoma'  'skin_cancer' 'gastric_cancer' 'testicular_carcinoma' 'thyroid_cancer' 'endometrial_cancer' 'uterine_cancer' 'multiple_myeloma' 'chickenpox' 'chlamydia_trachomatis' 'diphtheria' 'hepatitis_A' 'hepatitis_B' 'hepatitis_C' 'HIV' 'influenza' 'measles' 'mumps' 'pertussis' 'pneumococcal_disease' 'rubella' 'herpes_zoster' 'toxoplasma' 'prion_disease' 'scarlet_fever' 'pulmonary_tuberculosis' 'skin_and_soft_tissue_infections'  'henoch-Schoenlein_purpura' 'food_allergy' 'allergic_rhinitis' 'pollinosis' 'chronic_sinusitis' 'urticaria' 'pleurisy' 'chronic_gastritis' 'contact_dermatitis' 'tonsillitis' 'chronic_hepatitis_B' 'chronic_hepatitis_C'  'bronchitis' 'glomerulonephritis' 'acne_vulgaris' 'COPD' 'juvenile_idiopathic_arthritis'    )

for celltype in "${celltypes[@]}"; do
        for gwas_type in "${gwas_type[@]}"; do
		bash step7_smr.sh "$celltype" "$gwas_type"
		python step8_qvalue.py "$celltype" "$gwas_type"
	done
done

