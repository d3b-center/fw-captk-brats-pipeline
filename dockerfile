# Creates docker container
#       original source:
#           https://github.com/scitran-apps/fsl-bet/blob/master/Dockerfile
#       modified by amf on April 2 2021 for captk-brats-pipeline gear
#

#############################################
# Select the OS
FROM cbica/captk:2021.03.29
LABEL authors="CBICA_UPenn <software@cbica.upenn.edu>"

#############################################
# Install necessary packages
RUN sudo apt-get update
RUN sudo apt-get install -y jq python3-nibabel python3-numpy python3-six

#############################################
# Setup default flywheel/v0 directory
ENV FLYWHEEL=/flywheel/v0
RUN mkdir -p ${FLYWHEEL}
WORKDIR ${FLYWHEEL}
COPY run ${FLYWHEEL}/run
COPY manifest.json ${FLYWHEEL}/manifest.json
COPY *.py ${FLYWHEEL}/

#############################################
# Configure entrypoint
RUN chmod a+x /flywheel/v0/run
ENTRYPOINT ["/flywheel/v0/run"]