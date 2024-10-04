<h1 align="center">MBS Examples</h1>
<p align="center">
  <img src="https://img.shields.io/badge/Status-Under_Development-yellow" alt="Under Development">
  <img src="https://img.shields.io/badge/License-5G--MAG%20Public%20License%20(v1.0)-blue" alt="License">
</p>

## Introduction

This repository contains Docker Compose components to deploy several network functions related to MBS.

Some of the components are unmodified Open5GS Network Functions, those are marked with the regular Network Function's name and follow Open5GS' versioning, the latest version available is the `v2.7.1`.

| Network Function | image name          | version |
| ---              | ---                 | ---     |
| AUSF             | ghcr.io/5g-mag/ausf | v2.7.1  |
| BSF              | ghcr.io/5g-mag/bsf  | v2.7.1  |
| NRF              | ghcr.io/5g-mag/nrf  | v2.7.1  |
| NSSF             | ghcr.io/5g-mag/nssf | v2.7.1  |
| PCF              | ghcr.io/5g-mag/pcf  | v2.7.1  |
| UDM              | ghcr.io/5g-mag/udm  | v2.7.1  |
| UDR              | ghcr.io/5g-mag/udr  | v2.7.1  |

Most of the components being developed for MBS, are named starting with `mb-` and the latest version available is the `0.1.0`.

| Network Function | image name             | version |
| ---              | ---                    | ---     |
| AMF              | ghcr.io/5g-mag/mb-amf  | 0.1.0   |
| MB-SMF           | ghcr.io/5g-mag/mb-smf  | 0.1.0   |
| MB-UPF           | ghcr.io/5g-mag/mb-upf  | 0.1.0   |
| AF               | ghcr.io/5g-mag/af      | 0.1.0   |
| gNB              | ghcr.io/5g-mag/mb-gnb  | 0.1.0   |
| UE               | ghcr.io/5g-mag/mb-ue   | 0.1.0   |

Those components are being developed in the [Open5GS](https://github.com/5G-MAG/open5gs) for the Network Functions AMF, MB-SMF and MB-UPF, [rt-srsRAN_Project](https://github.com/5G-MAG/rt-srsRAN_Project) for the gNB and [srsRAN_4G](https://github.com/5G-MAG/srsRAN_4G) for the UE, using the `upv-mbs` branch.

## Building

> Note: This method uses the `docker-bake.hcl` file and requires `docker-buildx-plugin`

From the top level directory of the repository run:
```bash
docker buildx bake
```

## Running

The MBS Docker images are hosted on the 5G-MAG's GitHub Container Registry. You can also build them locally using the steps on the `Build it` section.

To use it, select the deployment and from the top level directory of the repository run:
```bash
# to use the internal deployment
docker compose -f compose-files/internal/docker-compose.yaml --env-file=.env up -d
```

```bash
# to tear down the internal deployment
docker compose -f compose-files/internal/docker-compose.yaml --env-file=.env down
```
