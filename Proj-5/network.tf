module "vpcmodule" {
    source = "./modules/vpcmodule"
    vpc_cidr_range = "192.168.0.0/16"
    subnet_cidr_range = "cidrsubnet(var.vpc_cidr_range,8,3)"
    subnet_az = [ "us-east-1a","us-east-1b","us-east-1c" ]
    subnet_tag = ["web","app","db"]
  
}

output "vpc_ip" {
    value = module.vpcmodule.my-vpc-id
  
}

output "subntes_created" {
    value = module.vpcmodule.subnet_ids
  
}