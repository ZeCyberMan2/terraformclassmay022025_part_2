variable "foodsv4" {
type=list(string) 
default = ["Pizza", "Burger", "Sushi", "Tacos", "Pasta"]
}

locals{
sorted_by_length = sort([
  for word in var.foodsv4 : {
    length = length(word)
    word = word
  }
])
longest = local.storted_by_length[length(local.sorted_by_length) -1].word
}

output "Is_this_the_real_life_or_is_this_just_fantasy"{
  value = local.longest
}
