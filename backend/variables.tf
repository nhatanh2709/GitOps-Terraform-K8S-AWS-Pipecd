variable "region" {
  type = string
  default = "ap-southeast-2"
}

variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  default     = "s3-pipecd"
  type        = string
}

variable "principal_arns" {
  description = "A list of principal arns allowed to assume the IAM role"
  default     = null
  type        = list(string)
}