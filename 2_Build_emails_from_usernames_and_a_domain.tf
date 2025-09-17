variable "usernames" { # create a variable named usernames
 type=list(string) # set the type of the variable as a list where each elements in it is a string
 default= ["alice", "bob", "carol"]  # Contain the default content of the variable
}

variable "domain" {  # create a variable named domain
 type=string # set the type of the variable as a string
 default= "example.com" # Contain the default content of the variable
}


locals {
emails = {for u in var.usernames : u => "${u}@${var.domain}"} # Assign the name emails to an expression where it will actually check the list to create an address email with the domain name
}

output "emails" { # output the word "emails" in Terraform
value=local.emails # take value of the variable emails to output it in Terraform
}
