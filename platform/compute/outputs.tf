output "bastion_name" {
  value = module.bastion.name
}

output "bastion_private_ip" {
  value = module.bastion.private_ip
}

output "bastion_public_ip" {
  value = module.bastion.public_ip
}

output "bastion_zone" {
  value = module.bastion.zone
}

output "mgmt_name" {
  value = module.mgmt.name
}

output "mgmt_private_ip" {
  value = module.mgmt.private_ip
}

output "mgmt_public_ip" {
  value = module.mgmt.public_ip
}

output "mgmt_zone" {
  value = module.mgmt.zone
}