 #!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N downsample
#$ -P scs_sccrm
#$ -cwd
#$ -l h_rt=30:00:00
#$ -l h_vmem=8G
##$ -pe sharedmem 16
#$ -M YourEmailAdress
#$ -m beas
#Array job specifications:
#$ -t 1-24 #IMPORTANT: change to 1-num_of_samples
# To run in chuncks of 3  uncoment this
##$ -tc 3

# Initialise the environment modules
. /etc/profile.d/modules.sh

module load roslin/bbmap/38.11

# each read is a job

ids="/exports/eddie/scratch/$USER/MGI/data/cropped_reads_paths.txt"
ids1=$TMPDIR/ids_1.txt
ids2=$TMPDIR/ids_2.txt
grep _R1_001 $ids > $ids1
grep _R2_001 $ids > $ids2

read1=`sed -n ${SGE_TASK_ID}p "$ids1"`
read2=`sed -n ${SGE_TASK_ID}p "$ids2"`
read_basename1=$(basename $read1 .fastq.gz)
read_basename2=$(basename $read2 .fastq.gz)
out="/exports/eddie/scratch/$USER/MGI/data/cropped/downsampled/"
mkdir -p $out

reformat.sh in=$read1 in2=$read2 out=$out/${read_basename1}.fastq.gz out2=$out/${read_basename2}.fastq.gz samplereadstarget=300m


