variable "required_tags" {
  type        = map(any)
  description = "required tags associated with the project"
}

variable "HA_cluster_public_subnets_list" {
  type    = list(string)
  default = []
}

variable "HA_cluster_master_nodes_vpc_id" {
  type = string
}

variable "HA_cluster_vpc_cidr" {
  type = string
}
