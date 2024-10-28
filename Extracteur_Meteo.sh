#!/bin/bash

echo "Veuillez entrer le nom d'une ville :"
read nom_ville

# Récupération de la météo actuelle
temperature_aujourdhui=$(curl -s "wttr.in/$nom_ville?format=%t")

# Récupération des prévisions pour demain
temperature_demain=$(curl -s "wttr.in/$nom_ville?format=%t&tomorrow")

# Date et heure actuelles
jour_actuel=$(date '+%Y-%m-%d')
heure_actuelle=$(date '+%H:%M')

# Enregistrement des informations dans un fichier
echo "$jour_actuel - $heure_actuelle - $nom_ville : $temperature_aujourdhui - $temperature_demain" >> previsions_meteo.txt
