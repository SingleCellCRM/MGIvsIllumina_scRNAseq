# in the anaconda power shell prompt
conda activate CRM_SingleCell
#pip install multiqc
#multiqc

cd .\Users\\nbestard\Uni_DS\CSCE\biology\groups\CRM_SingleCell\MGI\outs

cd .\fastqc_no_cropped\

multiqc .

multiqc --help

multiqc . -x '*_I*' --force

cd ..\fastqc
multiqc . -x "*_I*"