## ---------------------------------------------------------------------------------------------------------------------
## Provider Definition                  - Project Allium
## Project Description                  - Creating a bucket with life cycle policy configuration
## Modification History:
##   - 1.0.0    Jul 03,2023 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------


# AWS Region and Caller Identity
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}