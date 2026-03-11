# Terraform OpenStack S3 Module

This module provides a convenient way to create and manage an OpenStack Object Storage (Swift) account and its associated containers.

## Example Usage

### Simple (Registry)

```hcl
module "s3-module" {
  source  = "atlet99/s3-module/openstack"
  version = "1.0.0"

  region           = "RegionOne"
  account_metadata = {
    Temp-Url-Key = "my-secret-key"
  }
}
```

### Simple (Development)

```hcl
module "s3" {
  source = "../../"

  region = "RegionOne"
  account_metadata = {
    Temp-Url-Key = "my-secret-key"
  }
}
```

### Complete
Create an account and multiple containers with specific configurations.

```hcl
module "s3_complete" {
  source  = "atlet99/s3-module/openstack"
  version = "1.0.0"

  region = "RegionOne"
  account_metadata = {
    Temp-Url-Key = "my-secret-key"
  }

  containers = {
    "public-assets" = {
      container_read = ".r:*"
      versioning     = true
    }
    "private-data" = {
      container_read = ".r:-*"
    }
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | ~> 3.2.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 3.2.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.8.1 |

## Resources

| Name | Type |
|------|------|
| [openstack_identity_ec2_credential_v3.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/identity_ec2_credential_v3) | resource |
| [openstack_objectstorage_account_v1.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/objectstorage_account_v1) | resource |
| [openstack_objectstorage_container_v1.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/objectstorage_container_v1) | resource |
| [random_id.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_metadata"></a> [account\_metadata](#input\_account\_metadata) | A map of custom key/value pairs to associate with the account metadata | `map(string)` | `{}` | no |
| <a name="input_containers"></a> [containers](#input\_containers) | A map of objects to configure containers | <pre>map(object({<br/>    name               = optional(string)          # Explicit container name<br/>    name_prefix        = optional(string)          # Prefix for random name generation<br/>    container_read     = optional(string)          # Read ACL list<br/>    container_sync_to  = optional(string)          # Sync destination<br/>    container_sync_key = optional(string)          # Sync key<br/>    container_write    = optional(string)          # Write ACL list<br/>    versioning         = optional(bool, false)     # Enable object versioning<br/>    metadata           = optional(map(string), {}) # Custom container metadata<br/>    content_type       = optional(string)          # MIME type for the container<br/>    storage_policy     = optional(string)          # Swift storage policy<br/>    storage_class      = optional(string)          # RGW/Ceph storage class (SSD, HDD, etc.)<br/>    force_destroy      = optional(bool, false)     # Delete objects before container destruction<br/>  }))</pre> | `{}` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create object storage account and containers | `bool` | `true` | no |
| <a name="input_create_ec2_credentials"></a> [create\_ec2\_credentials](#input\_create\_ec2\_credentials) | Whether to create EC2 credentials for the project (required for S3 API) | `bool` | `false` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID of the corresponding account. If omitted, the token's project ID is used. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where resources will be created. If omitted, the region of the provider is used. | `string` | `null` | no |
| <a name="input_s3_user_id"></a> [s3\_user\_id](#input\_s3\_user\_id) | The ID of the user for whom the EC2 credential will be created. If omitted, the current user ID is used. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_bytes_used"></a> [account\_bytes\_used](#output\_account\_bytes\_used) | The number of bytes used by the account |
| <a name="output_account_container_count"></a> [account\_container\_count](#output\_account\_container\_count) | The number of containers in the account |
| <a name="output_account_headers"></a> [account\_headers](#output\_account\_headers) | A map of headers returned for the account |
| <a name="output_account_object_count"></a> [account\_object\_count](#output\_account\_object\_count) | The number of objects in the account |
| <a name="output_account_project_id"></a> [account\_project\_id](#output\_account\_project\_id) | The project ID of the corresponding account |
| <a name="output_account_quota_bytes"></a> [account\_quota\_bytes](#output\_account\_quota\_bytes) | The number of bytes allowed for the account |
| <a name="output_account_region"></a> [account\_region](#output\_account\_region) | The region in which the account is located |
| <a name="output_containers"></a> [containers](#output\_containers) | A map of created containers |
| <a name="output_s3_access_key"></a> [s3\_access\_key](#output\_s3\_access\_key) | S3 Access Key (EC2 Credential) |
| <a name="output_s3_endpoint"></a> [s3\_endpoint](#output\_s3\_endpoint) | S3/Object-Store Public Endpoint URL |
| <a name="output_s3_secret_key"></a> [s3\_secret\_key](#output\_s3\_secret\_key) | S3 Secret Key (EC2 Credential) |
<!-- END_TF_DOCS -->
