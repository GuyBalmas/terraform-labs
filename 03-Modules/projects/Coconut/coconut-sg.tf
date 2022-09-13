module "sg_coconut_module" {
  source = "../../modules/security-groups"
}

output sg_banana_id {
  value = module.sg_coconut_module.ec2_sg_id
}
