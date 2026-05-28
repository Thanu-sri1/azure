# Terraform VMSS Example

1. Copy the repo to your desiered root folder
2. Change `/variables.tf` and `/terraform.tfvars` according to your preference
3. Change the SKU in `/modules/vmss/main.tf` - `default is sku = "Standard_DC1s_v3"`
4. Change the **notification mail, username, password** in `/variables.tf`
5. Run these commands

```sh
terraform fmt -recursive #Optional

terraform init
terraform validate
terraform plan
terraform apply -auto-approve

terraform output public_ip

```

to destroy

```sh
terraform destroy -auto-approve
```

- > go to `http://<public_ip>` in your browser, you should see the organic ghee website.

if its not coming after giving time, ssh to the instance and check `pm2 status` and `sudo cloud-init status`

- > go to azure portal and check the VMSS instance, you should see 2 instances running

For demonstrating **Auto scaling**, we will send load to the VMSS (from different instance)

```sh
sudo apt install apache2-utils

ab -n 500000 -c 1000 http://<public_ip>/
```

- > go to azure portal and check the VMSS instance

- you should see the percentage of cpu usage increaing
- you should see number of instances increasing

`You will get a notification mail to "alert_email" in /variables.tf # default is sinanlw95@gmail.com`
