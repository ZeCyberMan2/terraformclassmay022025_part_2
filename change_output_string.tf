variable "activities" {
  type = list(string)
  default = ["eat", "sleep", "code", "repeat"]
}

locals{
  arrow = join("→", var.activities)
}

output"code_is_life"{
  value = local.arrow
}
