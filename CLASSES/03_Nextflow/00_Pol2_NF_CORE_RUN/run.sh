#!/bin/bash
#SBATCH -p short
#SBATCH --job-name=dahu3610_Pol2_test
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=dahu3610@colorado.edu
#SBATCH --output=nextflow.out
#SBATCH --error=nextflow.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=6gb
#SBATCH --time=10:00:00
pwd; hostname; date
echo "Lets do chipseq"
module load singularity/3.1.1
nextflow run nf-core/chipseq -r 1.2.1 \
-profile singularity \
--single_end \
--input design.csv \
--fasta /scratch/Shares/rinnclass/CLASS_2023/data/data/genomes/GRCh38.p13.genome.fa \
--gtf /scratch/Shares/rinnclass/CLASS_2023/data/data/genomes/gencode.v32.annotation.gtf \
--macs_gsize 3.2e9 \
--blacklist /scratch/Shares/rinnclass/CLASS_2023/data/data/genomes/hg38-blacklist.v2.bed \
--email dahu3610@colorado.edu \
-resume \
-c nextflow.config
date
