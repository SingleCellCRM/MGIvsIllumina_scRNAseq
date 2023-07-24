for fastq in *fq.gz
  do
#Name from mgi: MGI_samplename_readnum.fq.gz
# Name I want: MGI_[Sample Name]_S1_L00[Lane Number]_[Read Type]_001.fastq.gz
samplename=$(echo $fastq | cut -f2 -d "_")
readnum=$(echo $fastq | cut -f3 -d "_" | cut -f1 -d ".")

#echo $samplename is samplename
#echo $readnum is readnum
mv $fastq MGI_${samplename}_S1_L001_R${readnum}_001.fastq.gz

 done

#additionally the one with just numbers is too confusing:
rename MGI_1 MGI_ZB1
rename MGI_2 MGI_ZB2
rename MGI_3 MGI_ZB3