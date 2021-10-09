FROM rocker/binder:3.6.3
LABEL maintainer='Yanxian Li'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

# install system dependencies
RUN apt-get update -y\
&& apt-get install -y dpkg-dev zlib1g-dev libssl-dev libffi-dev\
&& apt-get install -y curl libcurl4-openssl-dev\
&& apt-get install -y git

# install BiocManager and remotes
RUN R -e "install.packages(c('BiocManager','remotes'))"

# install bioconductor packages
RUN R -e "BiocManager::install('biomformat',version='3.12')"\
&& R -e "BiocManager::install('Biostrings',version='3.12')"\
&& R -e "BiocManager::install('ComplexHeatmap',version='3.12')"\
&& R -e "BiocManager::install('dada2',version='3.12')"\
&& R -e "BiocManager::install('DECIPHER',version='3.12')"\
&& R -e "BiocManager::install('decontam',version='3.12')"\
&& R -e "BiocManager::install('microbiome',version='3.12')"\
&& R -e "BiocManager::install('mixOmics',version='3.12')"\
&& R -e "BiocManager::install('phangorn',version='3.12')"\
&& R -e "BiocManager::install('philr',version='3.12')"\
&& R -e "BiocManager::install('phyloseq',version='3.12')"\
&& R -e "BiocManager::install('RUVSeq',version='3.12')"

# install packages from GitHub
RUN R -e "remotes::install_github('jbisanz/MicrobeR@9f4e593',upgrade='always')"\
&& R -e "remotes::install_github('jbisanz/qiime2R@077b08b',upgrade='always')"\
&& R -e "remotes::install_github('mikemc/speedyseq@8daed32',upgrade='always')"\
&& R -e "remotes::install_github('teunbrand/ggh4x@v0.1.2',upgrade='always')"\
&& R -e "remotes::install_github('jtleek/sva-devel@3f50493',upgrade='always')"\
&& R -e "remotes::install_github('biobakery/Maaslin2@1.4.0',upgrade='always')"\
&& R -e "remotes::install_github('r-lib/later@v1.2.0',upgrade='always')"\
&& R -e "remotes::install_github('r-lib/cpp11',upgrade='always')"\
&& R -e "remotes::install_github('rstudio/promises@v1.1.1',upgrade='always')"\
&& R -e "remotes::install_github('rstudio/websocket@v1.4.0',upgrade='always')"\
&& R -e "remotes::install_github('rstudio/chromote@2245a54',upgrade='always')"\
&& R -e "remotes::install_github('rstudio/webshot2@83aad5d',upgrade='always')"


USER ${NB_USER}

RUN wget https://github.com/yanxianl/Li_AqFl1-Microbiota_2020/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2021-05-10/')); remotes::install_deps()"
RUN rm DESCRIPTION.1; exit 0
