# Extraction de Données Météorologiques - Variante 1

## Description du Projet

Ce projet est un script Shell qui récupère des informations météorologiques pour une ville donnée et enregistre les données dans un fichier journalier. En plus de la température actuelle et de la prévision pour le lendemain, la **Variante 2** sauvegarde les données sous forme JSON

## Explication de la Variante 2

JSON est un format de données léger et lisible. Il organise les données en paires clé-valeur, ce qui le rend structuré et facile à manipuler. Par exemple { "ville": "Paris", "temperature": "18°C" }.

## Utilisation

1. **Exécution du script** :
  Nous pouvons sauvegarder les données en texte ou en json.
Tetxe
   ```bash
   ./Extracteur_Meteo.sh [nom_de_la_ville]
JSON
  ```bash
   ./Extracteur_Meteo.sh [nom_de_la_ville] json
