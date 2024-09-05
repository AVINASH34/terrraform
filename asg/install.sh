#!/bin/bash

sudo apt update
sudo apt install apache2 php libapache2-mod-php php-mysql stress -y
echo "<?php phpinfo(); ?>" > info.php
sudo cp info.php /var/www/html/info.php