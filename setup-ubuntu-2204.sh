# Terraform
apt-get update
apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
apt update
apt-get install -y terraform

# Terragrunt
curl -fsSL -o /usr/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.42.4/terragrunt_linux_arm64 
chmod +x /usr/bin/terragrunt

# AZ Utils
curl -sL https://aka.ms/InstallAzureCLIDeb | bash
az aks install-cli

# Docker
apt-get remove docker docker-engine docker.io containerd runc
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-cache policy docker-ce
apt-get install -y docker-ce
sudo usermod -a -G docker azuser

# Visual Studio Code
mkdir -p /opt/microsoft/visualstudio

curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output /opt/microsoft/visualstudio/vscode_cli.tar.gz
cd /opt/microsoft/visualstudio
tar -xf vscode_cli.tar.gz
rm -f vscode_cli.tar.gz
ln -s /opt/microsoft/visualstudio/code /usr/bin/code
chmod -R 777 /opt/microsoft/visualstudio
