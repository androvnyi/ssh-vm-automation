#!/bin/bash
set -e

echo "[+] Creating deployer user..."
useradd -m -s /bin/bash deployer || echo "User exists"
echo "deployer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

echo "[+] Installing packages..."
apt update && apt install -y curl vim net-tools openssh-server

echo "[+] Creating folder structure..."
mkdir -p /home/deployer/scripts
mkdir -p /home/deployer/backups
chown -R deployer:deployer /home/deployer

echo "[+] Copying scripts..."
cp monitor_resources.sh /home/deployer/scripts/
cp backup_logs.sh /home/deployer/scripts/
chmod +x /home/deployer/scripts/*.sh
chown deployer:deployer /home/deployer/scripts/*.sh

echo "[+] Setting up cron..."
(crontab -l 2>/dev/null; echo "*/5 * * * * /home/deployer/scripts/monitor_resources.sh") | crontab -
(crontab -l 2>/dev/null; echo "59 23 * * * /home/deployer/scripts/backup_logs.sh") | crontab -

echo "[+] Generating SSH key for deployer..."
sudo -u deployer ssh-keygen -t rsa -b 4096 -N "" -f /home/deployer/.ssh/id_rsa

echo "[+] SSH Public key:"
cat /home/deployer/.ssh/id_rsa.pub

echo "[+] Done."

