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

output "web_name" {
  value = module.web.name
}

output "web_private_ip" {
  value = module.web.private_ip
}

output "web_public_ip" {
  value = module.web.public_ip
}

output "web_zone" {
  value = module.web.zone
}