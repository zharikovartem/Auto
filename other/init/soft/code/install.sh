#!/bin/bash
sudo snap install --classic code
# https://stackoverflow.com/questions/68070807/terminal-will-not-open-in-visual-studio-code

echo '"terminal.integrated.profiles.linux": {"bash": {"path": "/bin/bash"}} }', >> ~/.config/Code/User/settings.json