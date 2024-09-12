#/usr/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dsarmien <dsarmien@student.42malaga.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/12 18:33:17 by dsarmien          #+#    #+#              #
#    Updated: 2024/08/12 18:33:32 by dsarmien         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLOR_YELLOW="\e[33m"
COLOR_MAGENTA="\e[35m"
COLOR_CYAN="\e[36m"
COLOR_GREY="\e[90m"
COLOR_RED="\e[91m"
COLOR_GREEN="\e[92m"
COLOR_BLUE="\e[94m"
COLOR_WHITE="\e[97m"
COLOR_RESET="\e[0m"

banner() {
    echo -e "${COLOR_GREEN}"
    cat << "EOF"

     _  _  ____                         _           
    | || ||___ \    /\  /\___  __ _  __| | ___ _ __ 
    | || |_ __) |  / /_/ / _ \/ _` |/ _` |/ _ \ '__|
    |__   _/ __/  / __  /  __/ (_| | (_| |  __/ |   
       |_||_____| \/ /_/ \___|\__,_|\__,_|\___|_|   
       INSTALLER                     by WildZarek   

EOF
echo -e "${COLOR_RESET}${COLOR_WHITE}"
echo -e ">> Si te sirvió este script, dale '★ Star' en el repositorio. ¡Gracias!"
echo -e ">> ${COLOR_BLUE}https://github.com/WildZarek/42header${COLOR_WHITE}"
echo ""
echo -e ">> Contacto: ${COLOR_YELLOW}dsarmien@student.42malaga.com${COLOR_RESET}"
echo ""
sleep 3
}

clear
banner

print_info() {
    echo -ne "${COLOR_WHITE}[${COLOR_CYAN}>${COLOR_WHITE}] $1${COLOR_RESET}"
}

print_warning() {
    echo -ne "${COLOR_WHITE}[${COLOR_RED}!${COLOR_WHITE}] $1${COLOR_RESET}"
}

print_new() {
    echo -ne "${COLOR_WHITE}[${COLOR_GREEN}+${COLOR_WHITE}] $1${COLOR_RESET}"
}

print_installed() {
    echo -ne "${COLOR_WHITE}[${COLOR_MAGENTA}i${COLOR_WHITE}] $1${COLOR_RESET}"
}

print_ok() {
    echo -e "${COLOR_GREEN}OK${COLOR_RESET}"
}

print_pass() {
    echo -e "${COLOR_BLUE}PASS${COLOR_RESET}"
}

print_error() {
    echo -e "${COLOR_RED}ERROR${COLOR_RESET}"
}

# comprueba que "wget" esté instalado en el sistema
wg=$(which wget)
if [ -z $wg ]
then
    # muestra un mensaje de error
    print_warning "${COLOR_YELLOW}wget${COLOR_WHITE} no se encuentra instalado en el sistema...${COLOR_RESET}"
    print_error
    have_sudo = $(group $USER | grep -o "\<sudo\>")
    if [ -n "$have_sudo" ]; then
        print_info "${COLOR_WHITE}Utiliza: ${COLOR_CYAN}sudo apt-get upgrade && sudo apt-get install wget${COLOR_RESET}"
        echo -e "${COLOR_WHITE}Cuando finalice la intalación, ejecuta de nuevo este script.${COLOR_RESET}"
        exit 1
    else:
        print_warning "${COLOR_WHITE}No tienes permisos sudo. Por favor contacta con el administrador del sistema...${COLOR_RESET}"
        print_error
        print_info "${COLOR_WHITE}Utiliza: ${COLOR_CYAN}apt-get upgrade && apt-get install wget${COLOR_RESET}"
        echo -e "${COLOR_WHITE}Cuando finalice la intalación, ejecuta de nuevo este script.${COLOR_RESET}"
        exit 1
    fi
else
    # muestra un mensaje de inicio
    print_info "${COLOR_WHITE}Iniciando la instalación...${COLOR_RESET}"
    # crea el directorio ".vim" en tu home, si no existe...
    # también crea el subdirectorio "plugin"
    mkdir -p ~/.vim/plugin
    # entra en el subdirectorio plugin anteriormente creado
    cd ~/.vim/plugin
    print_ok
    # descarga el plugin necesario para añadir el header a vim desde el repositorio de github oficial
    wget -q https://raw.githubusercontent.com/42Paris/42header/master/plugin/stdheader.vim
    print_info "${COLOR_WHITE}Descargando el plugin '${COLOR_YELLOW}42header${COLOR_RESET}'..."
    print_ok
    # vuelve a la raíz principal, el home del usuario
    cd ~
    # se comprueba si se le pasó el nombre de usuario como argumento al script
    if [ -z $1 ]
    then
        # en caso negativo, establecemos el usuario al actual del sistema
        print_warning "No se ha proporcionado ningún usuario..."
        print_pass
        print_info "Estableciendo el usuario al del sistema actual '${COLOR_YELLOW}$(whoami)${COLOR_WHITE}'..."
        # se añade al final del archivo las variables user42 y mail42
        echo "let g:user42 = '$(whoami)'" >> ~/.vimrc
        echo "let g:mail42 = '$(whoami)@student.42malaga.com'" >> ~/.vimrc
        echo "USER=$(whoami)" >> ~/.zshrc
        echo "MAIL=$(whoami)@student.42malaga.com" >> ~/.zshrc
        print_ok
    else
        # en caso positivo, establecemos el usuario al proporcionado
        print_info "Estableciendo el usuario a '${COLOR_YELLOW}$1${COLOR_WHITE}'..."
        # se añade al final del archivo las variables user42 y mail42
        echo "let g:user42 = '$1'" >> ~/.vimrc
        echo "let g:mail42 = '$1@student.42malaga.com'" >> ~/.vimrc
        echo "USER=$1" >> ~/.zshrc
        echo "MAIL=$1@student.42malaga.com" >> ~/.zshrc
        print_ok
    fi
    print_info "¡Listo!. Plugin configurado correctamente.\n"
fi