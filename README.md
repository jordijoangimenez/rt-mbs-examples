<h1 align="center">MBS Examples</h1>
<p align="center">
  <img src="https://img.shields.io/badge/Status-Under_Development-yellow" alt="Under Development">
  <img src="https://img.shields.io/badge/License-5G--MAG%20Public%20License%20(v1.0)-blue" alt="License">
</p>

## Introduction

Here you will find an easy way to try the current Multicast Broadcast Services (MBS) MVP being developed by the [iTEAM Mobile Communications Group](https://github.com/iTEAM-MCG) as part of the [5G-MAG](https://github.com/5G-MAG), following the 3GPP Release 17 specifications.

This repository uses Docker Compose to deploy a 5G-MBS capable 5G Core with a gNB and UE using Docker images.

## Usage

The MBS Docker images are hosted on the 5G-MAG's GitHub Container Registry. You can also build them locally.

<details>
<summary>Build it</summary>

> Note: This method uses the `docker-bake.hcl` file and requires `docker-buildx-plugin`

From the top level directory of the repository run:
```bash
docker buildx bake
```

</details>

To use it, select the deployment and from the top level directory of the repository run:
```bash
# to use the internal deployment
docker compose -f compose-files/internal/docker-compose.yaml --env-file=.env up -d
```

```bash
# to tear down the internal deployment
docker compose -f compose-files/internal/docker-compose.yaml --env-file=.env down
```
