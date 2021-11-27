#!/usr/bin/env bash

which git || sudo apt install -y git

git clone https://github.com/touilleio/alephium-miner-setup.git
cd alephium-miner-setup

cat <<EOF | sudo tee /etc/motd
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMWWWMMMMMMNOkxdoxXMMMMMMMMMMMMMM
MMMMMMMMMMMMMMNOoc:;,:OWMMMM0l::c:lKMMMMMMMMMMMMMM
MMMMMMMMMMMMMMNo.     'OWMMM0l::c:lKMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMNl.     ,0WMM0l:cc:lKMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMXc      ;xKM0l::::oKMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMK:      .:KKxddxk0NMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMK;       cKWWWMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMM0,      .lXMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMWO'      .oNMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMWk.      .dNMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMWX0OxdxKx.      .dWMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMO,.   .xWd.      .xWMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMk.    .xMNo'.     'kWMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMk.    .xMMNKo.     'OWMMMMMMMMMMMMMM
MMMMMMMMMMMMMMk.    .xMMMMXl.  ...oNMMMMMMMMMMMMMM
MMMMMMMMMMMMMMk.   .,OMMMMMNOxkOKXNMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMXxdxO0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

Welcome to this alephium miner. All the required files are in $HOME/alephium-miner-setup.
Everything automatically start at server boot / reboot.

# Get the logs of the miner
cd $HOME/alephium-miner-setup; docker-compose logs miner

Enjoy mining Alephium!

EOF

envsubst < alephium.service | sudo tee /etc/systemd/system/alephium.service
sudo systemctl daemon-reload
sudo systemctl enable alephium

./install-ubuntu2004.sh
