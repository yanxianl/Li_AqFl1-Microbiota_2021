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
RUN R -e "BiocManager::install('Biostrings')"\
&& R -e "BiocManager::install('DECIPHER')"\
&& R -e "BiocManager::install('phangorn')"\
&& R -e "BiocManager::install('phyloseq')"

# install packages from GitHub
RUN R -e "devtools::install_github('jsilve24/philr@6d6842a',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('jbisanz/MicrobeR@9f4e593',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('jbisanz/qiime2R@077b08b',dependencies=TRUE,upgrade='never')"\
&& R -e "devtools::install_github('mikemc/speedyseq@8daed32',dependencies=TRUE,upgrade='never')"

USER ${NB_USER}