#!bin/bash/

Fpath="/home/wanghy/SARS-CoV-2/ATAC-seq/Huh7"
Opath="/home/wanghy/SARS-CoV-2/ATAC-seq/Huh7/bigwig"
cat ${Fpath}/bash-T2T/fileNames.txt | while read i

do
                                                     
	samtools index -@ 16 ${Fpath}/picard/${i}.sortP_rmdupPICARD.bam                                               
	bamCoverage -p 16 --normalizeUsing BPM  -b ${Fpath}/picard/${i}.sortP_rmdupPICARD.bam -o ${Opath}/${i}.bw

done


