variable "FIVEG_MAG_MBS_VERSION" {
  default = "0.1.1"
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
    "base-mbs-open5gs", "amf_with_mbs", "smf_mb-smf", "upf_mb-upf", "test_mbs_af_as",
    "base-mbs-srsran-project", "base-mbs-srsran-4g", "gnb_with_mbs", "ue_with_mbs"
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

target "amf_with_mbs" {
  context = "./images/amf_with_mbs"
  contexts = {
    "base-mbs-open5gs:${FIVEG_MAG_MBS_VERSION}" = "target:base-mbs-open5gs"
  }
  tags = ["${GITHUB_REGISTRY}/amf_with_mbs:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "smf_mb-smf" {
  context = "./images/smf_mb-smf"
  contexts = {
    "base-mbs-open5gs:${FIVEG_MAG_MBS_VERSION}" = "target:base-mbs-open5gs"
  }
  tags = ["${GITHUB_REGISTRY}/smf_mb-smf:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "upf_mb-upf" {
  context = "./images/upf_mb-upf"
  contexts = {
    "base-mbs-open5gs:${FIVEG_MAG_MBS_VERSION}" = "target:base-mbs-open5gs"
  }
  tags = ["${GITHUB_REGISTRY}/upf_mb-upf:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "test_mbs_af_as" {
  context = "."
  dockerfile = "./images/test_mbs_af_as/Dockerfile"
  tags = ["${GITHUB_REGISTRY}/test_mbs_af_as:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "gnb_with_mbs" {
  context = "./images/gnb_with_mbs"
  contexts = {
    "base-mbs-srsran-project:${FIVEG_MAG_MBS_VERSION}" = "target:base-mbs-srsran-project"
  }
  tags = ["${GITHUB_REGISTRY}/gnb_with_mbs:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}

target "ue_with_mbs" {
  context = "./images/ue_with_mbs"
  contexts = {
    "base-mbs-srsran-4g:${FIVEG_MAG_MBS_VERSION}" = "target:base-mbs-srsran-4g"
  }
  tags = ["${GITHUB_REGISTRY}/ue_with_mbs:${FIVEG_MAG_MBS_VERSION}"]
  output = ["type=image"]
}