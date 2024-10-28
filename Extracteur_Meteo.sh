
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

# Récupération des prévisions pour demain
temperature_demain=$(curl -s "wttr.in/$nom_ville?format=%t&tomorrow")

# Date et heure actuelles
jour_actuel=$(date '+%Y-%m-%d')
heure_actuelle=$(date '+%H:%M')

# Enregistrement des informations dans un fichier
echo "$jour_actuel - $heure_actuelle - $nom_ville : $temperature_aujourdhui - $temperature_demain" >> previsions_meteo.txt
