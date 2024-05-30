resource "aws_launch_template" "master_node_launch_template" {
  name_prefix            = "Kubernetes-Cluster-Master-Nodes"
  image_id               = "ami-035cecbff25e0d91e"
  instance_type          = "t2.micro"
  key_name               = "aubergine-key"
  vpc_security_group_ids = [aws_security_group.master_nodes_instances_sg.id, aws_security_group.vpc_endpoint_security_group.id]
}
