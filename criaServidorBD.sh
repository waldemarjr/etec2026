#
# ETEC Santa Rosa de Viterbo - 2026
# Curso: Programação de Jogos Digitais
# Professor: Waldemar Dibiazi Junior
# Disciplina: Linguagem de Programação II
# Versão: 1.1 (08/2026)

#!/bin/bash
p="/usr/bin/podman"
m="/usr/bin/mysql"
c="/usr/bin/curl"
nomeImagem="mysql/mysql-server"
nomeContainer="servidorBancoDados"
usuarioMySQL="root"
senhaMySQL="etec123"
statusFile="/tmp/_status_"
portaExterna="3306"
portaInterna="3306"
checkTime="2"
databaseDir="/tmp/db"
internalDir="/var/lib/mysql"
backupFile="https://raw.githubusercontent.com/waldemarjr/etec2026/refs/heads/main/etec.sql"
tmpBackupFile="/tmp/etec.sql"

function getBackupFile(){
	rm -f /tmp/etec.sql
	$c -s $backupFile -o $tmpBackupFile
}

function restoreBackupFile(){
	$m -u $usuarioMySQL -h 127.0.0.1 -p$senhaMySQL < $tmpBackupFile
}

function imageCheck(){
	$p image ls |grep $nomeImagem 1> /dev/null 2> /dev/null
	if [ $? -eq 0 ]; then
		return 0
	else
		return 1
	fi
}

function containerCheck(){
	$p container ls -a |grep $nomeContainer 1> /dev/null 2> /dev/null
	if [ $? -eq 0 ]; then
		return 0
	else
		return 1
	fi
}

function imageDownload(){

	echo "Baixando imagem do MySQL Server..."
	$p pull $nomeImagem 1> /dev/null 2> /dev/null &
	echo "Aguarde"
	while [ true ]; do
		$p image ls |grep $nomeImagem 1> /dev/null 2> /dev/null
		if [ $? -eq 0 ]; then
			echo "[ Download concluído ]"
			break
		else
			echo -n "."
		fi
		sleep 2
	done
}

function containerDelete(){
	sleep 2
	echo "Excluindo container [$nomeContainer] já existente..."
	$p container rm -a -f 1> /dev/null 2> /dev/null
}

function containerCreate() {
	containerCheck
	if [ $? -eq 0 ]; then
		containerDelete
	fi
	if [ ! -d $databaseDir ]; then
		echo "Criando diretório para armazenamento de databases do MySQL..."
		mkdir $databaseDir
	else 
		echo "Diretório para armazenamento de databases do MySQL já existente..."
	fi

	echo "Criando container para atuar como Servidor de Banco de dados..."
	$p container run -v $databaseDir:$internalDir -d --name $nomeContainer -p $portaExterna:$portaInterna -e MYSQL_ROOT_PASSWORD=$senhaMySQL -e MYSQL_ROOT_HOST=% --tz=America/Sao_Paulo  $nomeImagem 1> /dev/null 2> /dev/null
}



clear
echo 
echo "+---------------------------------------------------+"
echo "|    Provisionando servidor de banco de dados       |"
echo "+---------------------------------------------------+"
echo
echo 
imageCheck
if [ $? -eq 0 ]; then
	echo "Imagem $nomeImagem já foi baixada"
else
	imageDownload
fi

sleep 2

containerCreate

sleep 2

echo -n "Aguardando MySQL aceitar conexões"
while [ true ]; do

	$p container logs $nomeContainer 2>&1 |grep "ready for connections." 1> /dev/null

	if [ $? -eq 0 ]; then
		echo 
		echo "Conexao estabelecida na porta TCP/$portaExterna"
		sleep 3
		echo "Obtendo backup da base de dados via Github.com..."
		getBackupFile
		echo "Aguarde..."
		sleep 15
		echo "Restaurando backup no Servidor MySQL..."
		restoreBackupFile
		break
	fi
	echo -n .
	sleep $checkTime
done
echo "Deploy do Servidor de Banco de Dados concluído."

