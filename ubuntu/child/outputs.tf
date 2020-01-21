output "received" {
  value = "${var.memory}"
  description = "getting the value of memory from config.tf and outputting it as 'received'"
}

output "space" {
  value = "120GB"
  description = "space requirement for ami"
}

# local values can be interpolated using the 'local.' prefix
output "project_resource_type" {
  value = "${local.default_prefix}-EC2"
  description = "example"
}
