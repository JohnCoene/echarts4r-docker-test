FROM rocker/r-ver:4.0.2

RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libglpk-dev

RUN R -e "install.packages('remotes')"
RUN R -e "remotes::install_version('shiny')"
RUN R -e "remotes::install_github('JohnCoene/echarts4r')"

RUN mkdir /root/app
COPY . /root/app
   
EXPOSE 3838
CMD ["R", "-e", "shiny::runApp('/root/app', port = 3838, host = '0.0.0.0')"]
