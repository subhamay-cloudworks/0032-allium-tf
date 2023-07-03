## ---------------------------------------------------------------------------------------------------------------------
## Resources Definition                 - Project Allium
## Project Description                  - Creating a bucket with life cycle policy configuration
## Modification History:
##   - 1.0.0    Jul 03,2023 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------


########################################  Local Variables ####################################
locals {
  tags = tomap({
    Environment = var.environment_name
    ProjectName = var.project_name
  })
}


locals {
  s3_bucket_base_name = "${var.project_name}-${var.s3_bucket_base_name}-${var.environment_name}-${data.aws_region.current.name}"
}
########################################  Creating aa S3 Bucket ####################################
resource "aws_s3_bucket" "allium_s3_bucket" {
  bucket        = local.s3_bucket_base_name
  force_destroy = true

  tags = local.tags
}
######################################## SSE Encryption ############################################
resource "aws_s3_bucket_server_side_encryption_configuration" "allium_s3_bucket_sse" {
  bucket = aws_s3_bucket.allium_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_alias
      sse_algorithm     = "aws:kms"
    }
  }
}
######################################## S3 Lifecycle Policy To Delete Incomplete Upload ###########
resource "aws_s3_bucket_lifecycle_configuration" "allium_s3_bucket_lifecycle_config" {
  bucket = aws_s3_bucket.allium_s3_bucket.id

  rule {
    id     = "Allium S3 Bucket LifeCycle Configuration"
    status = "Enabled"

    transition {
      days          = var.transition_days_standard_ia
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.transition_days_intelligent_tiering
      storage_class = "INTELLIGENT_TIERING"
    }

    transition {
      days          = var.transition_days_glacier_ir
      storage_class = "GLACIER_IR"
    }

    transition {
      days          = var.transition_days_glacier
      storage_class = "GLACIER"
    }

    transition {
      days          = var.transition_days_deep_archive
      storage_class = "DEEP_ARCHIVE"
    }
  }

}