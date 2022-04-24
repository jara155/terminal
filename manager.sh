#!/bin/bash

source "assets/progress.sh"

# Dodělat možnost 3

clear

progress

echo "Vítej, poutníku."

echo "Vyber z možností:  
    [01] Nainstalovat ZSH
    [02] Nakopírovat .zshrc | Z kali linuxu, ale upravený + git
    [03] Nainstalovat addons >
    [00] Zavřít
"

read option
clear

case $option in
    01 | 1)
        echo "Ok."
        echo "Instaluji"
        sudo apt install zsh -y
        clear
        if [ -f /usr/bin/zsh ]; then
            echo "Hezkyyyy, zsh nainstalován."
        else
            echo "?? Ne? Prej zsh nemáš."
        fi
        ;;
    02 | 2)
        echo "Kopíruju"
        if [ -f ~/.zshrc ]; then
            rm ~/.zshrc
        fi
        cp $(pwd)/assets/.zshrc ~/.zshrc
        echo "Nakopírováno."
        ;;

    03 | 3)
        echo "Co chceš nainstalovat:"
        echo "Mám:
        0) autosuggestions
        1) bash-completion
        2) git
        "

        read addon

        if [ $addon == 0 ]; then
            sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting /usr/share/zsh-syntax-highlighting

            clear
            echo "Nainstalováno"
        elif [ $addon == 1 ]; then
            sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh-autosuggestions
            
            clear
            echo "Nainstalováno"
        elif [ $addon == 2 ]; then
            sudo apt install git -y

            clear
            
            if [ -f /usr/bin/git ]; then
                echo "Hezkyyyy, git nainstalován."
            else
                echo "?? Ne? Prej git nemáš."
            fi
        else
            echo "Musíš něco vybrat víš."
        fi
        ;;
    
    00 | 0)
        exit
        ;;
    
    *)
        echo "Musíš si vybrat, ne vymýšlet."
        ;;

esac

echo
echo "Užívej"