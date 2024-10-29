# Extraction de Données Météorologiques - Variante 1

## Description du Projet

Ce projet est un script Shell qui récupère des informations météorologiques pour une ville donnée et enregistre les données dans un fichier journalier. En plus de la température actuelle et de la prévision pour le lendemain, la **Variante 1** ajoute des informations supplémentaires :
- **Vitesse du vent**
- **Humidité**
- **Visibilité**

Les données sont stockées dans un fichier avec la date du jour, permettant de conserver un historique quotidien des relevés météo.

## Fonctionnalités de la Variante 1

- Récupère les données météo pour une ville spécifiée en argument ou utilise "Paris" par défaut.
- Ajoute les informations supplémentaires suivantes :
  - Température actuelle
  - Prévision pour le lendemain
  - Vitesse du vent
  - Humidité
  - Visibilité
- Enregistre les données dans un fichier journalier au format `meteo_YYYYMMDD.txt` (par exemple, `meteo_20241030.txt` pour le 30 octobre 2024).

## Utilisation

1. **Exécution du script** :
   Pour exécuter le script et obtenir les informations météo, utilisez la commande suivante :

   ```bash
   ./Extracteur_Meteo.sh [nom_de_la_ville]