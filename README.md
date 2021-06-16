<!-- badges: start -->
  [![Launch Rstudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/yanxianl/Li_AqFl1-Microbiota_2020/master?urlpath=rstudio)
  <!-- badges: end -->
 
## Reproducible changes in the intestinal microbiota of Atlantic salmon fed diets containing black soldier fly larvae meal

Being part of the natural diets of fish, insects have become a realistic, sustainable feed ingredient for aquaculture. While nutritional values of insects have been extensively studied in various fish species, their impact on the fish microbiota remains to be fully explored. In an 8-week freshwater feeding trial, Atlantic salmon (*Salmo salar*) were fed either a commercially relevant reference diet, or an insect meal diet wherein black soldier fly (*Hermetia illucens*) larvae meal comprised 60% of total ingredients. Microbiota of digesta and mucosa origin from the proximal and distal intestine were collected and profiled along with feed and water samples. The insect meal diet markedly modulated the salmon intestinal microbiota. Overall, the microbial diversity was lower in the digesta of salmon fed the insect meal diet but higher in the mucosa. A group of bacterial genera, dominated by members of the *Bacillaceae* family, were enriched in salmon fed the insect meal diet, which largely recapitulates our previous findings in a seawater feeding trial. We also found that feed microbiota showed a close resemblance to that observed in the intestine whereas water microbiota was distinct from the intestinal microbiota. Notably, bacterial genera associated with the diet effects were present in the feeds as well. In conclusion, our results show consistent changes in the intestinal microbiota of Atlantic salmon fed diets containing black soldier fly larvae meal.

### Overview

Here's an overview of the file organization in this project.
```
root
├── code
│   ├── 00_setup.ipynb
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
### How to regenerate results

Computationally lightweight RMarkdown files can be directly run online by clicking the ![Launch Binder](http://mybinder.org/badge_logo.svg) badge located at the top of this README. After clicking the badge, this repository will be turned into an RStudio instance that has all the dependencies installed. The instance has limited computational resources (1~2GB RAM) and is not intended for intensive computation (e.g., 01_dada2*.Rmd).

To reproduce the figures and tables published with the paper, run the following RMarkdown files:

* 03_filtering.Rmd
  * Table S1
* 08_taxonomy.Rmd    
  * Figure 1-3, Figure S1
* 09_alpha_-_diversity.Rmd 
  * Figure 4, Figure S2
* 10_beta_-_diversity.Rmd
  * Figure 5, Figure S3
  * Table 2
* 11_multivariable_association.Rmd 
  * Figure 6-7
  
### How to regenerate this repository

#### Dependencies and locations

* [Miniconda3](https://docs.conda.io/en/latest/miniconda.html) should be located in your HOME directory.
* [QIIME2 (2020.11)](https://docs.qiime2.org/2020.11/) should be installed within a Miniconda3 environment named as `qiime2-2020.11`.
  * QIIME2 library: [DEICODE (0.2.3)](https://library.qiime2.org/plugins/deicode/19/) should be installed within the qiime2 conda environment.
  * [grabseqs (0.7.0)](https://github.com/louiejtaylor/grabseqs) should be installed within the qiime2 conda environment.
* [Pandoc (2.5)](https://pandoc.org/index.html) should be located in your PATH.
* R (4.0.5) should be located in your PATH.
* R packages (packageName_version[source]): 
  * afex_0.28-1 [CRAN]
  * ape_5.5 [CRAN]
  * biomformat_1.18.0 [Bioconductor 3.12]
  * Biostrings_2.58.0 [Bioconductor 3.12]
  * circlize_0.4.12 [CRAN]
  * ComplexHeatmap_2.6.0 [Bioconductor 3.12]
  * cowplot_1.1.1 [CRAN]
  * dada2_1.18.0 [Bioconductor 3.12]
  * DECIPHER_2.18.1 [Bioconductor 3.12]
  * decontam_1.10.0 [Bioconductor 3.12]
  * DT_0.18 [CRAN]
  * emmeans_1.6.0 [CRAN]
  * flextable_0.6.5 [CRAN]
  * ggh4x_0.1.2.1 [CRAN]
  * ggpubr_0.4.0 [CRAN]
  * ggResidpanel_0.3.0 [CRAN]
  * ggsignif_0.6.1 [CRAN] 
  * ggstatsplot_0.7.2 [CRAN]
  * ggtext_0.1.1 [CRAN]
  * gt_0.2.2 [CRAN]
  * here_1.0.1 [CRAN]
  * Hmisc_4.5-0 [CRAN]
  * knitr_1.33 [CRAN]
  * Maaslin2_1.4.0 [Bioconductor 3.12]
  * magick_2.7.1 [CRAN]
  * MicrobeR_0.3.2 [github::jbisanz/MicrobeR@9f4e593]
  * microbiome_1.12.0 [Bioconductor 3.12] 
  * mixOmics_6.14.0 [Bioconductor 3.12]
  * officer_0.3.18 [CRAN]
  * parallel_4.0.5 [CRAN]
  * patchwork_1.1.1 [CRAN]
  * PerformanceAnalytics_2.0.4 [CRAN]
  * phangorn_2.6.3 [Bioconductor 3.12]
  * philr_1.16.0 [Bioconductor 3.12]
  * phyloseq_1.34.0 [Bioconductor 3.12] 
  * plotly_4.9.3 [CRAN]
  * plyr_1.8.6 [CRAN]
  * qiime2R_0.99.35 [github::jbisanz/qiime2R@077b08b]
  * RColorBrewer_1.1-2 [CRAN]
  * RUVSeq_1.24.0  [Bioconductor 3.12] 
  * rlang_0.4.11 [CRAN] 
  * rmarkdown_2.7 [CRAN] 
  * scales_1.1.1 [CRAN]
  * speedyseq [github::mikemc/speedyseq@8daed32]
  * sva_3.38.0 [Bioconductor 3.12]
  * tidyverse_1.3.1 [CRAN]
  * usedist_0.4.0 [CRAN]
  * vegan_2.5-7 [CRAN]
  * webshot2_0.0.0.9000 [github::rstudio/webshot2]
  
#### Running the analysis

All the code should be run from the project's root directory.

1.Download or clone this github repository to your local computer.
```bash
# clone the github repository
git clone https://github.com/yanxianl/Li_AqFl1-Microbiota_2021.git

# delete the following folders which produce errors when computing beta-diversity metrics
rm -rf \ 
data/intermediate/qiime2/asv/core-metrics-results/ \ 
data/intermediate/qiime2/asv/robust-Aitchison-pca/ \
data/intermediate/qiime2/99otu/core-metrics-results/ \ 
data/intermediate/qiime2/99otu/robust-Aitchison-pca/ \
data/intermediate/qiime2/97otu/core-metrics-results/ \
data/intermediate/qiime2/97otu/core-metrics-results-digesta/ \
data/intermediate/qiime2/97otu/core-metrics-results-mucosa-feed-water/ \
data/intermediate/qiime2/97otu/robust-Aitchison-pca/ \ 
data/intermediate/qiime2/97otu/robust-Aitchison-pca-digesta/ \ 
data/intermediate/qiime2/97otu/robust-Aitchison-pca-mucosa-feed-water/
```
2.Download raw sequence data, silva132 reference database and silva128 SEPP reference phylogeny.
```bash
# activate qiime2 environment
source $HOME/miniconda3/bin/activate
conda activate qiime2-2020.11

# excute jupyter notebook
jupyter nbconvert --execute --to html code/00_setup.ipynb
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

* Add a driver script to automate all the analysis, e.g., `make ` or `snakemake`.

### Acknowledgements

The project organization was inspired by the Riffomonas project, maintained by Dr. Pat Schloss. Visit the [*Riffomonas*](http://www.riffomonas.org/) website to check out tutorials on reproducible data analysis for microbiome research.
