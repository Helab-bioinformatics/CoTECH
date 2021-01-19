for i in *gz
do
fastqc $i
done &

for i in `ls *_1.fq.gz`
do 
base=$(basename $i "_1.fq.gz")
cutadapt -a CTGTCTCTTATACACATCTGACGCTGCCGACGA -q 20 -O 10  --trim-n  -m 30  --max-n 0.1  -o  ./${base}.1.fq.gz   ./${base}_1.fq.gz
done

#for i in `ls *.1.fq.gz`
#do 
#base=$(basename $i ".1.fq.gz")
#hisat2 -x /media/helab/data1/00_public/database/Hisat2/hisat2_ref/mm10/mm10 -p 6 -U ${base}.1.fq.gz -S ./${base}_align.mm10.sam 2>./${base}.mm10.align.log
#done

for i in `ls *.1.fq.gz`
do 
base=$(basename $i ".1.fq.gz")
hisat2 -x /media/helab/data1/00_public/database/Hisat2/hisat2_ref/hg19/hg19 -p 16 -U ${base}.1.fq.gz -S ./${base}_align.hg19.sam 2>./${base}.hg19.align.log
done

for sample in `ls *.sam`
do
base=$(basename $sample ".sam")
samtools view -h -b -S  ${base}.sam   |  samtools sort  -  |  samtools view -h -bq 30 -  >  ./${base}_sort_uni.bam
done

for i in `ls *_sort_uni.bam`
do 
base=$(basename $i "_sort_uni.bam")
java -jar /media/helab/data1/00_public/software/picard-tools-2.2.4/picard.jar MarkDuplicates REMOVE_DUPLICATES=true   I=${base}_sort_uni.bam   O=./${base}_rmdup_picard.bam  M=./${base}_rmdup_picard.txt 
done


for i in *_rmdup_picard.bam
do
samtools index $i
done


for i in ./*_rmdup_picard.bam
do
base=$(basename $i "_rmdup_picard.bam")
num1=10000000
num2="$(samtools view -c  $i  2>&1 )"
res=$(printf "%.5f" `echo "scale=5;$num1/$num2"|bc`)
bamCoverage --scaleFactor  $res -b  $i   -o   ./${base}.10M.bw -p 13
#bamCoverage --scaleFactor  $res -b  $i  -e 300  --smoothLength 500 -o  ./${base}.ext500.smo200.bw
done

for x in ./*_sort_uni.bam
do 
base=$(basename $x "_sort_uni.bam")
#samtools index $x
samtools view -c  ${base}_sort_uni.bam  >./${base}.uni.totolreads.log
done



for j in ./*_rmdup_picard.bam
do 
base=$(basename $j "_rmdup_picard.bam")
samtools view -c ${base}_rmdup_picard.bam  >./${base}.totolreads.log
done
