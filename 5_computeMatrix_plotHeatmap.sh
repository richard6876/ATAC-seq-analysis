#!/bin/bash

Fpath_base="/home/wanghy/SARS-CoV-2"
Fpath="${Fpath_base}/GRID-seq/Huh7"
Fpath2="${Fpath_base}/ATAC-seq/Huh7/bigwig"
Fpath3="${Fpath_base}/ATAC-seq/Huh7/5kbBin-T2T"
Gpath="${Fpath_base}/GRID-seq/Huh7/5kbBin-T2T"

name="T2T.Genome_5kbBins.mat.InflectionPoint"
bw_files="${Fpath2}/LQL220125-*.bw"
before=0
after=0
bin_size=50
samples="mock-rep1 mock-rep2 mock-rep3 SARS-rep1 SARS-rep2 SARS-rep3"
skip_zeros="--skipZeros"
out_prefix="${Fpath3}/${name}_ATACseq"

computeMatrix scale-regions -S ${bw_files} -R ${Gpath}/${name}.bed \
    --beforeRegionStartLength ${before} \
    --afterRegionStartLength ${after} \
    --binSize ${bin_size} --samplesLabel ${samples} ${skip_zeros} -o ${out_prefix}.gz -p 10

plotHeatmap -m ${out_prefix}.gz -out ${out_prefix}.pdf --colorMap OrRd --sortUsing sum --whatToShow 'heatmap and colorbar' --kmeans 5



