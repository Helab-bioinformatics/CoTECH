for i in `ls *_2.fq.gz`
do 
base=$(basename $i "_2.fq.gz")
perl ./splitbarcode0bp.pl ./${base}_2.fq.gz 0 AACGTGAT AAACATCG ATGCCTAA AGTGGTCA ACCACTGT ACATTGGC CAGATCTG CATCAAGT CGCTGATC ACAAGCTA CTGTAGCC AGTACAAG AACAACCA AACCGAGA AACGCTTA AAGACGGA AAGGTACA ACACAGAA ACAGCAGA ACCTCCAA ACGCTCGA ACGTATCA ACTATGCA AGAGTCAA AGATCGCA AGCAGGAA AGTCACTA ATCCTGTA ATTGAGGA CAACCACA CAAGACTA CAATGGAA CACTTCGA CAGCGTTA CATACCAA CCAGTTCA CCGAAGTA CCGTGAGA CCTCCTGA CGAACTTA CGACTGGA CGCATACA CTCAATGA CTGAGCCA CTGGCATA GAATCTGA GACTAGTA GAGCTGAA GATAGACA GCCACATA GCGAGTAA GCTAACGA GCTCGGTA GGAGAACA GGTGCGAA GTACGCAA GTCGTAGA GTCTGTCA GTGTTCTA TAGGATGA TATCAGCA TCCGTCTA TCTTCACA TGAAGAGA TGGAACAA TGGCTTCA TGGTGGTA TTCACGCA AACTCACC AAGAGATC AAGGACAC AATCCGTC AATGTTGC ACACGACC ACAGATTC AGATGTAC AGCACCTC AGCCATGC AGGCTAAC ATAGCGAC ATCATTCC ATTGGCTC CAAGGAGC CACCTTAC CCATCCTC CCGACAAC CCTAATCC CCTCTATC CGACACAC CGGATTGC CTAAGGTC GAACAGGC GACAGTGC GAGTTAGC GATGAATC GCCAAGAC ${base}_cell1.2.fq.gz ${base}_cell2.2.fq.gz ${base}_cell3.2.fq.gz ${base}_cell4.2.fq.gz ${base}_cell5.2.fq.gz ${base}_cell6.2.fq.gz ${base}_cell7.2.fq.gz ${base}_cell8.2.fq.gz ${base}_cell9.2.fq.gz ${base}_cell10.2.fq.gz ${base}_cell11.2.fq.gz ${base}_cell12.2.fq.gz ${base}_cell13.2.fq.gz ${base}_cell14.2.fq.gz ${base}_cell15.2.fq.gz ${base}_cell16.2.fq.gz ${base}_cell17.2.fq.gz ${base}_cell18.2.fq.gz ${base}_cell19.2.fq.gz ${base}_cell20.2.fq.gz ${base}_cell21.2.fq.gz ${base}_cell22.2.fq.gz ${base}_cell23.2.fq.gz ${base}_cell24.2.fq.gz ${base}_cell25.2.fq.gz ${base}_cell26.2.fq.gz ${base}_cell27.2.fq.gz ${base}_cell28.2.fq.gz ${base}_cell29.2.fq.gz ${base}_cell30.2.fq.gz ${base}_cell31.2.fq.gz ${base}_cell32.2.fq.gz ${base}_cell33.2.fq.gz ${base}_cell34.2.fq.gz ${base}_cell35.2.fq.gz ${base}_cell36.2.fq.gz ${base}_cell37.2.fq.gz ${base}_cell38.2.fq.gz ${base}_cell39.2.fq.gz ${base}_cell40.2.fq.gz ${base}_cell41.2.fq.gz ${base}_cell42.2.fq.gz ${base}_cell43.2.fq.gz ${base}_cell44.2.fq.gz ${base}_cell45.2.fq.gz ${base}_cell46.2.fq.gz ${base}_cell47.2.fq.gz ${base}_cell48.2.fq.gz ${base}_cell49.2.fq.gz ${base}_cell50.2.fq.gz ${base}_cell51.2.fq.gz ${base}_cell52.2.fq.gz ${base}_cell53.2.fq.gz ${base}_cell54.2.fq.gz ${base}_cell55.2.fq.gz ${base}_cell56.2.fq.gz ${base}_cell57.2.fq.gz ${base}_cell58.2.fq.gz ${base}_cell59.2.fq.gz ${base}_cell60.2.fq.gz ${base}_cell61.2.fq.gz ${base}_cell62.2.fq.gz ${base}_cell63.2.fq.gz ${base}_cell64.2.fq.gz ${base}_cell65.2.fq.gz ${base}_cell66.2.fq.gz ${base}_cell67.2.fq.gz ${base}_cell68.2.fq.gz ${base}_cell69.2.fq.gz ${base}_cell70.2.fq.gz ${base}_cell71.2.fq.gz ${base}_cell72.2.fq.gz ${base}_cell73.2.fq.gz ${base}_cell74.2.fq.gz ${base}_cell75.2.fq.gz ${base}_cell76.2.fq.gz ${base}_cell77.2.fq.gz ${base}_cell78.2.fq.gz ${base}_cell79.2.fq.gz ${base}_cell80.2.fq.gz ${base}_cell81.2.fq.gz ${base}_cell82.2.fq.gz ${base}_cell83.2.fq.gz ${base}_cell84.2.fq.gz ${base}_cell85.2.fq.gz ${base}_cell86.2.fq.gz ${base}_cell87.2.fq.gz ${base}_cell88.2.fq.gz ${base}_cell89.2.fq.gz ${base}_cell90.2.fq.gz ${base}_cell91.2.fq.gz ${base}_cell92.2.fq.gz ${base}_cell93.2.fq.gz ${base}_cell94.2.fq.gz ${base}_cell95.2.fq.gz ${base}_cell96.2.fq.gz ${base}_noid.2.fq.gz
done