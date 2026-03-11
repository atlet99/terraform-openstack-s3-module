# Complete Example

This example demonstrates how to create an OpenStack Object Storage account and multiple containers with specific configurations, such as versioning, metadata, and access controls. It also shows how to generate S3-compatible EC2 credentials.

## Usage

To run this example, execute the following commands:

```bash
terraform init
terraform plan
terraform apply
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | >= 3.2.0 |

## Providers

No providers.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID of the corresponding account | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where resources will be created | `string` | `"RegionOne"` | no |
| <a name="input_storage_policy"></a> [storage\_policy](#input\_storage\_policy) | The storage policy to be used for the container | `string` | `"gold"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_bytes_used"></a> [account\_bytes\_used](#output\_account\_bytes\_used) | n/a |
| <a name="output_account_container_count"></a> [account\_container\_count](#output\_account\_container\_count) | n/a |
| <a name="output_account_object_count"></a> [account\_object\_count](#output\_account\_object\_count) | n/a |
| <a name="output_account_project_id"></a> [account\_project\_id](#output\_account\_project\_id) | n/a |
| <a name="output_account_quota_bytes"></a> [account\_quota\_bytes](#output\_account\_quota\_bytes) | n/a |
| <a name="output_account_region"></a> [account\_region](#output\_account\_region) | n/a |
| <a name="output_containers"></a> [containers](#output\_containers) | n/a |
<!-- END_TF_DOCS -->
