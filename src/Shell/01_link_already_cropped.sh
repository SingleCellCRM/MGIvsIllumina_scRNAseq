# some reads were already cropped to the right size, I create a symlink to original data
#MGI
cd /exports/eddie/scratch/nbestard/MGI/data/cropped/
ln -s ../E100040574/ ./MGI
# delete the txt files, we just want the fastqs
for file in MGI/*txt
do
unlink $file
done

#ZB
ln -s ../illumina/ZB ./illumina/ZB

# delete the indexing files
for file in ./illumina/ZB/*_I* ./illumina/ZB/*md5*
do 
unlink $file
done


