module "ec2_banana_module" {
  source = "../../modules/ec2"
  instance_type = "t3.medium"
  module_tag = "ec2-banana"
  sec_groups = [module.sg_banana_module.ec2_sg_id]
  # vpc_security_group_ids = [module.sg_banana_module.ec2_sg_id]
}


# data "aws_ami" "app_ami" {
#   most_recent = true
#   owners = ["amazon"]
#
#   filter {
#     name = "name"
#     values = ["amzn2-ami-hvm*"]
#   }
# }
#
# resource "aws_instance" "web" {
#   ami = data.aws_ami.app_ami.id
#   instance_type = "t3.micro"
#   # module_tag = "ec2-banana"
#   vpc_security_group_ids = [module.sg_banana_module.ec2_sg_id]
# }
