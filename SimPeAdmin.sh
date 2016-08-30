#!/bin/bash
  # mortal poder criar e deletar o povo :)
  # usuario ALL=(ALL) NOPASSWD: /usr/sbin/useradd
  # usuario ALL=(ALL) NOPASSWD: /usr/sbin/userdel
  # usuario ALL=(ALL) NOPASSWD: /usr/bin/smbpasswd
  # usuario ALL=(ALL) NOPASSWD: /usr/bin/passwd
  
#######Funcao de controle de acesso as outras funcoes do script##############
$empresa = empresa
cat /etc/passwd | awk 'BEGIN{ FS=":" } { print "\t"$4"\t"$1"\t"$5 }' | sort | grep "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][4]" > /home/universo/log/tabela-usuario.log
cp /home/$empresa/log/tabela-usuario.log /home/$empresa/admin/logscript/
Principal() {	
	dir=`pwd`
	kernel=`uname -r`
	arquitetura=`uname -m`
	grupos=groups
	lr=" \e[31;1m"
	lg=" \e[32;1m"
	lb=" \e[36;1m"
	fcor="\e[m"
	fl="$lb|$fcor"
	linha="$lb +----------------------------------------------------------------------------+$fcor"
        ######### Cria estrutura de diretorios ##########################
	uhome="/home/universo" 	# Diretorio de grupos
	bhome="/home/backup"	# Diretorio de backup
	loghome="/home/log"	# Diretorio de logs
	######### Cria diretorios caso nao exista #######################
	if ! [ -d "$uhome" ]; then
		mkdir $uhome
	fi
	if ! [ -d "$bhome" ]; then
		mkdir $bhome
	fi 
	if ! [ -d "$loghome" ]; then
		mkdir $loghome
	fi
        ########## Inicio da tela de Menu Principal ##################	
        clear
	echo -e $linha
	echo -e "$fl $lg                Shell Script para Linux Debian                           $fcor$fl"
	echo -e $linha
	echo -e "$fl $lg          Add / Del Usuarios/Grupos no Samba e no Linux                  $fcor$fl"
	echo -e  $linha
	echo -e " Diretorio...:$lg $dir $fcor Kernel...:$lg $kernel $arquitetura $fcor"
	echo -e  $linha
	echo -e "$fl$lg               ADICIONAR            $fcor$fl$lg               DELETAR             $fcor$fl"
	echo -e  $linha
	echo -e "$fl  1. Add Usuario                     $fl  5. Del Usuario                    $fl"
	echo -e "$fl  2. add Grupo                       $fl  6. Del Grupo                      $fl"
	echo -e "$fl  3. Add Usuario do Grupo            $fl  7. Del Usuario do Grupo           $fl"
	echo -e "$fl  4. Add Maquina                     $fl  8. Del Maquina                    $fl"
	echo -e  $linha
	echo -e "$fl  9. Consultar login                 $fl                                    $fl"
	echo -e "$fl  10.Consultar Grupo                 $fl                                    $fl"
	echo -e "$fl  11.Alt login.defs UID Maquinas     $fl                                    $fl"
	echo -e "$fl  12.                                $fl                                    $fl"
	echo -e  $linha
	echo -e "$fl  13. Sair                           $fl                                    $fl"
	echo -e  $linha
	###################### Fim da tela de Menu Principal ####################
	echo -n "  Entre com a opcao desejada...: "
	read opcao
	case $opcao in
		1) AddUser ;;
		2) AddGrp ;;
		3) AddUserGrp ;;
		4) AddMaq ;;
		5) DelUser ;;
		6) DelGrp ;;
		7) DelUserGrp ;;
		8) DelMaq ;;
		9) LstU ;;
		10) LstG;;
		11) ;;
		13) clear ;exit ;;
		*) echo -ne "\tOpcao desconhecida." ; echo ; Principal ;;
	esac
  }
