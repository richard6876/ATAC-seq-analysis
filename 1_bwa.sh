#!bin/bash/

Fpath="/home/wanghy/SARS-CoV-2/ATAC-seq/Huh7"
#cd ${Fpath}  && mkdir bwa-T2T && cd bwa-T2T
cat ${Fpath}/bash-T2T/fileNames.txt | while read i

do
	cd ${Fpath}/bwa-T2T
	bwa mem  -t 16 /home/wanghy/SARS-CoV-2/Reference/T2T_V1.1-CoV/bwa.index/T2T-CoV2.fa ${Fpath}/Cleandata/${i}/${i}_R1_fastp.fq.gz ${Fpath}/Cleandata/${i}/${i}_R2_fastp.fq.gz  > ${i}.sam


	
done

