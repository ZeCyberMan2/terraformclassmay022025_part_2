variable "subscription_id"{
  type=string
}
variable "client_id"{
  type=string
}
variable "client_secret"{
  type=string
}
variable "tenant_id"{
  type=string
}
variable "firstname"{
  type=string
  default="Marvin"
}
variable "lastname"{
  type=string
  default="Girard"
}
variable "year"{
  type=number
  default=1791
}
variable "restaurant1"{
  type=string
  default="Cora"
}
variable "restaurant2"{
  type=string
  default="KFC"
}
variable "restaurant3"{
  type=string
  default="Five Guys"
}
variable "myapp"{
  type=string
  default="myapp"
}
variable "server_name"{
  type=string
  default="app-prod-01"
}
variable "items"{
  type=list(string)
  default=["One", "Two", "Three"]
}
variable "restaurant4"{
  type=string
  default="Mcdonalds"
}
variable "restaurant5"{
  type=string
  default="Burger King"
}
variable "millenium"{
  type=number
  default=2000
}
variable "truefalse"{
  type=bool
  default=true
}
variable "listoffruits"{
  type=list(string)
  default=["Green apple, Orange, Strawberry, Grape, Kiwi"]
}
variable "listofmovies"{
  type=list(string)
  default=["Astro Boy, The Lorax, Lion King, Dragon Ball Super Broly, Demon slayer The Movie: Mugen Train"]
}
variable "listoftravel"{
  type=list(string)
  default=["Cancun, Paris, Maldives, Tokyo, Hong Kong"]
}
variable "listofworkout"{
  type=list(string)
  default=["Legs Day, Biceps Day, Chest Day, Traps Day, Lower Back Day"]
}
variable "listoffoods"{
  type=list(string)
  default=["Mac&Cheese, Spaghetti, Hamburger, White Rice, Fried Chicken"]
}
variable "listofcolors"{
  type=list(string)
  default=["Yellow, Royal Blue, Magenta, Green Gorest, Red"]
}
variable "listofsongs"{
  type=list(string)
  default=["Love of my life by Queen, temperature by Sean Paul, Die With a Smile by Lady Gaga and Bruno Mars, snowman by sia, Judas Lady Gaga"]
}
variable "listofemojis"{
  type=list(string)
  default=["🙂,😔,😶‍🌫️,🫡,😭"]
}
variable "listofaffirmations"{
  type=list(string)
  default=["Incredible, Amazing, Greatest Of All Time (GOAT), Aura Farming, Radiant "]
}
variable "listoficecream"{
  type=list(string)
  default=["Chocolate Mint, Rum&Raisin, Vanilla, Chocolate, Banana"]
}
