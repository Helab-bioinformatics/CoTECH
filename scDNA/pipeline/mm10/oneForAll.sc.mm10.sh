#under the 01_cut folder

mkdir filtered_cell
find ./*/*/ -name "*fq.gz" | xargs -i cp {} ./filtered_cell/
cd ./filtered_cell
find ./ -name "*noid*" | xargs -i rm {}


mkdir 00_raw_data
#cd ./01_cutadapt
mkdir 02_alignment
mkdir 03_sort_uni_bam
mkdir 04_rmdup_bam

mv *gz ./00_raw_data
#for sample in `ls *.R1.fq.gz`
#do
#base=$(basename $sample ".R1.fq.gz")
#bowtie2 -p 6 -X 2000 -x /media/yp/helab-5/xionghq/database/hg19_bowtie2/hg19 -1 ./${base}.R1.fq.gz -2 ./${base}.R2.fq.gz -S ../02_alignment/${base}.sam  2>../02_alignment/${base}.align.log
#done

#mm10
for i in `ls ./00_raw_data/*.1.fq.gz`; 
do base=$(basename $i ".1.fq.gz"); 
bowtie2 -p 6 -5 42 -3 21 --dovetail --very-sensitive-local --no-unal --no-mixed --no-discordant -X 2000 -x /media/helab/data1/00_public/database/genomes/mm10_bowtie2/mm10 -1 ./00_raw_data/${base}.1.fq.gz -2 ./00_raw_data/${base}.2.fq.gz -S ./02_alignment/${base}.sam 2> ./02_alignment/${base}.align.log 
done 
#mm10
#for i in `ls *.1.fq.gz`; 
#do base=$(basename $i ".1.fq.gz"); 
#bowtie2 -p 6 -5 42 -3 21 --dovetail --very-sensitive-local --no-unal --no-mixed --no-discordant -X 2000 -x /media/helab/data1/00_public/database/genomes/mm10_bowtie2/mm10 -1 ${base}.1.fq.gz -2 ${base}.2.fq.gz -S ../02_alignment/${base}.sam 2> ../02_alignment/${base}.align.log 
#done 

#for i in ./02_alignment/*sam
#do
#base=$(basename $i "_trimmed.sam")
#samtools view -h -b -S  $i   |  samtools sort  - -o ./03_sort_uni_bam/${base}_sort.bam
#done  

#for i in ./03_sort_uni_bam/*_sort.bam
#do
#base=$(basename $i "_sort.bam")
#samtools view -h -bq 30 $i  >  ./03_sort_uni_bam/${base}_sort_uni.bam
#samtools rmdup  03_sort_uni_bam/${base}_sort_uni.bam   04_rmdup_bam/${base}_unimapped_rmdup.bam 2>./04_rmdup_bam/${base}.rmdup.log
#done

for sample in `ls ./02_alignment/*.sam`
do
base=$(basename $sample ".sam")
samtools view -h -b -S  ./02_alignment/${base}.sam   |  samtools sort  -  |  samtools view -h -bq 30 -  >  ./03_sort_uni_bam/${base}_sort_uni.bam
done

for i in ./03_sort_uni_bam/*sort_uni.bam
do 
base=$(basename $i "_sort_uni.bam")
java -jar /media/helab/data1/00_public/software/picard-tools-2.2.4/picard.jar MarkDuplicates REMOVE_DUPLICATES=true   I=./03_sort_uni_bam/${base}_sort_uni.bam   O=./04_rmdup_bam/${base}_rmdup_picard.bam  M=./04_rmdup_bam/${base}_rmdup_picard.txt
done

for x in ./03_sort_uni_bam/*_sort_uni.bam
do 
base=$(basename $x "_sort_uni.bam")
#samtools index $x
samtools view -c  ./03_sort_uni_bam/${base}_sort_uni.bam  >./03_sort_uni_bam/${base}.uni.totolreads.log
done



for j in ./04_rmdup_bam/*_rmdup_picard.bam
do 
base=$(basename $j "_rmdup_picard.bam")
samtools view -c ./04_rmdup_bam/${base}_rmdup_picard.bam  >./04_rmdup_bam/${base}.totolreads.log
done

