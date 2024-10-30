<<<<<<< HEAD
# Version 1 : Script de Base pour Extraction Meteo

## Objectif
La Variante 3 de notre projet vise à ajouter une gestion des erreurs et un système de logs pour renforcer la fiabilité et la traçabilité du script de récupération météo

## Fonctionnalites de la Version 1
- Recupere la meteo pour une ville fournie en argument ou utilise "Toulouse" par defaut.
- Enregistre la temperature actuelle et la prevision pour le lendemain dans le fichier `meteo.txt`.

## Utilisation
Executez la commande suivante pour lancer le script :
```bash
<<<<<<< HEAD
./Extracteur_Meteo.sh [ville]
=======
./Extracteur_Meteo.sh [ville]
>>>>>>> ameloudni
=======
# Version 1 : Script de Base pour Extraction Météo

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
