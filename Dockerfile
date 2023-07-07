FROM rocker/rstudio:4.2

RUN R -e "install.packages(c('dplyr', 'importinegi'), dependencies = TRUE)"