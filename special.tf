variable "list_of_hello" {
 type= list(string)
 default = ["alice", "bob", "carol"]
}
locals {
new_list = concat(var.list_of_hello, ["hello"])
}
output "group_of_hello" { value = var.list_of_hello }
