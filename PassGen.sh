#!/bin/bash

## Variables
# Colores
red="\e[31m"
gre="\e[32m"
yel="\e[33m"
blu="\e[34m"
pur="\e[35m"
cia="\e[36m"
end="\e[0m"

# Función para mostrar el logo de PassGen
function logo(){
echo -e '
\e[34m|-------------------------------------------------------------|
\e[36m  __________                          ________
\e[36m  \______   \_____    ______ ______  /  _____/  ____   ____
\e[36m   |     ___/\__  \  /  ___//  ___/ /   \  ____/ __ \ /    \
\e[36m   |    |     / __ \_\___ \ \___ \  \    \_\  \  ___/|   |  \
\e[36m   |____|    (____  /____  >____  >  \______  /\___  >___|  /
\e[36m                  \/     \/     \/          \/     \/     \/
\e[34m|-------------------------------------------------------------|\e[0m
'
}

# Panel de ayuda
function helpPanel(){

echo -e "\n${blu}[${cia}*${blu}]${cia} Uso normal: ./PassGen.sh <longitud>"
	echo -e "\t${cia}h)${blu} Muestra este panel de ayuda"
	echo -e "\t${cia}c)${blu} Copia la contraseña en el portapapeles"
	echo -e "\t${pur}   Ejemplo: ./PassGen -c 30 \n"
	exit 0

}

# Verificación e instalación automática de xclip

	if ! command -v xclip &>/dev/null; then

	echo -e "\n\t${red}[${yel}!${red}]${yel} Comando ${red}xclip${yel} no instalado...\n"; sleep 1.5
	echo -e "\t${blu}[${cia}*${blu}]${pur} Instalando ${cia}xclip${pur} ...\n\n"; sleep 0.8
	sudo apt install xclip -y

	clear
	echo -e "\n\t${blu}[${cia}*${blu}]${blu} Comando ${cia}xclip${blu} instalado correctamente."; sleep 2; clear

	fi

## Manejo de opciones con getopts
copiar=false  # Bandera para copiar al portapapeles

	while getopts "hc:" opt; do
		case $opt in
		h)
               		helpPanel
               		exit 0
               		;;
		c)
			copiar=true
			longitud=$OPTARG
			;;
		*)
			echo -e "\n${red}[${yel}!${red}]${yel} Opción no válida.\n"
			echo -e "\n${blu}[${cia}*${blu}]${cia} Usa: ${pur}./PassGen -h   ${cia}# Para abrir el panel de control"
			exit 1
			;;
		esac
	done

shift $((OPTIND - 1)) # Ajusta los argumentos después de getopts

## Generar la contraseña

	if [ -z "$longitud" ]; then
		longitud=$1 # Si no se pasó como argummento, toma el primero después de las opciones
	fi

	if [ -z "$longitud" ]; then
		echo -e "\n${red}[${yel}!${red}]${yel} Debes especificar la longitud de la contraseña."
		echo -e "\n${blu}[${cia}*${blu}]${cia} Usa: ${pur}./PassGen -h   ${cia}# Para abrir el panel de control"
    		exit 1
	fi

characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*"
password=$(echo "$characters" | fold -w1 | shuf | tr -d '\n' | head -c $longitud)

# Mostrar resultado

	if [ "$copiar" = true ]; then

		echo -n "$password" | xclip -selection clipboard
		logo
		echo -e "\n${blu}[${cia}*${blu}]${cia} Contraseña generada:${pur} $password${end}"
     	echo -e "\n${gre}[*] Contraseña copiada al portapapeles.${end}"
	else

		logo
		echo -e "\n${blu}[${cia}*${blu}]${cia} Contraseña generada:${pur} $password${end}"
	fi
