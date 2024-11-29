<h1 align="center">MBS Examples</h1>
<p align="center">
  <img src="https://img.shields.io/badge/Status-Under_Development-yellow" alt="Under Development">
  <img src="https://img.shields.io/badge/License-5G--MAG%20Public%20License%20(v1.0)-blue" alt="License">
</p>

## Introduction

3GPP Release 17 brings Multicast–Broadcast Services (MBS) to the 5G System, based on 5G Core and New Radio. MBS allows the network to select the most suitable among point-to-multipoint (PTM) or point-to-point (PTP) delivery based on requirements set by either service providers or network operators and/or taking into account concurrent user demand.

Additional information can be found at: https://5g-mag.github.io/Getting-Started/pages/5g-multicast-broadcast-services/

### About the implementation
This repository contains Docker Compose components to deploy several network functions related to MBS.
The detailed usage instructions are available at the [Getting Started guides](https://5g-mag.github.io/Getting-Started/pages/5g-multicast-broadcast-services/usage/docker-implementation.html).
Some of the components are unmodified Open5GS Network Functions, those are marked with the regular Network Function's name and follow Open5GS' versioning, the latest version available is the `v2.7.2`.

| Network Function | image name          | version |
| ---              | ---                 | ---     |
| AUSF             | ghcr.io/5g-mag/ausf | v2.7.2  |
| BSF              | ghcr.io/5g-mag/bsf  | v2.7.2  |
| NRF              | ghcr.io/5g-mag/nrf  | v2.7.2  |
| NSSF             | ghcr.io/5g-mag/nssf | v2.7.2  |
| PCF              | ghcr.io/5g-mag/pcf  | v2.7.2  |
| UDM              | ghcr.io/5g-mag/udm  | v2.7.2  |
| UDR              | ghcr.io/5g-mag/udr  | v2.7.2  |

The following components are being developed for MBS and the latest version available is the `0.1.1`.

| Network Function               | image name                     | version |
| ---                            | ---                            | ---     |
| AMF (with Rel-17 MBS features) | ghcr.io/5g-mag/amf_with_mbs    | 0.1.1   |
| SMF + MB-SMF                   | ghcr.io/5g-mag/smf_mb-smf      | 0.1.1   |
| UPF + MB-UPF                   | ghcr.io/5g-mag/upf_mb-upf      | 0.1.1   |
| Test MBS AF/AS                 | ghcr.io/5g-mag/test_mbs_af_as  | 0.1.1   |
| gNB (with Rel-17 MBS features) | ghcr.io/5g-mag/gnb_with_mbs    | 0.1.1   |
| UE (with Rel-17 MBS features)  | ghcr.io/5g-mag/ue_with_mbs     | 0.1.1   |

Those components are being developed using [Open5GS](https://github.com/5G-MAG/open5gs) for the Network Functions AMF, MB-SMF and MB-UPF, [rt-srsRAN_Project](https://github.com/5G-MAG/rt-srsRAN_Project) for the gNB and [srsRAN_4G](https://github.com/5G-MAG/srsRAN_4G) for the UE, using the `upv-mbs` branch.

## Install dependencies
```
sudo apt install docker docker-buildx docker-compose-v2
```

## Downloading

The MBS Docker images are hosted on the 5G-MAG's GitHub Container Registry and can be pulled with Docker (`docker pull ghcr.io/NAMESPACE/IMAGE_NAME`). Please check the version.

```
docker pull ghcr.io/5g-mag/amf_with_mbs:0.1.1
docker pull ghcr.io/5g-mag/smf_mb-smf:0.1.1
docker pull ghcr.io/5g-mag/upf_mb-upf:0.1.1
docker pull ghcr.io/5g-mag/test_mbs_af_as:0.1.1
docker pull ghcr.io/5g-mag/gnb_with_mbs:0.1.1
docker pull ghcr.io/5g-mag/ue_with_mbs:0.1.1

```

The docker images can also be obtained by cloning the repository.

```
cd ~
git clone --recurse-submodules https://github.com/5G-MAG/rt-mbs.examples.git
```

## Building

You can skip this step if you have downloaded the images. If not, you can also build them locally.

> Note: This method uses the `docker-bake.hcl` file and requires `docker-buildx-plugin`

From the top level directory of the repository run:
```bash
cd rt-mbs-examples
docker buildx bake
```

## Running

First modify the `.env` file. Change the `DOCKER_HOST_IP=<your_host_ip_address>` with your machine's IP address, like this `DOCKER_HOST_IP=192.168.1.2`. This lets the UPF + MB-UPF use your machine's Internet connection to route the traffic using NAT.

To run the Docker images, select the deployment and from the top level directory of the repository run:
```bash
# to use the internal deployment
docker compose -f compose-files/internal/docker-compose.yaml --env-file=.env up -d
```

```bash
# to tear down the internal deployment
docker compose -f compose-files/internal/docker-compose.yaml --env-file=.env down
```
