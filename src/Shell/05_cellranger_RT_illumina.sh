#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N cellranger_illumina_RT
#$ -P scs_sccrm
#$ -cwd
#$ -l h_rt=30:00:00
#$ -l h_vmem=12G
#$ -pe sharedmem 16 
#$ -M YourEmailAdress   
#$ -m beas 
#$ -l test=1 # to avoid clshing between jobs`
#Array job specifications:          
#$ -t 1-2 #IMPORTANT: change to 1-num_of_samples

# To run in chuncks of 3  uncoment this
##$ -tc 8

# Initialise the environment modules
. /etc/profile.d/modules.sh

module load igmm/apps/cellranger/7.0.0 

# check if this is the Cellranger version you would like to use. 
# versions available in Eddie can be seen with the command `module available`


## Variables declaration, change them to match your setup:
# File with all the sample IDs, one per line
IDFILE="/exports/eddie/scratch/$USER/MGI/data/ids_RT.txt"


# Assigning SAMPLE variable from the built-in array counter
# for every array job (number indicated with the -t) the value of SAMPLE will be 
# replaced by the element of the nth line of the IDFILE 
SAMPLE=`sed -n ${SGE_TASK_ID}p "$IDFILE"`

# Path to the Reference Genome directory
REFGENOME="/exports/eddie/scratch/$USER/MGI/data/ref_genome/Salmo_salar_refgenome"
# Path to the directory where the samples are
FASTQS="/exports/eddie/scratch/nbestard/MGI/data/illumina/RT/RT_180123-GEX/outs/fastq_path/AAAWGVVHV"
# Path to where you want the cellranger output
OUT="/exports/eddie/scratch/$USER/MGI/outs/cellranger/illumina/RT"

# go to the temporary directory where 1TB per job is available.
# the intermediate files are very big
# so there is not enough space in the scratch space to process all 
# the SAMPLES
cd $TMPDIR

echo run cellranger count --sample="$SAMPLE" --id="$SAMPLE" --transcriptome="$REFGENOME" --fastqs="$FASTQS" --no-bam

cellranger count --sample="$SAMPLE" \
                   --id="$SAMPLE" \
                   --transcriptome="$REFGENOME" \
                   --fastqs="$FASTQS" \
                   --no-bam

# create the output directory if it does not exist yet 
mkdir -p $OUT
# copy the results from the temporary space to the output folder
rsync -rl $SAMPLE $OUT
