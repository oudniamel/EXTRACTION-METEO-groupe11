#!/bin/bash

# Ville par défaut si aucun argument n'est fourni
ville_defaut="Paris"

# Vérification des arguments
if [ $# -eq 0 ]; then
    nom_ville=$ville_defaut
else
    nom_ville=$1
fi

# Format de sortie par défaut (texte ou JSON)
format_sortie=${2:-"txt"}

# Récupération des informations météo
temperature_aujourdhui=$(curl -s "wttr.in/$nom_ville?format=%t")      # Température actuelle
temperature_demain=$(curl -s "wttr.in/$nom_ville?format=%T")          # Prévision pour demain
vitesse_vent=$(curl -s "wttr.in/$nom_ville?format=%w")                # Vitesse du vent
humidite=$(curl -s "wttr.in/$nom_ville?format=%h")                    # Humidité
visibilite=$(curl -s "wttr.in/$nom_ville?format=%v")                  # Visibilité

# Date et heure actuelles
jour_actuel=$(date '+%Y-%m-%d')
heure_actuelle=$(date '+%H:%M')

if [ "$format_sortie" == "json" ]; then
    # Création du fichier JSON journalier avec la date (format : meteo_ville_YYYYMMDD.json)
    fichier_json="meteo_${nom_ville}_$(date '+%Y%m%d').json"
    echo "{
    \"date\": \"$jour_actuel\",
    \"heure\": \"$heure_actuelle\",
    \"ville\": \"$nom_ville\",
    \"temperature\": \"$temperature_aujourdhui\",
    \"prevision\": \"$temperature_demain\",
    \"vent\": \"$vitesse_vent\",
    \"humidite\": \"$humidite\",
    \"visibilite\": \"$visibilite\"
}" > "$fichier_json"
    echo "Les données météo pour $nom_ville ont été enregistrées en JSON dans $fichier_json."

else
    # Création du fichier journalier en texte avec la date (format : meteo_YYYYMMDD.txt)
    fichier_historique="meteo_$(date '+%Y%m%d').txt"
    echo "$jour_actuel - $heure_actuelle - $nom_ville : Température actuelle $temperature_aujourdhui - Prévision demai$
    echo "Les données météo pour $nom_ville ont été enregistrées en texte dans $fichier_historique."
fi

