# output "instance_public_ip" {
#   value = aws_instance.my_ec2_sameer.public_ip

# }


#condional Expressions & locals
output "instance_public_ip" {
  value = local.name_tag

}
