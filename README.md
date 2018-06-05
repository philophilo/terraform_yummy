# terraform_yummy

### Requirements
* `awscli`
* `terraform`

#### install awscli
* `pip install awscli`

#### install terraform
* `sudo apt-get install unzip`
* `wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip`
* `unzip terraform_0.11.1_linux_amd64.zip`
* `sudo mv terraform /usr/local/bin/`
* `terraform --version`

#### Running the application
* Provide AWS credentials `aws configure`
* Initialize terraform `terraform init`
* Execute terraform plan `terraform plan`
* Apply terraform plan `terraform apply`

#### [More detailed explanation](https://medium.com/@phil.kwesiga/aws-custom-network-with-terraform-18440974a791)
