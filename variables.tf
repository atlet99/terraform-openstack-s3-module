# Global switch to enable or disable resource creation
variable "create" {
  description = "Whether to create object storage account and containers"
  type        = bool
  default     = true
}

# Target region for deployment
variable "region" {
  description = "Region where resources will be created. If omitted, the region of the provider is used."
  type        = string
  default     = null
}

# Project ID for auth scoping. Admin permission may be required to set another project.
variable "project_id" {
  description = "The project ID of the corresponding account. If omitted, the token's project ID is used."
  type        = string
  default     = null
}

# Custom metadata for the Object Storage account (e.g. Temp-URL-Key)
variable "account_metadata" {
  description = "A map of custom key/value pairs to associate with the account metadata"
  type        = map(string)
  default     = {}
}

# Configuration map for containers (buckets)
variable "containers" {
  description = "A map of objects to configure containers"
  type = map(object({
    name               = optional(string)          # Explicit container name
    name_prefix        = optional(string)          # Prefix for random name generation
    container_read     = optional(string)          # Read ACL list
    container_sync_to  = optional(string)          # Sync destination
    container_sync_key = optional(string)          # Sync key
    container_write    = optional(string)          # Write ACL list
    versioning         = optional(bool, false)     # Enable object versioning
    metadata           = optional(map(string), {}) # Custom container metadata
    content_type       = optional(string)          # MIME type for the container
    storage_policy     = optional(string)          # Swift storage policy
    storage_class      = optional(string)          # RGW/Ceph storage class (SSD, HDD, etc.)
    force_destroy      = optional(bool, false)     # Delete objects before container destruction
  }))
  default = {}
}

# Flag to create S3-compatible EC2 credentials
variable "create_ec2_credentials" {
  description = "Whether to create EC2 credentials for the project (required for S3 API)"
  type        = bool
  default     = false
}

# Optional user ID for EC2 credentials
variable "s3_user_id" {
  description = "The ID of the user for whom the EC2 credential will be created. If omitted, the current user ID is used."
  type        = string
  default     = null
}
