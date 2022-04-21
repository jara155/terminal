#!/bin/bash

clear

echo "Vítej, poutníku."

echo "Vyber z možností:"

echo "     
    0) Nainstalovat ZSH
    1) Nakopírovat .zshrc | Z kali linuxu, ale upravený + git
    2) Nainstalovat addons >
"

read option
clear

case $option in
    0)
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

    1)
        echo "Ok."
        echo "Instaluji"
        sudo apt install zsh -y
        clear

        if [ -f /usr/bin/git ]; then
            echo "Hezkyyyy, git nainstalován."
        else
            echo "?? Ne? Prej git nemáš."
        fi
        ;;
    
    2)
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
            echo "Nakopírováno."
        elif [ $addon == 1 ]; then
            sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh-autosuggestions
            
            clear
            echo "Nakopírováno."
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
    
    3)
        echo "Kopíruju"
        rm ~/.zshrc
        cp .zshrc ~/.zshrc
        echo "Nakopírováno."
        ;;

    *)
        echo "Musíš vybrat z možností ne si je vymyslet"
        ;;
    
esac

echo
echo "Užívej"