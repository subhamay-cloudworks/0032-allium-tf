# Project Allium: S3 Lifecycle Policy Configuration



## Description

This project is a demonstration of creating a S3 bucket with lifecycle policy configuration using Terraform

![Project Allium - Lifecycle Policy](https://subhamay-projects-repository-us-east-1.s3.amazonaws.com/0032-allium/allium-s3-lifecycle-policy.png?)

## Getting Started


### Dependencies

* Create a Customer Managed KMS Key in the region where you want to create the stack..
* Modify the KMS Key Policy to let the IAM user encrypt / decrypt using any resource using the created KMS Key.

### Installing

* Clone the repository in a local hard drive.
* Modify the terraform.tfvars file with appropriate values.

* From the main project diretory submit the following commands:
```
terraform init

terraform validate 

terraform plan

terraform apply -auto-approve

# To delete the stack 
terraform destroy -auto-approve
```

### Executing program

* Upload a test file either using CLI or S3 console:

![Project Allium - Storage Class Day 1](https://subhamay-projects-repository-us-east-1.s3.amazonaws.com/0032-allium/storage-class-day-1.png?)

## Help

Post message in my blog (https://blog.subhamay.com)


## Authors

Contributors names and contact info

Subhamay Bhattacharyya  - [subhamay.aws@gmail.com](https://blog.subhamay.com)

## Version History

* 0.1
    * Initial Release

## License

This project is licensed under Subhamay Bhattacharyya. All Rights Reserved.

## Acknowledgments

Inspiration, code snippets, etc.
* [Stephane Maarek ](https://www.linkedin.com/in/stephanemaarek/)
* [Neal Davis](https://www.linkedin.com/in/nealkdavis/)
* [Adrian Cantrill](https://www.linkedin.com/in/adriancantrill/)
