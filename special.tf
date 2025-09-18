variable "list_of_hello" {
 type= list(string)
 default = ["alice", "bob", "carol"]
}
locals {
new_list = [for name in var.list_of_hello : "hello ${name}"]
}
output "group_of_hello" { value = local.new_list }
