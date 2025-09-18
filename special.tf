variable "list_of_hello" {
 type= list(string)
 default = ["alice", "bob", "carol"]
}
locals {
new_list = concat(local.list_of_hello, ["hello"])
}
output "group_of_hello" { value = local.list_of_hello }
