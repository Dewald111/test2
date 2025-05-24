#!/bin/bash

# ========== Colors ==========
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)

# ========== Helper Function ==========
function pause() {
  read -rp $"\n${YELLOW}Press [Enter] to continue...${RESET}" key
}

# ========== Categories ==========
function main_menu() {
  clear
  echo "${CYAN}Proxmox Lab Launcher${RESET}"
  echo "-------------------------"
  echo "1) 🏠 Home Automation"
  echo "2) 🧠 Networking & Security"
  echo "3) 📦 Self-Hosting"
  echo "4) 🎮 Entertainment"
  echo "5) 🧪 Testing & Pentesting"
  echo "6) 📊 Dashboards & Tools"
  echo "7) ⚙️ Utilities"
  echo "0) Exit"
  echo "-------------------------"
  read -rp "Choose a category: " choice
  case $choice in
    1) home_automation_menu;;
    2) networking_menu;;
    3) self_hosting_menu;;
    4) entertainment_menu;;
    5) testing_menu;;
    6) dashboards_menu;;
    7) utilities_menu;;
    0) exit;;
    *) echo "${RED}Invalid choice.${RESET}"; pause; main_menu;;
  esac
}

# ========== Submenus ==========
function home_automation_menu() {
  clear
  echo "${CYAN}🏠 Home Automation${RESET}"
  echo "1) Home Assistant"
  echo "2) Node-RED"
  echo "3) ESPHome"
  echo "0) Back"
  read -rp "Choose an option: " choice
  case $choice in
    1) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/homeassistant.sh);;
    2) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/node-red.sh);;
    3) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/esphome.sh);;
    0) main_menu;;
    *) echo "${RED}Invalid choice.${RESET}"; pause; home_automation_menu;;
  esac
  pause; home_automation_menu
}

function networking_menu() {
  clear
  echo "${CYAN}🧠 Networking & Security${RESET}"
  echo "1) OpenWRT"
  echo "2) OPNsense"
  echo "3) AdGuard Home"
  echo "4) Pi-hole"
  echo "0) Back"
  read -rp "Choose an option: " choice
  case $choice in
    1) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/vm/openwrt.sh);;
    2) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/vm/opnsense.sh);;
    3) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/adguardhome.sh);;
    4) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/pihole.sh);;
    0) main_menu;;
    *) echo "${RED}Invalid choice.${RESET}"; pause; networking_menu;;
  esac
  pause; networking_menu
}

function self_hosting_menu() {
  clear
  echo "${CYAN}📦 Self-Hosting${RESET}"
  echo "1) Docker CE"
  echo "2) Portainer"
  echo "3) Nginx Proxy Manager"
  echo "4) Nextcloud"
  echo "0) Back"
  read -rp "Choose an option: " choice
  case $choice in
    1) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/docker-ce.sh);;
    2) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/portainer.sh);;
    3) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/nginxproxymanager.sh);;
    4) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/nextcloud.sh);;
    0) main_menu;;
    *) echo "${RED}Invalid choice.${RESET}"; pause; self_hosting_menu;;
  esac
  pause; self_hosting_menu
}

function entertainment_menu() {
  clear
  echo "${CYAN}🎮 Entertainment${RESET}"
  echo "1) Jellyfin"
  echo "2) Plex"
  echo "3) Kavita"
  echo "4) Audiobookshelf"
  echo "0) Back"
  read -rp "Choose an option: " choice
  case $choice in
    1) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/jellyfin.sh);;
    2) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/plex.sh);;
    3) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/kavita.sh);;
    4) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/audiobookshelf.sh);;
    0) main_menu;;
    *) echo "${RED}Invalid choice.${RESET}"; pause; entertainment_menu;;
  esac
  pause; entertainment_menu
}

function testing_menu() {
  clear
  echo "${CYAN}🧪 Testing & Pentesting${RESET}"
  echo "1) Kali Linux"
  echo "2) Kasm"
  echo "3) TheHacker (Custom)"
  echo "4) Windows 10"
  echo "0) Back"
  read -rp "Choose an option: " choice
  case $choice in
    1) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/vm/kali.sh);;
    2) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/kasm.sh);;
    3) echo "${YELLOW}Launching your custom TheHacker VM...${RESET}";;
    4) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/vm/windows10.sh);;
    0) main_menu;;
    *) echo "${RED}Invalid choice.${RESET}"; pause; testing_menu;;
  esac
  pause; testing_menu
}

function dashboards_menu() {
  clear
  echo "${CYAN}📊 Dashboards & Tools${RESET}"
  echo "1) Uptime Kuma"
  echo "2) Netdata"
  echo "3) Grafana Stack"
  echo "0) Back"
  read -rp "Choose an option: " choice
  case $choice in
    1) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/uptime-kuma.sh);;
    2) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/lxc/netdata.sh);;
    3) echo "${YELLOW}Please install Grafana and Prometheus manually or create a helper script entry.${RESET}";;
    0) main_menu;;
    *) echo "${RED}Invalid choice.${RESET}"; pause; dashboards_menu;;
  esac
  pause; dashboards_menu
}

function utilities_menu() {
  clear
  echo "${CYAN}⚙️ Utilities${RESET}"
  echo "1) Proxmox Helper Scripts Menu"
  echo "2) Update Proxmox"
  echo "3) Reboot Node"
  echo "0) Back"
  read -rp "Choose an option: " choice
  case $choice in
    1) bash <(curl -s https://community-scripts.github.io/ProxmoxVE/helper/menu.sh);;
    2) apt update && apt full-upgrade -y;;
    3) reboot;;
    0) main_menu;;
    *) echo "${RED}Invalid choice.${RESET}"; pause; utilities_menu;;
  esac
  pause; utilities_menu
}

# ========== Start Script ==========
main_menu
