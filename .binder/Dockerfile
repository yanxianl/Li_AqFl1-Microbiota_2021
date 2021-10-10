FROM rocker/binder:3.6.3
LABEL maintainer='Yanxian Li'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

# install system dependencies
RUN apt-get update -y\
&& apt-get install -y dpkg-dev zlib1g-dev libssl-dev libffi-dev libmpfr-dev\
&& apt-get install -y curl libcurl4-openssl-dev\
&& apt-get install -y git

# install R packages from CRAN
RUN R -e "install.packages(c('BiocManager','devtools'))"\
&& R -e "devtools::install_version('webshot',version='0.5.2',dependencies=TRUE,upgrade='never')"\
&& R -e "webshot::install_phantomjs()"\
&& R -e "devtools::install_version('afex',version='0.28-1',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('ape',version='5.5',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('circlize',version='0.4.12',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('cowplot',version='1.1.1',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('DT',version='0.18',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('emmeans',version='1.6.0',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('flextable',version='0.6.5',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('ggh4x',version='0.1.2.1',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('ggpubr',version='0.4.0',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('ggResidpanel',version='0.3.0',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('ggsignif',version='0.6.1',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('ggstatsplot',version='0.7.2',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('ggtext',version='0.1.1',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('gt',version='0.2.2',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('here',version='1.0.1',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('Hmisc',version='4.5-0',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('knitr',version='1.33',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('magick',version='2.7.1',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('officer',version='0.3.18',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('patchwork',version='1.1.1',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('PerformanceAnalytics',version='2.0.4',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('plotly',version='4.9.3',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('plyr',version='1.8.6',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('RColorBrewer',version='1.1-2',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('rlang',version='0.4.11',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('rmarkdown',version='2.7',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('scales',version='1.1.1',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('rmarkdown',version='2.7',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('tidyverse',version='1.3.1',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('usedist',version='0.4.0',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_version('vegan',version='2.5-7',dependencies=TRUE,upgrade='never')"

# install bioconductor packages
RUN R -e "BiocManager::install('biomformat')"\
&& R -e "BiocManager::install('Biostrings')"\
&& R -e "BiocManager::install('ComplexHeatmap')"\
&& R -e "BiocManager::install('dada2')"\
&& R -e "BiocManager::install('DECIPHER')"\
&& R -e "BiocManager::install('decontam')"\
&& R -e "BiocManager::install('microbiome')"\
&& R -e "BiocManager::install('mixOmics')"\
&& R -e "BiocManager::install('RUVSeq')"\
&& R -e "BiocManager::install('phangorn')"\
&& R -e "BiocManager::install('phyloseq')"

# install packages from GitHub
RUN R -e "devtools::install_github('jsilve24/philr@6d6842a',upgrade='never')"\
&& R -e "devtools::install_github('jbisanz/MicrobeR@9f4e593',upgrade='never')"\
&& R -e "devtools::install_github('jbisanz/qiime2R@077b08b',upgrade='never')"\
&& R -e "devtools::install_github('mikemc/speedyseq@8daed32',upgrade='never')"\
&& R -e "devtools::install_github('teunbrand/ggh4x@v0.1.2',upgrade='never')"\
&& R -e "devtools::install_github('jtleek/sva-devel@3f50493',upgrade='never')"\
&& R -e "devtools::install_github('biobakery/Maaslin2@1.4.0',upgrade='never')"

USER ${NB_USER}
