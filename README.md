# Infrastructure Docker pour le module IT103

## Installation et démarrage

Pour démarrer le conteneur contenant PHP, MySQL et PhpMyAdmin il faut tout d'abord installer Docker sur votre machine. Ensuite créez un répertoire it103 ou vous voulez sur votre machine (pour le reste de l'exemple on imaginera que le dossier est situé ici : `/path/to/it103`).

Tous d'abord il faut démarrer Docker et installer le conteneur (cette commande n'est à faire qu'une seule fois):

`docker pull jrfaller/it103`

Ensuite vous pouvez démarrer le conteneur de la manière suivante (à chaque fois que vous voulez démarrer le conteneur): `docker run -p 80:80 -v /path/to/it103/:/var/www/html/it103 jrfaller/it103`.

Sous Linux et Mac OS, vous pouvez lancer facilement docker en le bindant sur votre répertoire courant de la manière suivante : `docker run -p 80:80 -v $PWD:/var/www/html/it103 jrfaller/it103`.

L'infrastructure est maintenant fonctionnelle. **Attention, le contenu de la base de données est effacée à chaque redémarrage du conteneur. Si vous voulez conserver son contenu il faut l'exporter en utilisant phpMyAdmin.**

## Utilisation

Les fichiers PHP sont à placer dans le dossier `/path/to/it103`. Vous pouvez directement les éditer avec n'importe quel éditeur texte. Vous pouvez en outre accéder aux différents outils suivants:

- <http://localhost/phpmyadmin>: PhpMyAdmin. Petite précision, l'utilisateur créé par défaut pour MySQL est `admin` avec mot de passe `it103`.
- <http://localhost/it103>: votre site.
- <http://localhost/info>: informations sur la config PHP.

## Remerciements

Ce conteneur est basé sur celui de [tutumcloud](https://github.com/tutumcloud/lamp).
