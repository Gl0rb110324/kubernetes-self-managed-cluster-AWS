variable "required_tags" {
  type        = map(any)
  description = "required tags associated with the project"
}

variable "HA_cluster_public_subnets_list" {
  type    = list(string)
  default = []
}
