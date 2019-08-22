#!/bin/bash

# The MIT License (MIT)
#
# Copyright (C) 2019-present, Seingshin Lee <seingshinlee@gmail.com>
# All rights reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
# associated documentation files (the “Software”), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial
# portions of the Software.
#
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
# CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# Usage:
#     shell> sudo bash -c "$(wget -qO- TODO)"
# OS restrictions:
#     Only Ubuntu Linux 19.04, 18.04 LTS or 16.04 LTS can be supported!

ubuntu_version=$(lsb_release --release | cut -f 2)
ubuntu_version_prefix=$(echo ${ubuntu_version} | cut -c "1,2")
ubuntu_version_echo="> ${Okay} Your Ubuntu Linux version is ${ubuntu_version}, it's ok and continue... Done."
Jigsaw-Code_pre_url="https://raw.githubusercontent.com/Jigsaw-Code/outline-releases/master"

# Initialze ANSI colors
initializeANSI() {
    prefix="\033"
    red_foreground="${prefix}[31m"
    green_foreground="${prefix}[32m"
    yellow_foreground="${prefix}[33m"
    reset="${prefix}[0m"
}

initializeANSI

Okay="${green_foreground}[Okay]${reset}"
Error="${red_foreground}[Error]${reset}"
Notice="${yellow_foreground}[Notice]${reset}"

read_echo_okay=$(echo -e "${Okay}")
read_echo_notice=$(echo -e "${Notice}")
read_echo_error=$(echo -e "${Error}")

# Check if Docker CE is installed or not
check_docker_ce_is_installed() {
    if [ -f "/usr/bin/docker" ]; then
        echo -e "> ${Okay} Docker CE service is installed... Done."
    else
        echo -e "> ${Error} Docker CE service isn't installed... Done."
    fi
}

# Checkt Docker CE service status
check_docker_ce_service_status() {
    if [[ "$(systemctl status docker.service --no-pager | awk '/Active/ {print $2,$3}')" == "active (running)" ]]; then
        sudo systemctl status docker.service --no-pager
        echo "> ${Okay} Well! Docker CE service is enable... Done."
    else
        echo -e "> ${Notice} Sorry! Docker CE service is disable... Done. (+)"
        echo -e "> ${Okay} Continuing... Done."
        sudo systemctl enable docker.service
        echo -e "> ${Okay} Docker CE service has been set to boot from boot... Done."
        sudo systemctl start docker.service
        echo -e "> ${Okay} Docker CE service is starting... Done."
        sleep 2s
        check_docker_ce_service_status
    fi
}

# Add an official Docker CE apt-repository software source
add_docker_ce_apt_repository() {
    case "${ubuntu_version}" in
        19.04)
            sudo add-apt-repository \
            "deb [arch=${phy_arch}] https://download.docker.com/linux/ubuntu \
            $(lsb_release -cs) \
            stable edge test"
            ;;
        18.10|18.04|16.04)
            sudo add-apt-repository \
            "deb [arch=${phy_arch}] https://download.docker.com/linux/ubuntu \
            $(lsb_release -cs) \
            stable"
            ;;
        *)
            ;;
    esac

    apt-cache policy docker-ce

    if [[ $(apt-cache policy docker-ce | sed -n '3p' | awk -F "[~-]" '{print $4}') != "ubuntu" ]]; then
        echo -e "> ${Okay} Continuing... Done."
    else
        echo -e "> ${Notice} Re-add the official apt-repository software source of Docker CE... Done."
        sleep 0.5s
        add_docker_ce_apt_repository
    fi
    echo -e "> ${Okay} Add an apt-repository software source successfully... Done."

    sudo apt update -y
}

# Remove all Docker CE service

# Install Docker CE service

# Update Docker CE service

# Check Linux operating system release

# Check CPU physical architecture

# Check number of Bit

# Check memory total of operating system

# Check SSH server alive status

# Upgrade Ubuntu version

# Check Ubuntu version

# Check if Outline Server is installed or not

# Install or update Outline Server service of Ubuntu Server by Outline official One-click shell script

# Remove all Outline Server service

# Check if Outline Manager Client and Outline Client are installed or not

# Check Outline Manager Client and Outline Client status

# Install Outline Manager Client

# Install Outline Client

# Update Outline Manager Client

# Update Outline Client

# Remove Outline Manager Client

# Remove Outline Client

# Topic information

# Common options for Ubuntu Linux Desktop and Server

# Options only support Ubuntu Desktop

# Options only support Ubuntu Server

# If continue to use start_menu function or not

# Check all prerequisites

# One option for the 7th option in main case...in process control statement

# One option for the 11th or the 12th option in main case...in process control statement

# One option for the 26th option in main case...in process control statement

# One option for the 27th option in main case...in process control statement

# One option for the common of the 26th and the 27th options in main case...in process control statement

# Exit Information to all

# Start entrance menu
