FROM eddelbuettel/r2u:22.04
 
# By default RStudio does not give access to all enviornment variables defined in the container (e.g. using ShinyProxy).
# These lines change this behavior.
RUN mkdir -p /etc/cont-init.d \
  && echo "#!/usr/bin/with-contentv bash" > /etc/cont-init.d/04_copy_env.sh \
  && echo "printenv >> /home/$DEFAULT_USER/.Renviron" >> /etc/cont-init.d/04_copy_env.sh
 
# Install {remotes}
RUN install2.r remotes
 
# Create a temporary directory to build the package
RUN mkdir /build_zone
ADD .     /build_zone
WORKDIR   /build_zone
 
# Install the integral package dependency
#RUN R -e 'remotes::install_github(lib = "/usr/local/lib/R/site-library", "https://github.com/IntegralEnvision/integral")'

# Install our package
#RUN R -e 'remotes::install_local(lib = "/usr/local/lib/R/site-library", upgrade = "never")' \
#  && rm -rf /build_zone
 
WORKDIR /data/

# Copy data
COPY files/        .
COPY images/       .
COPY infographics/ .
COPY lib/          .
COPY news/         .
COPY renv/         .
 
EXPOSE 3838

CMD ["R", "-e", "options('shiny.port' = 3838, shiny.host = '0.0.0.0'); library(CGTransducerApp); CGTransducerApp::run_app()"]
#CMD R -e "options('shiny.port' = 3838, shiny.host = '0.0.0.0'); library(CGTransducerApp); CGTransducerApp::run_app()"

