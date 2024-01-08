#!bin/bash/

Fpath="/home/wanghy/SARS-CoV-2/ATAC-seq/Huh7"
cd ${Fpath} && mkdir MACS2 && cd MACS2

cat ${Fpath}/bash-T2T/fileNames.txt | while read i
do
	cd ${Fpath}/MACS2 && mkdir ${i} && cd ${i}
	#samtools sort -@ 16 -m 1G ${i}.sam -o ${i}.sortP.bam
	macs2 callpeak -t ${Fpath}/picard/${i}.sortP_rmdupPICARD.bam -n ${i} --shift -100 --extsize 200 --nomodel -B --SPMR -g 3.055e9	
done

