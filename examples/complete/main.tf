provider "openstack" {
  region = var.region
}

module "s3" {
  source = "../../"

  region     = var.region
  project_id = var.project_id

  # Включаем создание EC2-ключей для S3 API доступа
  create_ec2_credentials = true

  account_metadata = {
    Temp-Url-Key = "my-secret-key"
    Quota-Bytes  = "10737418240" # 10GB
  }

  containers = {
    "public-assets" = {
      container_read = ".r:*"
      versioning     = true
      content_type   = "application/json"
      metadata = {
        type = "public"
      }
    }
    "private-data" = {
      container_read  = ".r:-*"
      container_write = "${var.project_id}:*"
      force_destroy   = true
      metadata = {
        type = "private"
      }
    }
    "archive-data" = {
      storage_policy = var.storage_policy
    }
    # Динамическое имя с префиксом
    "backups" = {
      name_prefix = "db-backup-"
      metadata = {
        type = "backup"
      }
    }
  }
}
