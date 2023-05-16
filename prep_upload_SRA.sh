#!/bin/bash
# prepare upload folder for submitting WGS files to NCBI SRA

## copy all fastq files to one folder
wd=/raid10/siyuan/chtc_backup/siyuan/staging/sfeng77/dataset/dataset/suzukii_WGS/unpublished
path_fastq=$wd/BRC_archive  # folder that stores fastq files in different subfolders
for_submission=$wd/SRA_dsuz_8_samples   # local folder that have all fastq files for submission
mkdir $for_submission  # create an local folder

ls -R $path_fastq \
| awk '/:$/&&f{s=$0;f=0}
/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
NF&&f{print s"/"$0 }' \
| grep '.fastq.gz' \
| grep -v 'CPB2015' \
| xargs -I {} cp {} $for_submission &

## preupload to SRA with Aspera
path_keyfile=/home/siyuan/biosoft/miniconda3/envs/SRA_transfer/etc/aspera.openssh
ascp -i $path_keyfile -QT -l100m -k1 -d $for_submission subasp@upload.ncbi.nlm.nih.gov:uploads/SIYUAN.FENG_wisc.edu_Y6WOD8Bk &