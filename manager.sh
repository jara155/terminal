#!/bin/bash

source "assets/progress.sh"

blk='\e[0;30m' # Black - Regular
red='\e[0;31m' # Red
grn='\e[0;32m' # Green
org='\e[0;33m' # Orange
blue='\e[0;34m' # bluee
pur='\e[0;35m' # Purple
cyn='\e[0;36m' # Cyan
wht='\e[0;37m' # White
reset='\e[0;m' # Reset


clear

echo -e "${blue}Vítej, poutníku."

echo

echo -e "${grn}[+] ${wht}Co máš za package manager?:
    ${red}[${grn}01${red}] ${org}Pacman/Pamac
    ${red}[${grn}02${red}] ${org}APT
    ${red}[${grn}03${red}] ${org}DNF
    ${reset}
"
read manager

case $manager in
    01 | 1)
        manager="pacman -S"
        ;;
    02 | 2)
        manager="apt install"
        ;;
    03 | 3)
        manager="dnf install"
        ;;
    esac

echo -e "${grn}[+] Vybrán package manager ($manager)"
sleep 3
clear

echo -e "($manager) ${wht}| Vyber z možností:  
    ${red}[${grn}01${red}] ${org}Nainstalovat ZSH
    ${red}[${grn}02${red}] ${org}Nakopírovat .zshrc
    ${red}[${grn}03${red}] ${org}Nainstalovat addons/
    ${red}[${grn}00${red}] ${org}Zavřít
    ${reset}
"

read option
clear

case $option in
    01 | 1)
        echo "Ok."
        echo "Instaluji"
        sudo $manager zsh
        clear
        if [ -f /usr/bin/zsh ]; then
            echo -e "${grn}[+] Hezkyyyy, zsh nainstalován."
        else
            echo -e "${ylw}[~] ?? Ne? Prej zsh nemáš."
        fi
        ;;
    02 | 2)
        clear
        echo "[] = pwd(Trasa), {} = git branch"
        echo
        echo -e "${blue}┌──(${red}$(whoami)@Linux${blue})-[${wht}~${blue}]-{${grn}main${blue}}"
        echo -e "${blue}└─${red}$ Ahuuj"
        
        echo
        echo -e "${reset}Libí? (${grn}y${reset}/${red}n${reset})"

        read moznost
        clear

        if [ $moznost == "y" ]; then
            if [ -f ~/.zshrc ]; then
                rm ~/.zshrc
            fi
            cp $(pwd)/assets/.zshrc ~/.zshrc
            progress
            echo -e "${grn}[+] Nakopírováno."
        else
            echo -e "${red}[-] Tak ne no, třeba na budúce."
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
            - Obarví příkaz, červená = neexistuje, zelená = existuje
        [3] git + .gitconfig
            - Version Control, od Linus Torvalds.
            - Máš i gitconfig (user, email, editor)
        [0] <<
            - Zpět
        "

        read addon

        if [ $addon == 1 ]; then
            sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh-autosuggestions
            
            clear
            progress
            echo -e "${grn}[+] Nainstalováno"
        elif [ $addon == 2 ]; then
            sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting /usr/share/zsh-syntax-highlighting

            clear
            progress
            echo -e "${grn}[+] Nainstalováno"
        elif [ $addon == 3 ]; then
            sudo $manager git

            rm .gitconfig
            cp $(pwd)/assets/.gitconfig ~/.gitconfig

            clear
            
            if [ -f /usr/bin/git ]; then
                echo -e "${grn}[+] Hezkyyyy, git nainstalován."
            else
                echo -e "${ylw}[~]?? Ne? Prej git nemáš. Ono se to samo nevybere"
            fi
        elif [ $addon == 0 ]; then

            command ./manager.sh

        else
            echo -e "${red}[-]Musíš něco vybrat víš."
        fi
        ;;
    
    00 | 0)
        exit
        ;;
    
    *)
        echo -e "${red}[-]Musíš si vybrat, ne vymýšlet."
        ;;

esac

sleep 1
clear
echo -e "${wht}]Užívej"