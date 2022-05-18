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

managers=( "pacman" "apt" "dnf" "yay" )

for i in "${managers[@]}"; do
    if [ -f "/usr/bin/"$i ]; then
        selected=$i
    fi
done

if [ $selected == "pacman" ]; then
    manager="pacman -S"
fi
    

manager=$selected" install"



echo -e "${grn}[+] Vyber z možností:  
    ${red}[${grn}01${red}] ${org}Nainstalovat ZSH
    ${red}[${grn}02${red}] ${org}Nakopírovat .zshrc
    ${red}[${grn}03${red}] ${org}Nainstalovat addons/
    ${red}[${grn}04${red}] ${org}Nastavení Neofetch/
    ${red}[${grn}05${red}] ${org}Nainstalovat LY/
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
        echo -e "${reset}Libí? (${grn}A${reset}/${red}N${reset})"

        read moznost
        clear

        moznost=${moznost^^}

        if [ $moznost == "A" ]; then
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
            echo -e "${grn}[+] Nainstalováno"
            sleep 3
            command ./manager.sh
        elif [ $addon == 2 ]; then
            sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting /usr/share/zsh-syntax-highlighting

            clear
            echo -e "${grn}[+] Nainstalováno"
            sleep 3
            command ./manager.sh
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
            sleep 3
            command ./manager.sh
        elif [ $addon == 0 ]; then

            sleep 1
            command ./manager.sh

        else
            echo -e "${red}[-]Musíš něco vybrat víš."
            sleep 3
            command ./manager.sh
        fi
        ;;
    
    04 | 4)
        clear
        
        echo -e "${grn}[+] Chceš nainstalovat neofetch?(${grn}A${wht}/${red}N${reset}): "
        read option

        option=${option^^}

        if [ $option == "A" ]; then
            sudo $manager neofetch

            sleep 2
            clear
        fi

        clear
        echo -e "${grn}[+] Chceš mít nový design?(${grn}A${wht}/${red}N${reset}):"
        read option

        option=${option^^}

        if [ $option == "A" ]; then
            clear

            echo -e " 
            ┌───────── Hardware Information ─────────┐
    LOGO        HOST
                CPU
                GPU
                RAM
            ├───────── Software Information ─────────┤
                LINUX
                KERNEL
                WM
                SHELL
            └───────────────────────────────────────┘
                    ${red}⬤  ${grn}⬤  ${org}⬤  ${blue}⬤  ${pur}⬤  ${reset}⬤  ⬤  ⬤  ⬤ 
            
            "

            echo -e "${reset}Libí? (${grn}A${reset}/${red}N${reset}):"
            read option
            option=${option^^}

            if [ $option == "A" ]; then
                if [ -f ~/.config/neofetch/neofetch.conf ]; then 
                    rm ~/.config/neofetch/neofetch.conf
                fi

                cp $(pwd)/assets/neofetch.conf ~/.config/neofetch/config.conf
            fi
        fi

        clear
        echo -e "${grn}[+] Chceš mít alias nf?(${grn}A${wht}/${red}N${reset}):"
        read option

        option=${option^^}

        if [ $option == "A" ]; then
            sudo cp /bin/neofetch /bin/nf
            progress
            echo -e "${grn}[+] Provedeno"
        fi

        sleep 1
        command ./manager.sh

        ;;

    05 | 5)

        clear
        echo -e "${grn}[+] Ly je Window Manager, který vypadá jak pro nerdy.
        ${reset}- Toto je pouze automatická instalace (https://github.com/fairyglade/ly)
        ${reset}- https://user-images.githubusercontent.com/5473047/88958888-65efbf80-d2a1-11ea-8ae5-3f263bce9cce.png
        "

        echo -e "${org}[~] Ok, chceš to teda?"

        read option
        option=${option^^}

        if [ $option == "A" ]; then
            cd ~/
            git clone --recurse-submodules https://github.com/nullgemm/ly.git
            make
            sudo make install
            sudo rm /etc/systemd/system/display-manager.service
            sudo systemctl enable ly.service
            sudo systemctl disable getty@tty2.service
            echo -e "${grn}[+] Ok, nainstalováno. Chceš otevřít konfiguraci?(VSCODE):"

            rm ~/ly/

            option=${option^^}
            if [ $option == "A" ]; then
                code /etc/ly/config.ini
            fi
        fi
        
        sleep 1
        command ./manager.sh
        ;;
    
    00 | 0)
        exit
        ;;
    
    *)
        echo -e "${red}[-] Musíš si vybrat, ne vymýšlet."
        sleep 1
        ;;

esac

clear
#echo -e "${wht}Užívej"