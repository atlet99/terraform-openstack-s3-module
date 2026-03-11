data "openstack_identity_auth_scope_v3" "this" {
  count = var.create ? 1 : 0
  name  = "s3_module_scope"
}

output "account_region" {
  description = "The region in which the account is located"
  value       = try(openstack_objectstorage_account_v1.this[0].region, "")
}

output "account_project_id" {
  description = "The project ID of the corresponding account"
  value       = try(openstack_objectstorage_account_v1.this[0].project_id, "")
}

output "account_bytes_used" {
  description = "The number of bytes used by the account"
  value       = try(openstack_objectstorage_account_v1.this[0].bytes_used, 0)
}

output "account_quota_bytes" {
  description = "The number of bytes allowed for the account"
  value       = try(openstack_objectstorage_account_v1.this[0].quota_bytes, 0)
}

output "account_container_count" {
  description = "The number of containers in the account"
  value       = try(openstack_objectstorage_account_v1.this[0].container_count, 0)
}

output "account_object_count" {
  description = "The number of objects in the account"
  value       = try(openstack_objectstorage_account_v1.this[0].object_count, 0)
}

output "containers" {
  description = "A map of created containers"
  value       = openstack_objectstorage_container_v1.this
}

output "s3_access_key" {
  description = "S3 Access Key (EC2 Credential)"
  value       = try(openstack_identity_ec2_credential_v3.this[0].access, "")
  sensitive   = true
}

output "s3_secret_key" {
  description = "S3 Secret Key (EC2 Credential)"
  value       = try(openstack_identity_ec2_credential_v3.this[0].secret, "")
  sensitive   = true
}

output "s3_endpoint" {
  description = "S3/Object-Store Public Endpoint URL"
  value = try(
    [
      for endpoint in [
        for service in data.openstack_identity_auth_scope_v3.this[0].service_catalog :
        service if service.type == "object-store"
      ][0].endpoints :
      endpoint.url if endpoint.interface == "public" && (var.region == null || endpoint.region == var.region)
    ][0],
    ""
  )
}
