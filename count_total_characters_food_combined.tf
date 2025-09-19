variable "foodsv3" {
  type=list(string) 
  default = ["Pizza", "Burger", "Sushi", "Tacos"]
}

locals{
  count = length(var.foodsv3)
}

output "counting"{
  value = local.count
}
