#!/usr/bin/env bash

py=/home/circrna/miniconda3/bin/python3
fp=/home/circrna/miniconda3/bin/fastp
multiqc=/home/circrna/miniconda3/bin/multiqc
PIPELINE=/home/circrna/circrna-pipeline

fqfile=./PHS003316.txt
indir=/home/zhou/raid/ncbi/dbGaP-24835/RNA_phs003316/raw
oudir=/home/zhou/raid/IO_RNA/PHS003316/fq
nthreads=4

${py} ${PIPELINE}/common/ll_fq.py ${indir} --output ${fqfile}

nohup bash ${PIPELINE}/qc/fp.sh ${fqfile} ${indir} ${oudir} ${nthreads} ${fp} ${multiqc} &> PHS003316_qc.log &
