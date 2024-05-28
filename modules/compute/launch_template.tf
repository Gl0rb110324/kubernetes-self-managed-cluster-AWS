resource "aws_launch_template" "bastion_host_launch_template" {
  name_prefix   = "basion-host-Kubernetes-Cluster"
  image_id      = "ami-035cecbff25e0d91e"
  instance_type = "t2.micro"
  key_name      = "aubergine-key"
}
