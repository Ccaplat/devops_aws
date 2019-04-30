#### Creation a s3 bucker to store our kubernetes state files

resource "aws_s3_bucket" "opscloudbucket" {
  bucket = "opstestbucket1112222"
    acl = "private"
#### You can add versioning and or lifecycle rule to this bucket  by uncommenting
#    versioning {
#      enabled = true
#    }

#### Rule that allows lifecycle
#  lifecycle_rule {
#   enabled = true
#### moving data from s3 to standard IA storage
#    transition {
#      days = 30 # minimum of 30 days
#      storage_class = "STANDARD_IA"

#### Moving from standard to glacier after 60 days
#    }
#    transition {
#      days = 60
#      storage_class = "GLACIER"
#    }
#  }
#  }

}
