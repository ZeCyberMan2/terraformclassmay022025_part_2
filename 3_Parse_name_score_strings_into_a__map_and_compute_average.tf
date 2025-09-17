variable "raw_scores" {  # create a variable named raw_scores
 type    = list(string) # set the type as a list where each elements is a string
 default = ["alice:90", "bob:75", "carol:85"] # contain the default content of the variable
}

locals {
 score_pairs = [ # creating a name for the expression
   for s in var.raw_scores : { # for check each expression in the variable
     name  = split(":", s)[0] # separate the expressions by ":" 
     score = tonumber(split(":", s)[1]) # convert the value to a number
   }
 ]
 scores_map = { for p in local.score_pairs : p.name => p.score }
  average = length(local.score_pairs) == 0 ? 0 :
   sum([for p in local.score_pairs : p.score]) / length(local.score_pairs)
}


output "scores_map" { value = local.scores_map }
output "avg_score"  { value = local.average    }

4) Deduplicate, sort, and join
variable "items" {
 type    = list(string)
 default = ["b", "a", "c", "a", "b"]
}

locals {
 unique_sorted = sort(distinct(var.items))
 csv           = join(",", local.unique_sorted)
}

output "unique_sorted" { value = local.unique_sorted }
output "csv"           { value = local.csv }
