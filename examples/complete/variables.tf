variable "region" {
  description = "Region where resources will be created"
  type        = string
  default     = "RegionOne"
}

variable "project_id" {
  description = "The project ID of the corresponding account"
  type        = string
}

variable "storage_policy" {
  description = "The storage policy to be used for the container"
  type        = string
  default     = "gold"
}
