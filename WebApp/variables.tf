variable "ServiceName" {
  description = "Service Name"
  type = string
  default = "Demo-GithubActions"
}

variable "RgName" {
  description = "Resource Group Name"
  type = string
  default = "Labs"
}

variable "location" {
  description = "The Azure location where all resources should be created"
  type = string
  default = "brazilsouth"
}