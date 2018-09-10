#!/bin/bash

sudo apt-get update
wget -O lazarus-project_1.6.4-0_amd64.deb https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.6.4/lazarus-project_1.6.4-0_amd64.deb/download
wget -O fpc-src_3.0.2-170225_amd64.deb https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.6.4/fpc-src_3.0.2-170225_amd64.deb/download
wget -O fpc_3.0.2-170225_amd64.deb https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.6.4/fpc_3.0.2-170225_amd64.deb/download
sudo dpkg -i lazarus-project_1.6.4-0_amd64.deb fpc-src_3.0.2-170225_amd64.deb fpc_3.0.2-170225_amd64.deb > /dev/null
sudo apt-get -f install --fix-missing
git clone https://github.com/graemeg/fptest
cd fptest
lazbuild fptest.lpk
