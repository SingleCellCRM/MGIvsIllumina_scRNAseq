cd $SCRATCH/MGI
ls -d $PWD/data/cropped/illumina/David/*fastq.gz > data/cropped_reads_paths.txt
ls -d $PWD/data/cropped/MGI/*fastq.gz >> data/cropped_reads_paths.txt
ls -d $PWD/data/cropped/illumina/ZB/*fastq.gz >> data/cropped_reads_paths.txt
# I do not include RT with the others as they need another number of downsampling
ls  -d $PWD/data/cropped/illumina/RT/*fastq.gz >> data/cropped_RT_reads_paths.txt

