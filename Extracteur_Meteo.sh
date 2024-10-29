#!/bin/bash

# Ville par défaut si aucun argument n'est fourni
ville_defaut="Paris"

# Vérification des arguments
if [ $# -eq 0 ]; then
    nom_ville=$ville_defaut
else
    nom_ville=$1
fi

# Récupération de la météo actuelle
temperature_aujourdhui=$(curl -s "wttr.in/$nom_ville?format=%t")
vitesse_vent=$(curl -s "wttr.in/$nom_ville?format=%w")
humidite=$(curl -s "wttr.in/$nom_ville?format=%h")
visibilite=$(curl -s "wttr.in/$nom_ville?format=%V")

# Récupération des prévisions pour demain
temperature_demain=$(curl -s "wttr.in/$nom_ville?format=%t&tomorrow")

# Date et heure actuelles
jour_actuel=$(date '+%Y-%m-%d')
heure_actuelle=$(date '+%H:%M')

# Création du fichier journalier avec la date (format : meteo_YYYYMMDD.txt)
fichier_historique="meteo_$(date '+%Y%m%d').txt"

# Enregistrement des informations dans le fichier journalier
echo "$jour_actuel - $heure_actuelle - $nom_ville : $temperature_aujourdhui - $vitesse_vent - $humidite - $visibilite - $temperature_demain" >> "$fichier_historique"
