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
locals {
  first_word = substr(var.phrase, 0, 9) # start at index 0, length 9
}
locals {
  first_word_part2 = substr(var.phrase2, 0, length(var.phrase2) - 1) # The length - 1 character
}
