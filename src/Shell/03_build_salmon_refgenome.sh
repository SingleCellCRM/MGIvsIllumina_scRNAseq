#!/bin/bash
#$ -l h_rt=30:00:00
#$ -l h_vmem=12G
#$ -cwd
#$ -pe sharedmem 8
#$ -N custom_refgenome

# # Initialise the environment modules
. /etc/profile.d/modules.sh

module load igmm/apps/cellranger/7.0.0

## on the command line 
#wget https://ftp.ensembl.org/pub/release-109/fasta/salmo_salar/dna/Salmo_salar.Ssal_v3.1.dna.toplevel.fa.gz
#wget https://ftp.ensembl.org/pub/release-109/gtf/salmo_salar/Salmo_salar.Ssal_v3.1.109.gtf.gz
#gunzip Salmo_salar.Ssal_v3.1.dna.toplevel.fa.gz
#gunzip Salmo_salar.Ssal_v3.1.109.gtf.gz

# go to where the files are
cd /exports/eddie/scratch/$USER/MGI/data/ref_genome/ssal_v3.1

# remove non-protein coding genes
 cellranger mkgtf \
Salmo_salar.Ssal_v3.1.109.gtf \
Salmo_salar.Ssal_v3.1.109_protein_coding.gtf \
--attribute=gene_biotype:protein_coding

# build reference
cellranger mkref --genome="Salmo_salar_refgenome" \
  --fasta=Salmo_salar.Ssal_v3.1.dna.toplevel.fa \
  --genes=Salmo_salar.Ssal_v3.1.109.gtf
