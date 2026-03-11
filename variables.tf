variable "create" {
  description = "Whether to create object storage account and containers"
  type        = bool
  default     = true
}

variable "region" {
  description = "Region where resources will be created. If omitted, the region of the provider is used."
  type        = string
  default     = null
}

variable "project_id" {
  description = "The project ID of the corresponding account. If omitted, the token's project ID is used."
  type        = string
  default     = null
}

variable "account_metadata" {
  description = "A map of custom key/value pairs to associate with the account metadata"
  type        = map(string)
  default     = {}
}

variable "containers" {
  description = "A map of objects to configure containers"
  type = map(object({
    name               = optional(string)
    name_prefix        = optional(string)
    container_read     = optional(string)
    container_sync_to  = optional(string)
    container_sync_key = optional(string)
    container_write    = optional(string)
    versioning         = optional(bool, false)
    metadata           = optional(map(string), {})
    content_type       = optional(string)
    storage_policy     = optional(string)
    force_destroy      = optional(bool, false)
  }))
  default = {}
}

variable "create_ec2_credentials" {
  description = "Whether to create EC2 credentials for the project (required for S3 API)"
  type        = bool
  default     = false
}
