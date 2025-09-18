variable "items" {  # create a variable named items
 type= list(string) # set the type as a list where each elements is a string
 default = ["b", "a", "c", "a", "b"] # contain the default content of the variable
}

locals {
unique_sorted = sort(distinct(var.items))
csv = join(",", local.unique_sorted)
}
output "unique_sorted" {
value = local.unique_sorted
}
output "csv" {
value = local.csv
}
