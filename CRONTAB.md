# Configuration de l'Automatisation avec le Planificateur de Tâches (Windows)

## Objectif
Automatiser l’exécution du script météo en utilisant PowerShell et le Planificateur de Tâches sur Windows.

## Étapes de Configuration

1. Ouvrez l’Outil de Planification des Tâches dans Windows.
2. Cliquez sur **Créer une tâche** et configurez-la avec les paramètres suivants :

   - **Nom** : `ExtractionMeteo`.
   - **Déclencheur** : Choisissez la fréquence (par exemple, toutes les heures).
   - **Action** :
     - Programme/script : `powershell.exe`
     - Ajouter des arguments : `-File "C:\chemin\vers\Extraction-Meteo\Extracteur_Meteo.ps1"`

3. Enregistrez la tâche. Elle s'exécutera automatiquement selon la fréquence définie.
