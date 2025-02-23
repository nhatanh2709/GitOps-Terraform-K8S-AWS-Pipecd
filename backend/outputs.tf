output "resourcegroups_group_arn" {
  description = "ARN của nhóm tài nguyên AWS Resource Groups"
  value       = aws_resourcegroups_group.resourcegroups_group.arn
}

output "resourcegroups_group_name" {
  description = "Tên của nhóm tài nguyên AWS Resource Groups"
  value       = aws_resourcegroups_group.resourcegroups_group.name
}