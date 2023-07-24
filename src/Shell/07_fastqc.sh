#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N fastqc
#$ -cwd                  
###$ -l h_rt=00:00:10 #test
#$ -l h_rt=46:00:00 #test
#$ -l h_vmem=8G #test
#$ -pe sharedmem 16 #test
#  These options are:
#  job name: -N
# Initialise the environment modules
. /etc/profile.d/modules.sh

# Load trimmomatic
module load igmm/apps/FastQC/0.11.9 

cd /exports/eddie/scratch/nbestard/MGI/


# For each samples groups
#for group in illumina/David illumina/RT illumina/ZB MGI
#do
 # echo Group is $group
  #ls data/cropped/$group/
  mkdir -p outs/fastqc/downsampled/
  fastqc -t 16 --noextract -o outs/fastqc/downsampled/ data/cropped/downsampled/* 
#done

