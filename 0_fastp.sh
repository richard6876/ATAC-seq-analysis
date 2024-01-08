#!bin/bash/

Fpath="/home/wanghy/SARS-CoV-2/ATAC-seq/Huh7"
cd ${Fpath}/Cleandata && mkdir fastQC

cat ${Fpath}/bash-T2T/fileNames.txt | while read i

do
	cd ${Fpath}/Cleandata/${i}
	fastp -i ${i}_R1.fq.gz -o ${i}_R1_fastp.fq.gz -I ${i}_R2.fq.gz  -O  ${i}_R2_fastp.fq.gz  --thread=16  --compression=4
	fastqc -t 16 -o ${Fpath}/Cleandata/fastQC ${i}_R1_fastp.fq.gz ${i}_R2_fastp.fq.gz 		
done

