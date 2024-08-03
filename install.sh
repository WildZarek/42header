#/usr/bin/bash

# muestra un mensaje de inicio
echo -e "\nInstalando el header de 42...\n"
# crea el directorio ".vim" en tu home, si no existe...
# también crea el subdirectorio "plugin"
mkdir -p ~/.vim/plugin
# entra en el subdirectorio plugin anteriormente creado
cd ~/.vim/plugin
# comprueba que "wget" esté instalado en el sistema
wg=$(which wget)
if [ -z $wg ]
then
    # muestra un mensaje de error
    echo -e "\nError: No se encontró el comando wget."
    echo -e "Utilice:\t sudo apt upgrade && sudo apt install wget\n"
else
    # descarga el plugin necesario para añadir el header usando vim desde el repositorio de github
    wget -q https://raw.githubusercontent.com/42Paris/42header/master/plugin/stdheader.vim
fi
# vuelve a la raíz principal, el home del usuario
cd ~
# se añade al final del archivo las variables user42 y mail42
echo "let g:user42 = '$1'" >> ~/.vimrc
echo "let g:mail42 = '$1@student.42malaga.com'" >> ~/.vimrc
# muestra un mensaje de finalización
echo -e "\n¡Listo! Ya puedes usar el plugin para incluir el header 42 en Vim.\n"