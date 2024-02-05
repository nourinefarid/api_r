library(jsonlite)

# Faire venir les données avec fromJSON
data <- fromJSON("https://geo.api.gouv.fr/communes?codePostal=35200&fields=nom,code,codesPostaux,codeDepartement,codeRegion,population&format=json&geometry=centre")

# Construire une fonction qui appelle l'API
get_by_code <- function(query){
  url <- paste("https://geo.api.gouv.fr/communes?codePostal=",query, "&fields=nom,code,codesPostaux,codeDepartement,codeRegion,population&format=json&geometry=centre", sep = "")
  result <- fromJSON(url)
  return(result)
}
get_by_code("35200")

## Par étape
query <- "35200"
url <- paste("https://geo.api.gouv.fr/communes?codePostal=",query, "&fields=nom,code,codesPostaux,codeDepartement,codeRegion,population&format=json&geometry=centre", sep = "")

# Appel de l'url avec GET
response <- httr::GET(url)
response

# Récupération du contenu
response2 <- response$content
response2

# Transformation en contenu lisible
response3 <- rawToChar(response2)
response3

# Depuis JSON
response4 <- fromJSON(response3)
response4

#Continuer le Tp
#A partir de geoapi, esssayer de faire un code qui nous permet d'avoir la liste des nom et code de l'ensemble des regions.
#Créer le projet api_r sur votre compte git
#Envoyer le projet local sur votre compte git 
#M'inviter sur votre projet( mail: senemameastou@gmail.com)
#Envoyer un mail une fois que vous avez terminé.

library(jsonlite)

# Fetch data from the API
regions <- fromJSON("https://geo.api.gouv.fr/regions")

# Write data to CSV file
write.csv(regions, file = "regions.csv", row.names = FALSE)



