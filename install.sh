#!/bin/bash

sudo apt-get update
echo | gcc -v
echo | ld -v

wget -O lazarus-project_1.8.4-0_amd64.deb https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.8.4/lazarus-project_1.8.4-0_amd64.deb/download
# wget -O fpc_3.0.4-3_amd64.deb https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.8.4/fpc_3.0.4-3_amd64.deb/download
wget -O fpc-3.0.4.x86_64-linux.tar https://sourceforge.net/projects/freepascal/files/Linux/3.0.4/fpc-3.0.4.x86_64-linux.tar/download
# wget -O fpc-src_3.0.4-2_amd64.deb https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.8.4/fpc-src_3.0.4-2_amd64.deb/download
tar -xvf fpc-3.0.4.x86_64-linux.tar
pushd fpc-3.0.4.x86_64-linux

echo 'echo /usr' > answers.sh
echo 'echo n' >> answers.sh
echo 'echo n' >> answers.sh
echo 'echo n' >> answers.sh

chmod 777 answers.sh

./answers.sh | sudo ./install.sh

popd

sudo dpkg -i lazarus-project_1.8.4-0_amd64.deb > /dev/null
git clone https://github.com/graemeg/fptest
cd fptest
lazbuild fptest.lpk
