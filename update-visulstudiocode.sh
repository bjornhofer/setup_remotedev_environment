# Get latest version
curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output /tmp/vscode_cli.tar.gz
cd /tmp
tar -xf vscode_cli.tar.gz
rm -f vscode_cli.tar.gz

# Stop service
systemctl --user stop code-tunnel

# Update service
rm -f /opt/microsoft/visualstudio/code
mv /tmp/code /opt/microsoft/visualstudio/code

# Start service
systemctl --user start code-tunnel
