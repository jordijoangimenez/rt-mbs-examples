variable "FIVEG_MAG_MBS_VERSION" {
  default = "0.1.0"
}

variable "GITHUB_REGISTRY" {
  default = "ghcr.io/5g-mag"
}

variable "OPEN5GS_BRANCH" {
  default = "upv-mbs"
}

variable "SRSRAN_PROJECT_BRANCH" {
  default = "upv-mbs"
}

variable "SRSRAN_4G_BRANCH" {
  default = "upv-mbs"
}

variable "UBUNTU_VERSION" {
  default = "jammy"
}

group "default" {
  targets = [
    "base-mbs-open5gs", "mb-amf", "mb-smf", "mb-upf", "af",
    "base-mbs-srsran-project", "base-mbs-srsran-4g", "mb-gnb", "mb-ue"
  ]
}

target "base-mbs-open5gs" {
  context = "./images/base-mbs-open5gs"
  tags = ["base-mbs-open5gs:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "base-mbs-srsran-project" {
  context = "./images/base-mbs-srsran-project"
  tags = ["base-mbs-srsran-project:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "base-mbs-srsran-4g" {
  context = "./images/base-mbs-srsran-4g"
  tags = ["base-mbs-srsran-4g:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "mb-amf" {
  context = "./images/mb-amf"
  contexts = {
    "base-mbs-open5gs:${FIVEG_MAG_MBS_VERSION}" = "target:base-mbs-open5gs"
  }
  tags = ["${GITHUB_REGISTRY}/mb-amf:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "mb-smf" {
  context = "./images/mb-smf"
  contexts = {
    "base-mbs-open5gs:${FIVEG_MAG_MBS_VERSION}" = "target:base-mbs-open5gs"
  }
  tags = ["${GITHUB_REGISTRY}/mb-smf:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "mb-upf" {
  context = "./images/mb-upf"
  contexts = {
    "base-mbs-open5gs:${FIVEG_MAG_MBS_VERSION}" = "target:base-mbs-open5gs"
  }
  tags = ["${GITHUB_REGISTRY}/mb-upf:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "af" {
  context = "."
  dockerfile = "./images/af/Dockerfile"
  tags = ["${GITHUB_REGISTRY}/af:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "mb-gnb" {
  context = "./images/mb-gnb"
  contexts = {
    "base-mbs-srsran-project:${FIVEG_MAG_MBS_VERSION}" = "target:base-mbs-srsran-project"
  }
  tags = ["${GITHUB_REGISTRY}/mb-gnb:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "mb-ue" {
  context = "./images/mb-ue"
  contexts = {
    "base-mbs-srsran-4g:${FIVEG_MAG_MBS_VERSION}" = "target:base-mbs-srsran-4g"
  }
  tags = ["${GITHUB_REGISTRY}/mb-ue:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}