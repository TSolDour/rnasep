#!/bin/bash
#SBATCH -p long
#SBATCH -J EggNOG.rnasep1
#SBATCH --cpus-per-task=20
#SBATCH --mem-per-cpu=20G
#SBATCH -t 20:00:00
#SBATCH --error=eggnog_%j.err
#SBATCH --output=eggnog_%j.out

#Purge unused modules
module purge

#Load modules
module load eggnog-mapper/2.1.11

cd /shared/projects/rnasep/5-AssemblyAnnotation/EggNOG/rnasep1/

export EGGNOG_DATA_DIR=/shared/projects/rnasep/5-AssemblyAnnotation/EggNOG/data/

#Defining variables
QUERY=Trinity_rnasep1.Trinity95.fasta.transdecoder.pep
GFF=Trinity_rnasep1.Trinity95.fasta.transdecoder.WB.gff3
OUTDIR=/shared/projects/rnasep/5-AssemblyAnnotation/EggNOG/rnasep1/output

emapper.py -i ${QUERY} -m diamond --evalue 0.001 --tax_scope auto --target_orthologs all --go_evidence all --pfam_realign none --decorate_gff ${GFF} --output_dir ${OUTDIR} -o rnasep1_Trinity95. --excel --cpu 20 
