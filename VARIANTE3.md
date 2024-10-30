# Variante 3 : Script Amélioré pour Extraction Météo

## Objectif
La Variante 3 du projet vise à extraire des données météorologiques d'une ville donnée, à les enregistrer dans un fichier JSON, et à ajouter une gestion des erreurs ainsi qu'un système de logs pour améliorer la fiabilité du script.

## Fonctionnalités de la Variante 3
- Récupère la météo pour une ville fournie en argument ou utilise "Paris" par défaut.
- Enregistre la température actuelle, la prévision pour le lendemain, la vitesse du vent, l'humidité, et la visibilité dans un fichier JSON nommé avec la date du jour.
- En cas de problème de connexion au service `wttr.in`, consigne un message d’erreur dans le fichier `meteo_error.log` avec un timestamp pour faciliter le suivi.

## Utilisation
Exécutez la commande suivante pour lancer le script :
```bash
./Extracteur_Meteo.sh [ville] [format]


## Objectif
La variante 3 du projet vise à extraire des données météorologiques d'une ville donnée, à les enregistrer dans un fichier JSON, et à ajouter une gestion des erreurs ainsi qu'un système de logs pour améliorer la fiabilité du script.

## Fonctionnalités de la Variante 3
- Récupère la météo pour une ville fournie en argument ou utilise "Paris" par défaut.
- Enregistre la température actuelle, la prévision pour le lendemain, la vitesse du vent, l'humidité, et la visibilité dans un fichier JSON nommé avec la date du jour.
- En cas de problème de connexion au service `wttr.in`, consigne un message d’erreur dans le fichier `meteo_error.log` avec un timestamp pour faciliter le suivi.

## Utilisation
Exécutez la commande suivante pour lancer le script :
```bash
./Extracteur_Meteo.sh [ville] [format]
