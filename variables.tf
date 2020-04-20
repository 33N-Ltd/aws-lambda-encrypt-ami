variable "environment" {}

variable "kms_key_arn" {
  description = "If Encrypt_ami set to true then you must pass in the arn of the key you wish to encrypt disk with."
  default = "Default"
  type = string
}

variable "common_tags" {
  type = map
}