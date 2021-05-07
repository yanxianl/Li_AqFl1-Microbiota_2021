<!-- badges: start -->
  [![Launch Rstudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/yanxianl/Li_AqFl2-Microbiota_ASM_2020/master?urlpath=rstudio)
<!-- badges: end -->

## Reproducible changes in the intestinal microbiota of Atlantic salmon fed diets containing black soldier fly larvae meal

Abstract here.

### Overview

Here's an overview of the file organization in this project.
```
root
├── code                              # all the scripts used for the analysis
│   ├── functions                     # functions for automating tasks
│   ├── utilities                     # utility scripts for miscellaneous tasks
│   ├── 00_setup.bash                 # download raw and reference data for the analysis
│   ├── 01_dada2.Rmd                  # sequence denoising by the dada2 pipeline
│   ├── 02_qiime2_part1.bash          # taxonomic assignment in qiime2
│   ├── 03_preprocessing.Rmd          # feature table filtering    
│   ├── 04_qiime2_part2.bash          # phylogeny and core-metrics-results
│   ├── 05_qiime2R.Rmd                # export qiime2 artifacts into R
│   ├── 06_taxonomy.Rmd               # taxonomic analysis
│   ├── 07_alpha-diversity.Rmd        # alpha-diversity visualization and statistical analysis
│   ├── 08_beta-diversity.Rmd         # beta-diversity visualization and statistical analysis
│   ├── 09_metadata_association.Rmd   # association testing between microbial clades and sample metadata
│   └── README.md
├── data               # all the data, including raw, reference and intermediate data
│   ├── metadata.tsv   # sample metadata
│   ├── raw            # raw data
│   ├── reference      # reference data
│   ├── qPCR           # qPCR assay reports, plat-calibration and Cq values
│   ├── dada2          # outputs from dada2 including the representative sequences and feature table
│   ├── qiime2         # outputs from qiime2
│   ├── preprocessing  # plots for the identification of contaminants; filtered feature table   
│   ├── qiime2R        # RData containing outputs from qiime2
│   ├── permanova      # input data and results of the PERMANOVA
│   └── maaslin2       # default outputs from the maaslin2 program
├── image   # pictures/photos relevant to the analysis
├── result  # final results published with the paper
│   ├── figures    
│   ├── tables     
│   └── README.md 
├── LICENSE.md  
└── README.md
```
### How to regenerate figures and tables

Computationally lightweight RMarkdown files ([03, 05-09]_\*.Rmd) can be directly run online by clicking the ![Launch Binder](http://mybinder.org/badge_logo.svg) badge located at the top of this README. After clicking the badge, this repository will be turned into an RStudio instance that has all the dependencies installed and ready to go! The instance has limited computational resources (1~2GB RAM) and is not intended for intensive computation (e.g., 01_dada2.Rmd).

To reproduce the figures and tables published with the paper, run the following RMarkdown files:
* 03_preprocessing.Rmd
  * Figure S1  
  * Table S1
* 06_taxonomy.Rmd    
  * Figure 1-2, Figure S2
  * Table S2
* 07_alpha-diversity.Rmd 
  * Figure 3
* 08_beta-diversity.Rmd
  * Figure 4
  * Table 1-2
* 09_metadata_association.Rmd 
  * Figure 5, Figure S3-8
  
### How to regenerate this repository

#### Dependencies and locations

* [Miniconda3](https://docs.conda.io/en/latest/miniconda.html) should be located in your HOME directory.
* [grabseqs (0.7.0)](https://github.com/louiejtaylor/grabseqs) should be installed via the Miniconda3.
* [QIIME2 (2020.2)](https://docs.qiime2.org/2020.2/) should be installed within a Miniconda3 environment named as `qiime2-2020.2`.
  * QIIME2 library: [DEICODE (0.2.3)](https://library.qiime2.org/plugins/deicode/19/) should be installed within the conda environment of qiime2 (`qiime2-2020.2`).
* [Pandoc (1.12.4.2)](https://pandoc.org/index.html) should be located in your PATH.
* R (3.6.3) should be located in your PATH.
* R packages (packageName_version[source]): 
  * ape_5.3 [CRAN]
  * biomformat_1.14.0 [Bioconductor 3.10]
  * circlize_0.4.8 [CRAN]
  * ComplexHeatmap_2.2.0 [Bioconductor 3.10]
  * cowplot_1.0.0 [CRAN]
  * dada2_1.14.1 [Bioconductor 3.10]
  * DT_0.11 [CRAN]
  * EMAtools_0.1.3 [CRAN]
  * emmeans_1.4.4 [CRAN]
  * factoextra_1.0.6 [CRAN] 
  * ggResidpanel_0.3.0 [CRAN]
  * ggsignif_0.6.0 [CRAN] 
  * ggstatsplot_0.3.1 [CRAN]
  * gridExtra_2.3 [CRAN]
  * gt_0.1.0 [github::rstudio/gt@f793b33]
  * here_0.1 [CRAN]
  * knitr_1.27 [CRAN]
  * lmerTest_3.1-1 [CRAN]
  * lsr_0.5 [CRAN] 
  * Maaslin2_1.0.0 [Bioconductor 3.10]
  * MicrobeR_0.3.1 [github::jbisanz/MicrobeR@7207507]
  * microbiome_1.8.0 [Bioconductor 3.10] 
  * PerformanceAnalytics_1.5.3 [CRAN]
  * philr_1.12.0 [Bioconductor 3.10]
  * phyloseq_1.30.0 [Bioconductor 3.10] 
  * picante_1.8 [CRAN]
  * plotly_4.9.1 [CRAN]
  * qiime2R_0.99.13 [github::jbisanz/qiime2R@cd07f40]
  * RColorBrewer_1.1-2 [CRAN]
  * rlang_0.4.4 [CRAN] 
  * rmarkdown_2.1 [CRAN] 
  * scales_1.1.0 [CRAN]
  * tidyverse_1.3.0 [CRAN]
  * vegan_2.5-6 [CRAN]
  * venn_1.9 [CRAN]
  
#### Running the analysis

All the code should be run from the project's root directory.

1.Download or clone this github repository to your project's root directory.
```bash
# clone the github repository
git clone https://github.com/yanxianl/Li_AqFl2-Microbiota_ASM_2020.git

# delete the following folders which would otherwise cause problems when running `04_qiime2_part2.bash`
rm -rf data/qiime2/core-metrics-results/ data/qiime2/robust-Aitchison-pca/
```
2.Download the raw sequence data and reference database/phylogenetic tree for the analysis.
```bash
bash code/00_setup.bash
```
3.Sequence denoising by dada2.
```bash
Rscript -e "rmarkdown::render('code/01_dada2.Rmd')"
```
4.Taxonomic assignment in qiime2.
```bash
bash code/02_qiime2_part1.bash
```
5.Filter the feature table to remove: 1).chloroplast/mitochondria sequences and those without a phylum-level taxonomic annotation;
2).low-prevalence features that only present in one sample; 3).contaminating features.
```bash
Rscript -e "rmarkdown::render('code/03_preprocessing.Rmd')"
```
6.Phylogeny and core-metrics-results in qiime2.
```bash
bash code/04_qiime2_part2.bash
```
7.Export qiime2 outputs into R.
```bash
Rscript -e "rmarkdown::render('code/05_qiime2R.Rmd')"
```
8.Taxonomic analysis.
```bash
Rscript -e "rmarkdown::render('code/06_taxonomy.Rmd')"
```
9.Alpha-diversity visualization and statistical analysis.
```bash
Rscript -e "rmarkdown::render('code/07_alpha-diversity.Rmd')"
```
10.Beta-diversity visualization and statistical analysis.
```bash
Rscript -e "rmarkdown::render('code/08_beta-diversity.Rmd')"
```
11.Association testing between microbial clades and sample metadata.
```bash
Rscript -e "rmarkdown::render('code/09_metadata_association.Rmd')"
```

### To-do

* Add a driver script to automate all the analysis, e.g., `make ` or `snakemake`.

### Acknowledgements

The project organization was inspired by the Riffomonas project, maintained by Dr. Pat Schloss. visit the [*Riffomonas*](http://www.riffomonas.org/) website for tutorials on reproducible data analysis in microbiome research. 

The R package [holepunch](https://karthik.github.io/holepunch/) was used to make this repository [binder](https://mybinder.org/)-ready. 
