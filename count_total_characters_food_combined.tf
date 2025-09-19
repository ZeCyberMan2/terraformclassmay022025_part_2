variable "foods" {
  type=list(string) 
  default = ["Pizza", "Burger", "Sushi", "Tacos"]
}

locals{
  count = length(var.foods)
}

output "counting"{
  value = local.count
}
