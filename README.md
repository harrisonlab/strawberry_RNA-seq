# AMF-strawberry_RNA-seq

There's no transciptome for the octoploid - will need to build one.

The metabarcoding pipeline may prove useful for getting high quality, dereplicated reads from  RNA-seq data. 
This can then be fed into a a trinity/oasis pipeline.

## QC
FastQC
## Denovo assembly

### Split files
The files are large - some of the steps will get better performance on the cluster by splitting data into chunks.
```shell
splitfq.sh 
```
### Trim adapters
trimmomatic
### Join reads and quality filter
usearch
### Phix rRNA/cloroplast filter
bowtie2 or ublast
### Dereplicate 
dereplicate.sh
### Assemble
trinity
