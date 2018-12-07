FROM ubuntu:18.04 as build

ARG QUARTUS_LD_URL=http://fpgadownload.intel.com/outgoing/download/daemons/lic_daemon_lnx64.tar

# Get required dependencies
RUN apt-get update && apt-get install -y wget \
    lsb-core \
# Get Quartus LD and extract it
    && wget ${QUARTUS_LD_URL} -O quartusld.tar \
    && mkdir quartusld \
    && tar -C quartusld -xf quartusld.tar \
    && rm quartusld.tar \
# Install the license server
    && cd quartusld \
# Quartus LD wants a temp dir
    && mkdir -p /usr/tmp \
# Generate a license file
    && touch /license.dat

ENV LM_LICENSE_FILE=/license.dat
ENV PATH="/quartusld:${PATH}"

ENTRYPOINT ["lmgrd", "-z, --"]