locals {
  full_name = "${var.myapp}-prod"
}
locals {
movie_lower = lower(var.movie) # "inception"
movie_upper = upper(var.movie) # "INCEPTION"
}
locals {
  replaced = replace(var.original, "MCIT", "Montreal College")
}
