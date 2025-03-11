source("/path/of/smr/plot/plot/plot_SMR.r") 
# Read the data file in R:
args = commandArgs(trailingOnly=TRUE)
probe=args[1]
SMRData = ReadSMRData(sprintf("./plot/myplot.%s.txt",probe))
# Plot the SMR results in a genomic region centred around a probe:
SMRLocusPlot(data=SMRData, smr_thresh=4e-5, heidi_thresh=0.05, plotWindow=1000,anno_selfdef=FALSE, max_anno_probe=16)
# smr_thresh: genome-wide significance level for the SMR test.
# heidi_thresh: threshold for the HEIDI test. The default value is 0.05.
# cis_wind: size of a window centred around the probe to select cis-eQTLs for plot. The default value is 2000Kb.
# max_anno_probe: maximum number of probe names to be displayed on the figure. The default value is 16.

# Plot effect sizes from GWAS against those from eQTL study:
SMREffectPlot(data=SMRData, trait_name=probe)
# trait_name: name of the trait or disease.
