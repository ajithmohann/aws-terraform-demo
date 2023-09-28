# aws-terraform-demo
Repository demonstrates the use of AWS Terraform resources


## Project Structure
Project contains following main folders.
1. canopy-common - contains Terraform configuraion for provisioning all common resources such as VPC, Subnet,KMS etc
    - Workspace Name: "canopy-common-dev"
2. canopy-db-layer - contains Terraform configuraion for provisioning resources related to database.
    - Workspace Name: "canopy-db-dev"
3. canopy-app-layer - contains Terraform configuraion for provisioning resources related to application layer.
    - Workspace Name: "canopy-app-dev"
4. canopy-web-layer - contains Terraform configuraion for provisioning resources related to Web/Internet layer.
    - Workspace Name: "canopy-web-dev"

## Local deployment

### Run the following commands to setup AWS environment
- set AWS_ACCESS_KEY_ID=
- set AWS_SECRET_ACCESS_KEY=
### Run the following commands to provision resources
1. cd in to the respective folder. e.g. cd canopy-common
2. create/select the workspace: terraform workspace new/select <workspace_name>
3. Initialize Terraform, if not already: terraform init
4. Run Terraform Plan/Apply command: terraform plan/apply 


## 
- Terraform Token: C:\Users\ajith\AppData\Roaming\terraform.d
- AWS Credentials: C:\Users\ajith\.aws\credentials