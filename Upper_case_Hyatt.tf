variable "hotels" {  # 
 type= list(string) # 
 default = ["Marriott", "Hilton", "Sheration", "Hyatt"] # 
}

locals {
upper_case_Hyatt = [for hotel in var.hotels : hotel == "Hyatt" ? upper(hotel) : hotel]

}

output "Hyatt" {
value = local.upper_case_Hyatt
}
