FROM ubuntu:latest
MAINTAINER Andres Herrera - Mario Castillo "fabio.herrera@correounivalle.edu.co - mario.castillo@correounivalle.edu.co"
RUN apt-get update -y
RUN apt-get install software-properties-common -y
RUN apt-get install python-software-properties -y
RUN add-apt-repository "ppa:marutter/rrutter" -y
RUN add-apt-repository "ppa:marutter/c2d4u" -y
RUN add-apt-repository "ppa:ubuntugis/ubuntugis-unstable" -y
RUN apt-get update -y
RUN apt-get install libgdal-dev libgeos-dev libproj-dev libudunits2-dev liblwgeom-dev -y
RUN apt-get install r-base -y
RUN apt-get install -y r-cran-readr
#RUN R -e "install.packages(c('devtools','sp'), repos='https://cloud.r-project.org/')"
#RUN R -e "devtools::install_github('RcppCore/Rcpp')"

RUN apt-get install -y vim procps git
RUN R -e "install.packages(c('raster') ,repos='https://cloud.r-project.org/',dependencies=TRUE)"
RUN R -e "install.packages(c('rgeos') ,repos='https://cloud.r-project.org/',dependencies=TRUE)"
RUN R -e "install.packages(c('rgdal') ,repos='https://cloud.r-project.org/',dependencies=TRUE)"

RUN mkdir /source
COPY *.R /source
COPY *.sh /source
COPY *.submit /source

WORKDIR /source
