FROM rocker/rstudio:4.2

WORKDIR .
COPY . /app

RUN R -e "install.packages(c('dplyr', 'importinegi'), dependencies = TRUE)"
