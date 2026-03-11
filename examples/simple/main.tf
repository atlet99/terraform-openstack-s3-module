provider "openstack" {
  region = var.region
}

module "s3" {
  source = "../../"

  region = var.region
  account_metadata = {
    Temp-Url-Key = "my-secret-key"
  }
}
