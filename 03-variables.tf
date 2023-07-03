## ---------------------------------------------------------------------------------------------------------------------
## Variables Definition                 - Project Allium
## Project Description                  - Creating a bucket with life cycle policy configuration
## Modification History:
##   - 1.0.0    Jul 03,2023 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------


######################################## Project Name ##############################################
variable "project_name" {
  description = "The name of the project"
  type        = string
}
######################################## Environment Name ##########################################
variable "environment_name" {
  type        = string
  description = <<EOT
  (Optional) The environment in which to deploy our resources to.

  Options:
  - devl : Development
  - test: Test
  - prod: Production

  Default: devl
  EOT
  default     = "devl"

  validation {
    condition     = can(regex("^devl$|^test$|^prod$", var.environment_name))
    error_message = "Err: environment is not valid."
  }
}
######################################## S3 Bucket #################################################
variable "s3_bucket_base_name" {
  description = "The base name of the S3 Bucket"
  type        = string
}
######################################## KMS Key ###################################################
variable "kms_key_alias" {
  description = "KMS Key Alias"
  type        = string
  default     = "SB-KMS"
}
######################################## S3 Storage Class Transition Configuration #################
variable "transition_days_standard_ia" {
  description = "Number of days after which the object will be transitioned to Standard Infrequest Access storage class"
  type        = number
}

variable "transition_days_intelligent_tiering" {
  description = "Number of days after which the object will be transitioned to Intelligent Tiering storage class"
  type        = number
}

variable "transition_days_glacier_ir" {
  description = "Number of days after which the object will be transitioned to Glacier Instant retrieval storage class"
  type        = number
}

variable "transition_days_glacier" {
  description = "Number of days after which the object will be transitioned to Glacier storage class"
  type        = number
}

variable "transition_days_deep_archive" {
  description = "Number of days after which the object will be transitioned to Deep Archive storage class"
  type        = number
}
