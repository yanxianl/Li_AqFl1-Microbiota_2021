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
├── DESCRIPTION
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
* [Pandoc (1.12.4.2)](https://pandoc.org/index.html) should be located in your PATH.
* R (4.0.5) should be located in your PATH.
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

1.Download or clone this github repository to your local computer.
```bash
# clone the github repository
git clone https://github.com/yanxianl/Li_AqFl1-Microbiota_2021.git

# delete the following folders which would cause problems when computing beta-diversity metrics
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
data/intermediate/qiime2/97otu/robust-Aitchison-pca-mucosa-feed-water/ \ 
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

The project organization was inspired by the Riffomonas project, maintained by Dr. Pat Schloss. Visit the [*Riffomonas*](http://www.riffomonas.org/) website for tutorials on reproducible data analysis in microbiome research. 

The R package [holepunch](https://karthik.github.io/holepunch/) was used to make this repository [binder](https://mybinder.org/)-ready. 
