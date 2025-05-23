# syntax=docker/dockerfile:1

# global build-time arguments for FROM statements
ARG FIVEG_MAG_MBS_VERSION="0.1.1"
ARG UBUNTU_VERSION="jammy"

FROM base-mbs-srsran-project:${FIVEG_MAG_MBS_VERSION} AS builder

FROM ubuntu:${UBUNTU_VERSION}

# build-time arguments
ARG DEBIAN_FRONTEND="noninteractive"

# install dependencies
RUN apt-get update && apt-get install libfftw3-dev libmbedtls-dev libsctp-dev \
    libyaml-cpp-dev libzmq3-dev dnsutils -y

# copy executable, default config and libs
COPY --from=builder /rt-srsRAN_Project/build/apps/gnb/gnb /usr/local/bin/gnb
COPY --from=builder /rt-srsRAN_Project/configs/gnb_rf_b200_tdd_n78_20mhz.yml /etc/rt-srsRAN_Project/default/gnb_rf_b200_tdd_n78_20mhz.yml

# configure dynamically linked libraries
RUN ldconfig

# copy helper_functions and entrypoint scripts
COPY ./helper_functions.sh /usr/local/bin/helper_functions.sh
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

# output logs to stdout
RUN ln -sf /dev/stdout /tmp/gnb_with_mbs.log

ENTRYPOINT [ "entrypoint.sh" ]

# use CMD to provide arguments to ENTRYPOINT (can be overridden by user)
CMD [ "-c", "/etc/rt-srsRAN_Project/default/gnb_rf_b200_tdd_n78_20mhz.yml" ]
