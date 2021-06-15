FROM rocker/binder:3.6.3
LABEL maintainer='Yanxian Li'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

# install from bioconductor and github
RUN apt-get update -y\
&& apt-get install -y dpkg-dev zlib1g-dev libssl-dev libffi-dev\
&& apt-get install -y curl libcurl4-openssl-dev\
&& apt-get install -y git\
&& R -e "install.packages(c('BiocManager','devtools'))"\
&& R -e "BiocManager::install(c('biomformat','Biostrings','ComplexHeatmap','dada2','DECIPHER','decontam','microbiome','mixOmics','phangorn','philr','phyloseq','RUVSeq'))"\
&& R -e "devtools::install_github(c('jbisanz/MicrobeR@9f4e593','jbisanz/qiime2R@077b08b','mikemc/speedyseq@8daed32','teunbrand/ggh4x@v0.1.2','jtleek/sva-devel@3f50493','biobakery/Maaslin2@1.4.0','r-lib/later@v1.2.0','rstudio/chromote@e423b4b','rstudio/promises@v1.1.1','dmurdoch/webshot2@fixlockup'),upgrade='never')"

USER ${NB_USER}

RUN wget https://github.com/yanxianl/Li_AqFl1-Microbiota_2020/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2021-05-10/')); devtools::install_deps()"
RUN rm DESCRIPTION.1; exit 0


