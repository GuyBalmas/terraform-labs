module "ec2_coconut_module" {
  source = "../../modules/ec2"
  module_tag = "ec2-coconut"
  sec_groups = [module.sg_coconut_module.ec2_sg_id]
  instance_type = lookup(var.instance_type, terraform.workspace)
}
