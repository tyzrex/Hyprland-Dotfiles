#!/bin/bash
if [ ! -f $HOME/.cache/tyzrex-welcome-autostart ] ;then
    echo "Autostart of tyzrex Welcome App enabled."
    if [ -f $HOME/dotfiles/apps/tyzrex_Welcome-x86_64.AppImage ] ;then
        echo "Starting tyzrex Welcome App ..."
        sleep 2
        $HOME/dotfiles/apps/tyzrex_Welcome-x86_64.AppImage
    else
        echo "tyzrex Welcome App not found."
    fi

else
    echo "Autostart of tyzrex Welcome App disabled."
fi