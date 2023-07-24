cd $SCRATCH/MGI/data/cropped/MGI/
for fastq in *fq.gz
  do
#Name from mgi: E100040574_L01_samplename_readnum.fq.gz
# Name I want: MGI_[Sample Name]_S1_L00[Lane Number]_[Read Type]_001.fastq.gz
samplename=$(echo $fastq | cut -f3 -d "_")
readnum=$(echo $fastq | cut -f4 -d "_" | cut -f1 -d ".")
#lane number is always 1

#echo $samplename is samplename
#echo $readnum is readnum
mv $fastq MGI_${samplename}_S1_L001_R${readnum}_001.fastq.gz

 done

#additionally change names to match the ones I already have for the illumina Cellranger I already ran
rename MGI_1 MGI_ZB1 *
rename MGI_2 MGI_ZB2 *
rename MGI_3 MGI_ZB3 *
rename MGI_D MGI_TH *
rename MGI_R MGI_RT *
