#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N cropfastqs
#$ -cwd                  
#$ -l h_rt=46:00:00 
#$ -l h_vmem=16G
#$ -pe sharedmem 16
#  These options are:
#  job name: -N
# Initialise the environment modules
. /etc/profile.d/modules.sh

# Load trimmomatic
module load igmm/apps/trimmomatic/0.39

cd /exports/eddie/scratch/nbestard/MGI 
# For each samples groups
for group in David RT
do
  echo Group is $group
  mkdir -p outs/cropped/illumina/$group/
  # for each read1 trim to 28
  for read in data/illumina/$group/*_R1*.fastq.gz
  do
    R1=$(basename $read)
    echo "the read is " $R1
    trimmomatic SE -threads 16 data/illumina/$group/$R1 outs/cropped/illumina/$group/$R1 CROP:28
  done
  # for read2 trim to 90
  for read in data/illumina/$group/*R2*.fastq.gz
  do
    R2=$(basename $read)
    echo "the read is " $R2
    trimmomatic SE -threads 16 data/illumina/$group/$R2 outs/cropped/illumina/$group/$R2 CROP:90
  done
done

# the ZB group is already trimmed to the right size
cp -r data/illumina/ZB outs/cropped/illumina/
