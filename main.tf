terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.51.0"
    }
  }
}

locals {
  project_name = "Self-Managed-Cluster"
}

module "tags" {
  source               = "./modules/tagging"
  resource_environment = "Development"
  service              = "N/A"
  project_name         = local.project_name
}



# module "networking" {
#   source        = "./modules/networking"
#   project_name  = local.project_name
#   required_tags = module.tags.required_tags
# }

# module "compute" {
#   source                         = "./modules/compute"
#   HA_cluster_public_subnets_list = module.networking.HA_cluster_public_subnets_ids
#   required_tags                  = module.tags.required_tags
#   HA_cluster_master_nodes_vpc_id = module.networking.HA_cluster_master_nodes_vpc_id
#   HA_cluster_vpc_cidr            = module.networking.HA_cluster_vpc_cidr
# }
