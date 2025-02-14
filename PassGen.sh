#!/bin/bash

# Dependencias
function dep(){
    tput civis; clear
    echo -e "\n\n\t\e[35m[!]\e[33m Verificando si las dependencias están instaladas..."; sleep 1
    clear

for requirements in xclip; do

if ! $(which $requirements &>/dev/null)
then
clear
echo -e "\n\n\t\e[31m[!]\e[33m Comando \e[31m$requirements\e[33m no instalado.\e[0m"
sleep 2

tput cnorm; sudo apt install $requirements -y

    else
    :

fi
done

tput civis; clear
echo -e "\n\n\t\e[32m[!]\e[33m Dependencias instaladas.\e[0m"
sleep 0.5; tput cnorm; clear

}

# Colores
Rojo='\033[31m'
Verde='033[32m'
Azul='\033[34m'
Magenta='033[35m'
Cyan='\033[36m'
NC='\033[39m'

# Rango de carácteres

characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*"

dep

# Menú y Solicitar longitud de la contraseña

echo -e "\e[35m|------------------------------------------------------------|"
echo -e "|\e[36m__________                          ________                \e[35m|"
echo -e "|\e[36m\______   \_____    ______ ______  /  _____/  ____   ____   \e[35m|"
echo -e "|\e[36m |     ___/\__  \  /  ___//  ___/ /   \  ____/ __ \ /    \  \e[35m|"
echo -e "|\e[36m |    |     / __ \_\___ \ \___ \  \    \_\  \  ___/|   |  \ \e[35m|"
echo -e "|\e[36m |____|    (____  /____  >____  >  \______  /\___  >___|  / \e[35m|"
echo -e "|\e[36m                \/     \/     \/          \/     \/     \/  \e[35m|"
echo -e "|------------------------------------------------------------|\n"
echo -e "\n|- Ingresa la longitud de la contraseña - |"
read -p "|---> " longitud
sleep 0.6

# Generar contraseña

password=$(echo "$characters" | fold -w1 | shuf | tr -d '\n' | head -c$longitud)

# Mostrar contraseña

echo -e "\n\e[33m[\e[31m!\e[33m]\e[32m Contraseña generada: \e[31m$password\e[0m"

echo -e "\n\e[35m[\e[36m!\e[35m] ¿Desea guardar la contraseña en el portapapeles?\e[0m"

echo -e "\n\e[35m\t[\e[36m 1.\e[35m Sí ]"
echo -e "\n\e[35m\t[\e[36m 2.\e[35m No ]"

echo -e "\n\e[35m[\e[36m!\e[35m] Selecciona una opción.\n"
read -p "|---> " Opcion

case $Opcion in
   1)
  echo -n "$password" | xclip -selection clipboard
  echo -e "\n\n\e[32m[✓] Contraseña copiada al portapapeles.\n\n"
  ;;
2)
  echo -e "\n\e[31m[!] No se copiará la contraseña al portapapeles\e[0m"
  clear

echo -e "\n\n\t\e[35m[\e[36m!\e[35m] Contraseña generada: \e[31m$password\e[0m\n\n"

exit 1
  ;;
*)
  clear
  echo -e "\n\n\t\e[33m [\e[31m!\e[33m] \e[31mOpción inválida, se cerrará el programa.\e[0m"
  ;;
esac
