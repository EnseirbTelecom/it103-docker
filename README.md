# Infrastructure Docker pour le module IT103

## Installation et démarrage

Pour démarrer le conteneur contenant PHP, MySQL et PhpMyAdmin il faut tout d'abord installer Docker sur votre machine. Ensuite créez un répertoire it103 ou vous voulez sur votre machine (pour le reste de l'exemple on imaginera que le dossier est situé ici : `/path/to/it103`).

Tous d'abord il faut démarrer Docker et installer le conteneur:

`docker pull jrfaller/it103`

Ensuite vous pouvez démarrer le conteneur de la manière suivante:

`docker run -p 80:80 -v /path/to/it103/:/var/www/html/it103 it103`

## Utilisation

Les fichiers PHP sont à placer dans le dossier it103. Vous pouvez ensuite accéder aux différents outils suivants:

- <http://localhost/info>: informations sur la config PHP
- <http://localhost/phpmyadmin>: PhpMyAdmin
- <http://localhost/it103>: votre site

## Remerciements

Ce conteneur est basé sur celui de [tutumcloud](https://github.com/tutumcloud/lamp).