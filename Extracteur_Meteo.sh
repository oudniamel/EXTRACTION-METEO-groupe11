#!/bin/bash

# Ville par défaut si aucun argument n'est fourni
ville_defaut="Paris"

# Vérification des arguments
if [ $# -eq 0 ]; then
    nom_ville=$ville_defaut
else
    nom_ville=$1
fi

# Récupération des informations météo
temperature_aujourdhui=$(curl -s "wttr.in/$nom_ville?format=%t")        # Température actuelle
temperature_demain=$(curl -s "wttr.in/$nom_ville?format=%t&tomorrow")   # Prévision pour demain
vitesse_vent=$(curl -s "wttr.in/$nom_ville?format=%w")                  # Vitesse du vent
humidite=$(curl -s "wttr.in/$nom_ville?format=%h")                      # Humidité
visibilite=$(curl -s "wttr.in/$nom_ville?format=%v")                    # Visibilité

# Date et heure actuelles
jour_actuel=$(date '+%Y-%m-%d')
heure_actuelle=$(date '+%H:%M')

# Création du fichier journalier avec la date (format : meteo_YYYYMMDD.txt)
fichier_historique="meteo_$(date '+%Y%m%d').txt"

# Enregistrement des informations dans le fichier journalier
echo "$jour_actuel - $heure_actuelle - $nom_ville : Température actuelle $temperature_aujourdhui - Prévision demain $temperature_demain - Vent $vitesse_vent - Humidité $humidite - Visibilité $visibilite" >> "$fichier_historique"
