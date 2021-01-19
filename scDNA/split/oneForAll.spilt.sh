# modify T7 and T5 barcode in the "01_T7_split.sh" and "03_T5_split.sh"
mkdir 01_cut
cp ./splitbarcode0bp.pl ./01_cut
cp ./fqpick.pl ./01_cut
cp ./01_T7_split.sh ./01_cut
cp ./02_T7_fqpick.sh ./01_cut
cp ./03_T5_split.sh ./01_cut
cp ./03_T5_split_cycle.sh ./01_cut
cp ./04_T5_fqpick.sh ./01_cut
cp ./04_T5_fqpick_cycle.sh ./01_cut

sh ./00_cut21_read1.sh
sh ./00_cut27_read2.sh

cd ./01_cut
sh 01_T7_split.sh
sh 02_T7_fqpick.sh
sh 03_T5_split_cycle.sh
sh 04_T5_fqpick_cycle.sh


