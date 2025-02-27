# 42header

![Header](assets/header.png)

Script de Bash para instalar y configurar el plugin necesario para añadir el header de 42 en el editor Vim.<br>
Puedes ver el GitHub original del plugin en el siguiente enlace:
**[https://github.com/42Paris/42header](https://github.com/42Paris/42header)**

### INSTALACIÓN:

1. Abre una nueva terminal.
2. Asegurate de tener instalado Vim en tu sistema.
3. Clona este repositorio: <code>git clone https://github.com/WildZarek/42header</code>
4. Entra en el directorio creado: <code>cd 42header</code>
5. Dale permisos de ejecución al script: <code>chmod +x install.sh</code>
6. Ejecuta el script de instalación de este modo: 
    <code>./install.sh tu_usuario_en_la_intra_42</code>
    <br>(Ejemplo: ./install.sh dsarmien) <- Si no se proporciona ningún usuario, se tomará el del sistema actual.
    ![Running](assets/running.png)
7. Cierra la terminal y abre una nueva.

### UTILIZACIÓN:

Una vez abierto Vim, estando en modo **NORMAL** puedes escribir: <code>:Stdheader</code> y darle a la tecla <kbd>ENTER</kbd><br>
O simplemente puedes darle a la tecla <kbd>F1</kbd>

En **Linux** es posible que debas desactivar el atajo de teclado hacia el comando **help** de la **terminal**.<br>
Para **Terminator**, ve a -> Preferences -> Shortcuts -> y cambia el atajo de teclado a otra cosa distinta de <kbd>F1</kbd>

> [!NOTE]
> Si consideras útil este proyecto, apóyalo haciendo "★ Star" en el repositorio. ¡Gracias!<br>
> Si tienes alguna duda o necesitas ayuda, escríbeme en Slack :sunglasses:

### LICENCIA

This work is published under the terms of **[42 Unlicense](https://github.com/gcamerli/42unlicense)**.