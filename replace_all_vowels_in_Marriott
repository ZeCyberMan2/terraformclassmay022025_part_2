variable "marriott" {
  type=string
  default = "Marriott"
}

locals{
  vowels = replace(
  replace(
    replace(
      replace(
        replace(var.marriott, "a", "*"),
      "e", "*"),
    "i", "*"),
  "o", "*"),
"u", "*")
}

output "vowels_are_crazy"{
  value = local.vowels
}
