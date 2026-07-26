#!/bin/bash
# Host-specific override, not part of the upstream project: the stock entrypoint.sh always
# starts smcrouted, but open5gs-upfd's own upf.mbs.multicast_router.activate:true config
# tries to claim the same kernel multicast-routing socket (MRT_INIT) itself -- only one can
# hold it, so open5gs-upfd's own init fails with errno 98 (EADDRINUSE) whenever smcrouted
# already grabbed it first. This mirrors the stock entrypoint.sh exactly, minus `smcroute -d`,
# so open5gs's native multicast routing can initialize instead.
source /usr/local/bin/helper_functions.sh
setup_container_interfaces "${@}"
exec open5gs-upfd "${@}"
