#documentation https://doc.navitia.io/#getting-started
#documentation https://ressources.data.sncf.com/pages/accueil/
#documentation https://doc.navitia.io/#getting-started
#install.packages("jsonlite")
library("jsonlite")
#install.packages("tidyverse")
library("tidyverse")
#install.packages("lubridate")
library("lubridate")
#quelle requete pour obtenir la liste des trains arrivées en strasbourg
json_arrivees <- fromJSON("https://14a57932-a2a1-4af4-a9d4-ccb7bac0ff48@api.sncf.com/v1/coverage/sncf/stop_areas/stop_area:SNCF:87212027/arrivals?count=1000&")
View(json_arrivees)
# Transformation des données en tableau
arriv_infos <- as.data.frame(as.list(json_arrivees$arrivals)$display_informations)
# Séléction des variables utiles et création d'un identifiant pour jointure
infos <- arriv_infos %>% select(Reseau = network, Type = physical_mode, Direction = direction, Ligne = name, Num = trip_short_name) %>% mutate(id =
                                                                                                                                                 rownames(arriv_infos))
# Transformation des données en tableau
arriv_hor <- as.data.frame(as.list(json_arrivees$arrivals)$stop_date_time)
# Séléction des variables utiles 
horaire <- arriv_hor %>% select(Arrivee = arrival_date_time) %>% mutate(id = rownames(arriv_hor))

# Ecriture du CSV
write.csv(horaire, 'arrivees_Strasbourg.csv')
#Exercie
#1-créer une branche sur votre tp_api nommée api_sncf
#2-Ajouter le fichier que je vous ai envoyé
#3-Tester les trois urls renvoyaient avec la création de votre token
#4-En 2022,Construiser moi une base contenant l'ensemble des trains qui ont visité 100 gares différents
#5- Merger votre travaux à votre branche initial
#6-Envoyer votre travaux sur git
#7 Envoyer un mail avec le lien de votre compte git
