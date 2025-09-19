variable "hotels" {  # 
 type= list(string) # 
 default = ["Marriott", "Hilton", "Sheration", "Hyatt"] # 
}

locals {
upper_case_Hyatt = upper(var.hotels[3])
}

output "Hyatt" {
value = local.upper_case_Hyatt
}
