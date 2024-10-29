

#!/bin/bash

# Ville par defaut si aucun argument n'est fourni
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

# Création du fichier journalier avec la date (format : meteo_YYYYMMDD.txt)
fichier_historique="meteo_$(date '+%Y%m%d').txt"

# Enregistrement des informations dans le fichier journalier
echo "$jour_actuel - $heure_actuelle - $nom_ville : $temperature_aujourdhui - $temperature_demain" >> "$fichier_historique"
#!/bin/bash
CITY=${1:-"Toulouse"} 
DATE=$(date '+%Y-%m-%d - %H:%M')
METEO_DATA=$(curl -s "wttr.in/$CITY?format=%t+%T")
echo "$DATE - $CITY : $METEO_DATA" >> meteo.txt


