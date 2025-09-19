variable "hotelsv2"{
  type=list(string)
default=["Hilton", "Marriott", "Sheraton", "Hyatt"]
}

locals{
  new_substr = [for str in var.hotelsv2 : substr(str, 2, 8)]
}

output "I_always_forgot_that_i_need_to_do_a_loop" {
 value = local.new_substr 
}
