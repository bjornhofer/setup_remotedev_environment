read -p "Start Visual Studio once and register, stop with CTRL+C afterwards" -n1 -s
code tunnel

echo "Installing Service"
code tunnel service install

sudo loginctl enable-linger $USER

read -p "Check the state of the service" -n1 -s
systemctl --user status code-tunnel


echo "Service installed"
