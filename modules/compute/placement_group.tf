#Placement groups are optional. If you don't launch your instances into a placement group, EC2 tries to place the instances in such a way that all of your instances are spread out across the underlying hardware to minimize correlated failures.

resource "aws_placement_group" "bastion_host_placement" {
  name     = "HA_cluster"
  strategy = "spread"
}
