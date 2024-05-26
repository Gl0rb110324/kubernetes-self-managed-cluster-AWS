locals {
  cluster_vpc_cidr     = "168.1.0.0/16"
  cluster_subnets_list = cidrsubnets(local.cluster_vpc_cidr, 8, 8, 8, 8, 8, 8) #3 public. 3 private
  subnet_regions       = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  subnet_name_notation = ["A", "B", "C"]
}


