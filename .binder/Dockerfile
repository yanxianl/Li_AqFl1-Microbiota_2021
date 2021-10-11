FROM rocker/binder:3.6.3
LABEL maintainer='Yanxian Li'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

# install system dependencies
RUN apt-get update -y\
&& apt-get install -y dpkg-dev zlib1g-dev libssl-dev libffi-dev libmpfr-dev\
&& apt-get install -y curl libcurl4-openssl-dev\
&& apt-get install -y git\
&& apt-get install -y chromium

# install R packages from CRAN
RUN R -e "install.packages(c('BiocManager','devtools'))"

# install bioconductor packages
RUN R -e "BiocManager::install('biomformat')"\
&& R -e "BiocManager::install('Biostrings')"\
&& R -e "BiocManager::install('dada2')"\
&& R -e "BiocManager::install('DECIPHER')"\
&& R -e "BiocManager::install('decontam')"\
&& R -e "BiocManager::install('mixOmics')"\
&& R -e "BiocManager::install('RUVSeq')"\
&& R -e "BiocManager::install('phangorn')"\
&& R -e "BiocManager::install('phyloseq')"

# install packages from GitHub
RUN R -e "devtools::install_github('teunbrand/ggh4x@v0.1.2',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('jokergoo/ComplexHeatmap@0383bad',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('jsilve24/philr@6d6842a',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('jbisanz/MicrobeR@9f4e593',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('jbisanz/qiime2R@077b08b',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('mikemc/speedyseq@8daed32',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('jtleek/sva-devel@3f50493',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('biobakery/Maaslin2@1.4.0',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('microbiome/microbiome@44e86d2',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('r-lib/later@v1.2.0',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('r-lib/cpp11',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('rstudio/promises@v1.1.1',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('rstudio/websocket@v1.4.0',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('rstudio/chromote@2245a54',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('rstudio/webshot2@83aad5d',dependencies=TRUE,upgrade='never')"

USER ${NB_USER}

RUN wget https://github.com/yanxianl/Li_AqFl1-Microbiota_2020/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2021-05-10/')); devtools::install_deps()"
RUN rm DESCRIPTION.1; exit 0
