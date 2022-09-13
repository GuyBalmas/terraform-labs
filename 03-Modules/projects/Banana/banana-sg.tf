module "sg_banana_module" {
  source = "../../modules/security-groups"
}

output sg_banana_id {
  value = module.sg_banana_module.ec2_sg_id
}
