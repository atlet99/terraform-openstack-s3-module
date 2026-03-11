# Simple Example

This example demonstrates how to create a basic OpenStack Object Storage account without any specific containers defined, just an account with metadata (like `Temp-Url-Key`).

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
| <a name="input_region"></a> [region](#input\_region) | Region where resources will be created | `string` | `"RegionOne"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_bytes_used"></a> [account\_bytes\_used](#output\_account\_bytes\_used) | n/a |
| <a name="output_account_container_count"></a> [account\_container\_count](#output\_account\_container\_count) | n/a |
| <a name="output_account_object_count"></a> [account\_object\_count](#output\_account\_object\_count) | n/a |
| <a name="output_account_project_id"></a> [account\_project\_id](#output\_account\_project\_id) | n/a |
| <a name="output_account_quota_bytes"></a> [account\_quota\_bytes](#output\_account\_quota\_bytes) | n/a |
| <a name="output_account_region"></a> [account\_region](#output\_account\_region) | n/a |
<!-- END_TF_DOCS -->