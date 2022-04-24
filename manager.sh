#!/bin/bash

source "assets/progress.sh"

clear

echo "Vítej, poutníku."

echo "Vyber z možností:  
    [01] Nainstalovat ZSH
    [02] Nakopírovat .zshrc
    [03] Nainstalovat addons/
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
        clear
        echo "[] = pwd(Trasa), {} = git branch"
        echo
        echo "$(tput setaf 4)┌──($(tput setaf 1)$(whoami)@Linux$(tput setaf 4))-[$(tput setaf 7)~$(tput setaf 4)]-{$(tput setaf 2)main$(tput setaf 4)}"
        echo "$(tput setaf 4)└─$(tput setaf 1)$ Ahuuj"
        
        echo
        echo "$(tput setaf 2)Libí? (y/n)$(tput setaf 0)"

        read moznost
        clear

        if [ $moznost == "y" ]; then
            if [ -f ~/.zshrc ]; then
                rm ~/.zshrc
            fi
            cp $(pwd)/assets/.zshrc ~/.zshrc
            progress
            echo "Nakopírováno."
        else
            echo "Tak ne no, třeba na budúce."
            sleep 1.5
            command ./manager.sh
        fi

        ;;

    03 | 3)
        echo "Co chceš nainstalovat:"
        echo "Mám:
        [1] autosuggestions
            - Automaticky nabídne příkaz, který byl použit.
        [2] syntax-highlighting
            - Obarví příkaz, červená = neexistje, zelená = existuje
        [3] git
            - Version Control, od Linus Torvalds.
        "

        read addon

        if [ $addon == 1 ]; then
            sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh-autosuggestions
            
            clear
            progress
            echo "Nainstalováno"
        elif [ $addon == 2 ]; then
            sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting /usr/share/zsh-syntax-highlighting

            clear
            progress
            echo "Nainstalováno"
        elif [ $addon == 3 ]; then
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

sleep 1
clear
echo "Užívej"