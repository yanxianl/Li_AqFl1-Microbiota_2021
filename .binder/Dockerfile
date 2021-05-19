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
&& R -e "devtools::install_github(c('jbisanz/MicrobeR@9f4e593','jbisanz/qiime2R@077b08b','mikemc/speedyseq@8daed32','teunbrand/ggh4x@v0.1.2','jtleek/sva-devel@3f50493','biobakery/Maaslin2@1.4.0'),upgrade='never')"

# install phantomJS
RUN apt-get install -y build-essential chrpath libxft-dev\
&& apt-get install -y libfreetype6 libfreetype6-dev\
&& apt-get install -y libfontconfig1 libfontconfig1-dev\
&& cd ~

RUN export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"\
&& wget https://github.com/Medium/phantomjs/releases/download/v2.1.1/$PHANTOM_JS.tar.bz2\
&& tar xvjf $PHANTOM_JS.tar.bz2\
&& mv $PHANTOM_JS /usr/local/share\
&& ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

USER ${NB_USER}

RUN wget https://github.com/yanxianl/Li_AqFl1-Microbiota_2020/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2021-05-10/')); devtools::install_deps()"
RUN rm DESCRIPTION.1; exit 0


