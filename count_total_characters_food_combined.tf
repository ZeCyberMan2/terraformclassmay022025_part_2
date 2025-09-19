variable "foodsv3" {
  type=list(string) 
  default = ["Pizza", "Burger", "Sushi", "Tacos"]
}

locals{
  count = join("", var.foodsv3) 
  total_characters = length(local.count)
}

output "counting"{
  value = local.total_characters
}
