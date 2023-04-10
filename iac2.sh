#!/bin/bash

echo "Atualizando o servidor..."
apt update && apt upgrade -y

echo "Instalando Apache e Unzip..."
apt install apache2 unzip -y

echo "Baixando e copiando os arquivos da aplicação..."
cd /tmp &&
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip &&
unzip main.zip &&
cd linux-site-dio-main &&
cp -R * /var/www/html/

echo "Fim do script."
