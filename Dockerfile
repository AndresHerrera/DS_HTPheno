FROM ubuntu:latest
MAINTAINER Andres Herrera - Mario Castillo "fabio.herrera@correounivalle.edu.co - mario.castillo@correounivalle.edu.co"
RUN apt-get update -y
RUN apt-get install -y libgdal-dev libgeos-dev libproj-dev libudunits2-dev liblwgeom-dev


RUN apt-get install -y sudo libgeos-dev libproj-dev libgdal-dev
#RUN R -e "install.packages(c('devtools','sp'), repos='https://cloud.r-project.org/')"
#RUN R -e "devtools::install_github('RcppCore/Rcpp')"
#RUN apt-get update
RUN apt-get install -y vim procps
#RUN apt-get install -y software-properties-common
#RUN add-apt-repository -y "ppa:marutter/rrutter"
#RUN add-apt-repository -y "ppa:marutter/c2d4u"
#RUN apt-get update
#RUN apt-get install -y r-cran-readr
#RUN add-apt-repository -y "ppa:ubuntugis/ubuntugis-unstable"
#RUN apt-get update
#RUN apt-get install -y libgdal-dev libgeos-dev libproj-dev libudunits2-dev liblwgeom-dev

RUN R -e "install.packages(c('rgdal','rgeos','raster') ,repos='https://cloud.r-project.org/',dependencies=TRUE)"

COPY *.R .
COPY *.sh .
COPY *.submit .



