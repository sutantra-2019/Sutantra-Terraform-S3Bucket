variable "aws_region" {
  description = "Region To Use For the resources"
  default     = "us-west-2"
}

variable "aws_profile" {
  default = "default"
}

variable "base_name" {
  description = "string used to base various names on"
  default     = "pact-terraform"
}

variable "s3_object_versioning" {
  type        = bool
  default     = true
  description = "Versioning for the S3 objects is enabled or not"
}

variable "force_destroy" {
  type        = bool
  default     = true
  description = "Force the user while destroying the objects"
}

variable "enable_key_rotation" {
  type        = bool
  default     = true
  description = "Specifies whether key rotation is enabled"
}

variable "key_usage" {
  default     = "ENCRYPT_DECRYPT"
  description = "Key usage is whether for Encryption Decryption Or For Signing"
}

variable "customer_master_key_spec" {
  default     = "SYMMETRIC_DEFAULT"
  description = "Which type of the key is this Symmetric Or Assymetric"
}

variable "kms_enabled" {
  type        = bool
  default     = true
  description = "key is enabled"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    "organization" = "PACT Pharma"
    "project"      = "terraform-s3-encryption/simple"
    "client"       = "Internal"
    "user"         = "Terraform"
  }
}
