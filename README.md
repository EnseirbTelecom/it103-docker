# Image Docker pour le module IT103

## Installation et démarrage

Pour démarrer le conteneur contenant PHP, MySQL et PhpMyAdmin il faut tout d'abord installer Docker sur votre machine. Ensuite créez un répertoire it103 ou vous voulez sur votre machine (pour le reste de l'exemple on imaginera que le dossier est situé ici : `/path/to/it103`).

Tous d'abord il faut démarrer Docker et installer (ou mettre à jour) le conteneur:

`docker pull jrfaller/it103`

## Utilisation

Le conteneur se démarre de la manière suivante: `docker run -p 80:80 -v /path/to/it103/:/var/www/html/it103 jrfaller/it103`.

Sous Linux et Mac OS, vous pouvez lancer facilement docker en le bindant sur votre répertoire courant de la manière suivante : `docker run -p 80:80 -v $PWD:/var/www/html/it103 jrfaller/it103`.

Si vous avez des problèmes pour ouvrir le port 80 sur votre ordinateur (message `Error starting userland proxy: listen tcp 0.0.0.0:80: bind: address already in use.`), vous pouvez utiliser un autre port, comme le `8080` de la manière suivante: `docker run -p 8080:80 -v /path/to/it103/:/var/www/html/it103 jrfaller/it103` (dans ce cas là l'URL sera `http://localhost:8080`).

L'infrastructure est maintenant fonctionnelle. **Attention, le contenu de la base de données est effacée à chaque redémarrage du conteneur. Si vous voulez conserver son contenu il faut l'exporter en utilisant phpMyAdmin.**

Les fichiers PHP sont à placer dans le dossier `/path/to/it103`. Vous pouvez directement les éditer avec n'importe quel éditeur texte. Vous pouvez en outre accéder aux différents outils suivants:

- <http://localhost/phpmyadmin>: interface de gestion MySQL PhpMyAdmin. Petite précision, l'utilisateur créé par défaut pour MySQL est `admin` avec mot de passe `it103`.
- <http://localhost/it103>: votre site. Pour un accèss direct à un script il faut mettre le chemin vers le script dans l'URL.
- <http://localhost/info>: informations sur la configuration du PHP installé dans le conteneur.

## Remerciements

Ce conteneur est basé sur celui de [tutumcloud](https://github.com/tutumcloud/lamp).
