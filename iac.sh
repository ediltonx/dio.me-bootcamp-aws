#!/bin/bash

echo "Criando diretórios..."

diretorios=(publico adm ven sec)

for diretorio in ${diretorios[@]}; do
mkdir /$diretorio
done

echo "Criando grupos de usuários..."

grupos=(GRP_ADM GRP_VEN GRP_SEC)

for grupo in ${grupos[@]}; do
groupadd $grupo
done

echo "Criando usuários..."

usuarios=(
"carlos:GRP_ADM"
"maria:GRP_ADM"
"joao:GRP_ADM"
"debora:GRP_VEN"
"sebastiana:GRP_VEN"
"roberto:GRP_VEN"
"josefina:GRP_SEC"
"amanda:GRP_SEC"
"rogerio:GRP_SEC"
)

for usuario in "${usuarios[@]}"; do
nome=$(echo $usuario | cut -d: -f1)
grupo=$(echo $usuario | cut -d: -f2)
useradd $nome -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G $grupo
done

echo "Especificando permissões dos diretórios...."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm /ven /sec
chmod 777 /publico

echo "Fim....."
