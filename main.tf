resource "random_id" "this" {
  for_each = { for k, v in var.containers : k => v if var.create && lookup(v, "name_prefix", null) != null }

  byte_length = 4
  prefix      = each.value.name_prefix
}

resource "openstack_objectstorage_account_v1" "this" {
  count      = var.create ? 1 : 0
  region     = var.region
  project_id = var.project_id
  metadata   = var.account_metadata
}

resource "openstack_objectstorage_container_v1" "this" {
  for_each = var.create ? var.containers : {}

  name = (
    lookup(each.value, "name_prefix", null) != null ?
    random_id.this[each.key].hex :
    lookup(each.value, "name", each.key)
  )

  region             = var.region
  container_read     = lookup(each.value, "container_read", null)
  container_sync_to  = lookup(each.value, "container_sync_to", null)
  container_sync_key = lookup(each.value, "container_sync_key", null)
  container_write    = lookup(each.value, "container_write", null)
  versioning         = lookup(each.value, "versioning", false)
  metadata           = lookup(each.value, "metadata", {})
  content_type       = lookup(each.value, "content_type", null)
  force_destroy      = lookup(each.value, "force_destroy", false)

  depends_on = [openstack_objectstorage_account_v1.this]
}

resource "openstack_identity_ec2_credential_v3" "this" {
  count      = var.create && var.create_ec2_credentials ? 1 : 0
  project_id = var.project_id
}
