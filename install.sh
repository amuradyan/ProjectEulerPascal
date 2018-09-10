#!/bin/bash

sudo apt-get update
wget -O lazarus-project_1.8.4-0_amd64.deb https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.8.4/lazarus-project_1.8.4-0_amd64.deb/download
wget -O fpc_3.0.4-3_amd64.deb https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.8.4/fpc_3.0.4-3_amd64.deb/download
wget -O fpc-src_3.0.4-2_amd64.deb https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.8.4/fpc-src_3.0.4-2_amd64.deb/download
sudo dpkg -i lazarus-project_1.8.4-0_amd64.deb fpc_3.0.4-3_amd64.deb fpc-src_3.0.4-2_amd64.deb > /dev/null
sudo apt-get -f install --fix-missing