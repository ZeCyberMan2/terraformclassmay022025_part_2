output "firstname"{
value = var.firstname
}
output "lastname"{
value = var.lastname
}
output "year"{
value = var.year
}
output "restaurant1"{
value = var.restaurant1
}
output "restaurant2"{
value = var.restaurant2
}
output "restaurant3"{
value = var.restaurant3
}
output "restaurant4"{
value = var.restaurant4
}
output "restaurant5"{
value = var.restaurant5
}
output "millenium"{
value = var.millenium
}
output "truefalse"{
value = var.truefalse
}
output "listoffruits"{
value = var.listoffruits
}
output "listofmovies"{
value = var.listofmovies
}
output "listoftravel"{
value = var.listoftravel
}
output "listofworkout"{
value = var.listofworkout
}
output "listoffoods"{
value = var.listoffoods
}
output "listofcolors"{
value = var.listofcolors
}
output "listofsongs"{
value = var.listofsongs
}
output "listofemojis"{
value = var.listofemojis
}
output "listofaffirmations"{
value = var.listofaffirmations
}
output "listoficecream"{
value = var.listoficecream
}
output "application_name"{
value = local.full_name
}
output "csv_items"{
value = join(",", var.items)
}
output "server_name_parts"{
value = split("-", var.server_name)
}
output "top5activities"{
value = join(",", var.top5activities)
}
output "top5movies"{
value = split(",", var.top5movies)
}
output "display_lower"{
value = local.movie_lower
}
output "display_upper"{
value = local.movie_upper
}
output "replaced_string"{
value = local.replaced
}
output "first_word"{
value = local.first_word # "Inception"
}
output "first_word_part2"{
value = local.first_word_part2 # "Inception"
}
output "MCIT_Students"{
value = local.mcitstudents 
}
output "labels_upper"{
value = local.labels_upper
}

