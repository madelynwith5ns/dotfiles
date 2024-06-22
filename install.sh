#!/usr/bin/env bash

echo hewwo

echo [INSTALL] .config
cp -r .config ~/
echo [INSTALL] .local
cp -r .local ~/
echo [INSTALL] .wezterm.lua
cp .wezterm.lua ~/
echo [INSTALL] .bashrc
cp .bashrc ~/
echo [INSTALL] profile.txt
cp profile.txt ~/

echo done! :3

