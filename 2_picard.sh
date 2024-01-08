#!bin/bash/

Fpath="/home/baix/SARS-CoV-2/ATAC-seq/Huh7"

cat ${Fpath}/bash-T2T/fileNames.txt | while read i

do
	cd ${Fpath}/bwa-T2T
	samtools sort -@ 16 -m 1G ${i}.sam -o ${i}.sortP.bam
	java -jar /home/baix/bxsoft/picard.jar MarkDuplicates REMOVE_DUPLICATES=true  I=${i}.sortP.bam O=${i}.sortP_rmdupPICARD.bam M=${i}.marked_dup_metrics.txt
	
	cd ${Fpath}/picard
	samtools index ${i}.sortP_rmdupPICARD.bam
    samtools view -@ 10 -h ${i}.sortP_rmdupPICARD.bam |grep -v -e 'XA:Z:' -e 'SA:Z:' |samtools view -@ 10 -b > ${i}.sortP_rmdupPICARD_uniq.bam	


done

