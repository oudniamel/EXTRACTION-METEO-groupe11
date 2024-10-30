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

# Format de sortie par défaut (JSON uniquement)
format_sortie="json"

# Fichier de log pour les erreurs
fichier_log="meteo_error.log"

# Fonction pour enregistrer les erreurs avec un timestamp
log_erreur() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERREUR : $message" >> "$fichier_log"
}

# Récupération des informations météo avec gestion des erreurs
temperature_aujourdhui=$(curl -s "wttr.in/$nom_ville?format=%t") || log_erreur "Impossible de récupérer la température actuelle pour $nom_ville"
temperature_demain=$(curl -s "wttr.in/$nom_ville?format=%T") || log_erreur "Impossible de récupérer la prévision pour demain pour $nom_ville"
vitesse_vent=$(curl -s "wttr.in/$nom_ville?format=%w") || log_erreur "Impossible de récupérer la vitesse du vent pour $nom_ville"
humidite=$(curl -s "wttr.in/$nom_ville?format=%h") || log_erreur "Impossible de récupérer l'humidité pour $nom_ville"
visibilite=$(curl -s "wttr.in/$nom_ville?format=%v") || log_erreur "Impossible de récupérer la visibilité pour $nom_ville"

# Vérification si la ville est valide (si toutes les données sont vides, il y a probablement une erreur)
if [[ -z "$temperature_aujourdhui" && -z "$temperature_demain" && -z "$vitesse_vent" && -z "$humidite" && -z "$visibilite" ]]; then
    log_erreur "Ville invalide ou problème de connexion pour la ville : $nom_ville"
    echo "Erreur : Impossible de récupérer les données pour $nom_ville. Voir $fichier_log pour plus de détails."
    exit 1
fi
>>>>>>> samy_bekdavariante3

# Date et heure actuelles
jour_actuel=$(date '+%Y-%m-%d')
heure_actuelle=$(date '+%H:%M')


# Ville par défault sur format json
if [ "$nom_ville" == "json" ]; then
    nom_ville=$ville_defaut
    format_sortie="json"
fi

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


