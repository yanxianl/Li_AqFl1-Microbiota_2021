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
RUN R -e "install.packages(c('devtools'))"

# install packages from GitHub
RUN R -e "devtools::install_github('jokergoo/ComplexHeatmap@9c277dd',dependencies=TRUE,upgrade='never')"\

USER ${NB_USER}

