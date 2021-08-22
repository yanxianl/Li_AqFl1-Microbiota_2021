[![DOI](https://zenodo.org/badge/272967155.svg)](https://zenodo.org/badge/latestdoi/272967155)

## Consistent changes in the intestinal microbiota of Atlantic salmon fed insect meal diets
### doi: https://doi.org/10.1101/2021.07.04.451034

Being part of fish's natural diets, insects have become a realistic, sustainable feed ingredient for aquaculture. While nutritional values of insects have been extensively studied in various fish species, their impact on the fish microbiota remains to be fully explored. In an 8-week freshwater feeding trial, Atlantic salmon (*Salmo salar*) were fed either a commercially relevant reference diet or an insect meal diet wherein black soldier fly (*Hermetia illucens*) larvae meal comprised 60% of total ingredients. Microbiota of digesta and mucosa origin from the proximal and distal intestine were collected and profiled along with feed and water samples. The insect meal diet markedly modulated the salmon intestinal microbiota. Overall, the microbial diversity was lower in the digesta of salmon fed the insect meal diet but higher in the mucosa. A particular group of bacterial genera, dominated by members of the *Bacillaceae* family, was enriched in salmon fed the insect meal diet, which confirms our previous findings in a seawater feeding trial. We also found that microbiota in the intestine closely resembled that of the feeds but was distinct from the water microbiota. Notably, bacterial genera associated with the diet effects were present in the feeds as well. In conclusion, our results show consistent changes in the intestinal microbiota of Atlantic salmon fed diets containing black soldier fly larvae meal. The next challenge is to evaluate the extent to which these alterations are attributable to feed microbiota and dietary nutrients and what these changes mean for fish physiology and health. 

### Overview

Here's an overview of the file organization in this project.
```
root
├── code
│   ├── 00_setup.ipynb
│   ├── 00_setup.html
│   ├── 01_dada2_run1.html
│   ├── 01_dada2_run1.Rmd
│   ├── 01_dada2_run2.html
│   ├── 01_dada2_run2.Rmd
│   ├── 02_qiime2_part1.html
│   ├── 02_qiime2_part1.ipynb
│   ├── 03_filtering.html
│   ├── 03_filtering.Rmd
│   ├── 04_qiime2_part2.html
│   ├── 04_qiime2_part2.ipynb
│   ├── 05_batch_correction.html
│   ├── 05_batch_correction.Rmd
│   ├── 06_qiime2_part3.html
│   ├── 06_qiime2_part3.ipynb
│   ├── 07_qiime2R.html
│   ├── 07_qiime2R.Rmd
│   ├── 08_taxonomy.html
│   ├── 08_taxonomy.Rmd
│   ├── 09_alpha_diversity.html
│   ├── 09_alpha_diversity.Rmd
│   ├── 10_beta_diversity.html
│   ├── 10_beta_diversity.Rmd
│   ├── 11_multivariable_association.html
│   ├── 11_multivariable_association.Rmd
│   ├── functions
│   │   ├── plot_prevalence.R
│   │   ├── plot_frequency.R
│   │   └── plot_heatmap.R
│   └── README.md
├── data
│   ├── raw
│   │   ├── casava-18-paired-end-demultiplexed-run1
│   │   ├── casava-18-paired-end-demultiplexed-run2
│   │   ├── qPCR
│   │   └── README.md
│   ├── reference
│   │   ├── mock_description.pdf
│   │   ├── mock-expected.biom
│   │   ├── mock-expected.qza
│   │   ├── mock_expected.tsv
│   │   ├── sepp-refs-silva-128.qza
│   │   ├── silva_132_99_16S.fna
│   │   ├── silva_132_consensus_taxonomy_l7.txt
│   │   └── README.md
│   ├── intermediate
│   │   ├── dada2
│   │   ├── filtering
│   │   ├── maaslin2
│   │   ├── permanova
│   │   ├── qiime2
│   │   ├── qiime2R
│   │   └── qPCR
│   └── metadata.tsv
├── result
│   ├── figure
│   │   ├── Figure 1.tiff
│   │   ├── Figure 2.tiff
│   │   ├── Figure 3.tiff
│   │   ├── Figure 4.tiff
│   │   ├── Figure 5.tiff
│   │   ├── Figure 6.tiff
│   │   ├── Figure 7.tiff
│   │   ├── Figure S1.tiff
│   │   ├── Figure S2.tiff
│   │   └── Figure S3.tiff
│   └── table
│       └── Table S1.csv
├── Li_AqFl1-Microbiota_2021.Rproj
├── LICENSE.md
└── README.md
```

### How to regenerate this repository

#### Dependencies and locations

* [Miniconda3](https://docs.conda.io/en/latest/miniconda.html) should be located in your HOME directory.
* [QIIME2 (2020.11)](https://docs.qiime2.org/2020.11/) should be installed within a Miniconda3 environment named as `qiime2-2020.11`.
  * QIIME2 library: [DEICODE (0.2.3)](https://library.qiime2.org/plugins/deicode/19/) should be installed within the qiime2 conda environment.
  * [grabseqs (0.7.0)](https://github.com/louiejtaylor/grabseqs) should be installed within the qiime2 conda environment.
* [Pandoc (2.5)](https://pandoc.org/index.html) should be located in your PATH.
* [R](https://www.r-project.org/) (4.0.5) should be located in your PATH.
* R packages and versions: see session information at the end of each rmarkdown report.
  
#### Running the analysis

All the code should be run from the project's root directory.

1.Download or clone this github repository to your local computer.
```bash
# clone the github repository
git clone https://github.com/yanxianl/Li_AqFl1-Microbiota_2021.git

# delete the following folders and the associated files 
rm -rf \
data/intermediate/qiime2/*/core-metrics-results*/ \
data/intermediate/qiime2/*/robust-Aitchison-pca*/ 
```
2.Download raw sequence data, SILVA132 reference database and SILVA128 SEPP reference phylogeny (`code/00_setup.ipynb`).
```bash
# activate qiime2 environment
source $HOME/miniconda3/bin/activate
conda activate qiime2-2020.11

# launch jupyter notebook to run code/00_setup.ipynb interactively
jupyter notebook

# shutdown jupyter notebook after running the code by pressing Ctrl + c in the terminal
```
3.Sequence denoising by dada2.
```bash
Rscript -e "rmarkdown::render('code/01_dada2_run1.Rmd')" && Rscript -e "rmarkdown::render('code/01_dada2_run2.Rmd')"
```
4.Taxonomic assignment.
```bash
jupyter nbconvert --execute --to html code/02_qiime2_part1.ipynb
```
5.Filter the feature table to remove: 1).chloroplast/mitochondria sequences and those without a phylum-level taxonomic assignment;
2).low-prevalence features that only present in one sample; 3).contaminating features.
```bash
Rscript -e "rmarkdown::render('code/03_filtering.Rmd')"
```
6.Phylogeny and core-metrics-results.
```bash
jupyter nbconvert --execute --to html code/04_qiime2_part2.ipynb
```
7.Batch effect adjustment.
```bash
Rscript -e "rmarkdown::render('code/05_batch_correction.Rmd')"
```
8.Split core-metrics-results based on the sequencing runs.
```bash
jupyter nbconvert --execute --to html code/06_qiime2_part3.ipynb
```
9.Import qiime2 artifacts into R.
```bash
Rscript -e "rmarkdown::render('code/07_qiime2R.Rmd')"
```
10.Taxonomic analysis.
```bash
Rscript -e "rmarkdown::render('code/08_taxonomy.Rmd')"
```
11.Alpha-diversity analysis.
```bash
Rscript -e "rmarkdown::render('code/09_alpha_diversity.Rmd')"
```
12.Beta-diversity analysis.
```bash
Rscript -e "rmarkdown::render('code/10_beta_diversity.Rmd')"
```
13.Association testing between microbial clades and sample metadata.
```bash
Rscript -e "rmarkdown::render('code/11_multivariable_association.Rmd')"
```

### To-do

* Add a driver script to automate all the analysis, e.g., `make`.

### Acknowledgements

The project organization was inspired by the Riffomonas project, maintained by Dr. Pat Schloss. Visit the [*Riffomonas*](http://www.riffomonas.org/) website to check out tutorials on reproducible data analysis for microbiome research.
