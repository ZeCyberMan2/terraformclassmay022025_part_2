variable "canada_items2" {
  description = "Last-word items for Canada (Linux web apps)"
  type        = list(string)
  default = [
    "mapleleaf", "hockey", "poutine", "mountie", "niagara",
    "timhortons", "beavertail", "loonie", "canoe", "igloo"
  ]
}

output "canada_items_Terraform_is_love"{
value = var.canada_items2
}
