for i in `ls *_cut27.R2.fq.gz`; do base=$(basename $i "_cut27.R2.fq.gz"); mkdir ${base}.R2/; perl ./splitbarcode0bp.pl ${base}_cut27.R2.fq.gz 0 CGAGTAAT TCTCCGGA AATGAGCG GGAATCTC TTCTGAAT ACGAATTC AGCTTCAG GCGCATTA CATAGCCG TTCGCGGA GCGCGAGA CTATCGCT ${base}.R2/T7_${base}_1.2.fq.gz ${base}.R2/T7_${base}_2.2.fq.gz ${base}.R2/T7_${base}_3.2.fq.gz ${base}.R2/T7_${base}_4.2.fq.gz ${base}.R2/T7_${base}_5.2.fq.gz ${base}.R2/T7_${base}_6.2.fq.gz ${base}.R2/T7_${base}_7.2.fq.gz ${base}.R2/T7_${base}_8.2.fq.gz ${base}.R2/T7_${base}_9.2.fq.gz ${base}.R2/T7_${base}_10.2.fq.gz ${base}.R2/T7_${base}_11.2.fq.gz ${base}.R2/T7_${base}_12.2.fq.gz ${base}.R2/T7_${base}_noid.2.fq.gz; done