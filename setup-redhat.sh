# Azure CLI
rpm --import https://packages.microsoft.com/keys/microsoft.asc
dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm
dnf install -y azure-cli

# Terraform
yum install -y yum-utils 
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo 
yum -y install terraform 

# Terragrunt
curl -fsSL -o /usr/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.42.4/terragrunt_linux_arm64 
chmod +x /usr/bin/terragrunt

# GO
curl -fsSL -o /tmp/go.tar.gz https://go.dev/dl/go1.19.4.linux-amd64.tar.gz
tar -C /usr/local -xzf /tmp/go.tar.gz
# Devtools for GO
dnf install -y gcc
# Finalize GO setup
if grep -q "/usr/local/go/bin" ~/.profile;
then
    echo "Go already properly setup"
else
    echo "export PATH=/usr/local/go/bin:$PATH" >> ~/.profile
    echo "Go properly setup"
fi

# VSCode Extensions
~/.vscode-server/bin/*/bin/code-server --install-extension ms-azuretools.vscode-azureterraform
~/.vscode-server/bin/*/bin/code-server --install-extension eamodio.gitlens
~/.vscode-server/bin/*/bin/code-server --install-extension hashicorp.terraform
~/.vscode-server/bin/*/bin/code-server --install-extension golang.go
