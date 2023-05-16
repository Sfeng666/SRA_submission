# SRA_submission

## Notes
1. Each row of the SRA metadata sheet is an EXPERIMENT, which is represented by the combination of `library + sequencing strategy + layout + instrument model`. This means if you have multiple sequencing libraries prepared from one biological sample, they should fit in multiple rows in the SRA metadata sheet, with the same `sample name`. [See reference](https://www.ncbi.nlm.nih.gov/sra/docs/submitmeta/).
2. In cases where there are multiple sequencing runs on the same library of the same sample, files generated should be listed in the same row. If sequencing reads are pair-ended, the order of listed filenames should be `sequencing run1-end1, sequencing run1-end2, sequencing run2-end1, sequencing run2-end2, ...`. [See reference](https://www.ncbi.nlm.nih.gov/sra/docs/submitquestions/#question3sp).

## Command for preload data to SRA
```
ascp -i $path_keyfile -QT -l100m -k1 -d $for_submission subasp@upload.ncbi.nlm.nih.gov:uploads/SIYUAN.FENG_wisc.edu_Y6WOD8Bk &
```
`$path_keyfile` is the absolute path to the openssh key file, which is downloadable in the [submission system](https://submit.ncbi.nlm.nih.gov/subs/sra/).

`$for_submission` is the absolute path of the local folder that contains all files for submission.

`SIYUAN.FENG_wisc.edu_Y6WOD8Bk` is a relative path automatically generated based on the username and an system-assigned unique string.
