#!/bin/bash
sudo snap install --classic code
# https://stackoverflow.com/questions/68070807/terminal-will-not-open-in-visual-studio-code

# echo '"terminal.integrated.profiles.linux": {"bash": {"path": "/bin/bash"}} }', >> ~/.config/Code/User/settings.json

# 1) внести изменения в ~/.config/Code/User/settings.json

# 2) add snippets
# ~/.config/Code/User/snippets/shellscript.json
cp -r ./other/init/soft/code/snippets ~/.config/Code/User/

# 3) add extensions
code --install-extension artagnon.vstwig --force
code --install-extension EQuimper.react-native-react-redux --force
code --install-extension fabianlauer.vs-code-xml-format --force
code --install-extension infeng.vscode-react-typescript --force
code --install-extension mblode.twig-language-2 --force
code --install-extension redhat.vscode-xml --force
code --install-extension whatwedo.twig --force

clear
code --list-extensions
