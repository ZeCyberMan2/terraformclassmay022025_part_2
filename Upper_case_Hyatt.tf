variable "hotels" {  # 
 type= list(string) # 
 default = ["Marriott", "Hilton", "Sheration", "Hyatt"] # 
}

locals {
upper_case_Hyatt = upper(var.hotels, 21, 26)
}

output "Hyatt" {
value = var.upper_case_Hyatt
}
