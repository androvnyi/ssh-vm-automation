# 🔐 SSH VM Automation — Simple Remote Linux Control

This project demonstrates how to automate the setup of secure SSH communication between two Linux virtual machines using just **3 Bash scripts**. It's ideal for beginners who want to understand remote connections, Linux permissions, and shell scripting.

## 📁 Project Structure

ssh-vm-automation/
│
├── install.sh # Creates a user, generates SSH key, and outputs the public key
├── monitor_resources.sh # Sends CPU/memory/disk stats from remote machine
└── backup_logs.sh # Sends logs from remote machine every 5 minutes


---

## 🚀 What It Does

- ✅ Automatically creates a new Linux user (e.g., `deployer`)
- ✅ Generates SSH key pair for secure access
- ✅ Outputs public key for easy copying
- ✅ Allows passwordless SSH login
- ✅ Sends system resource data every 5 minutes
- ✅ Sends logs periodically to the main machine

---

## 🧠 Prerequisites

- 2 virtual machines with Ubuntu and SSH installed
- Script execution permissions (`chmod +x`)
- Basic GitHub and shell knowledge

---

## ⚙️ Step-by-Step Usage

> 🧪 **Dev Machine = the one where you install SSH key**
> 🖥 **Prod Machine = the one from where you connect**

### 1. Clone the repo:

git clone https://github.com/androvnyi/ssh-vm-automation.git

### 2. On the prod machine, run:

sudo ./install.sh

This:

creates a deployer user,

generates /home/deployer/.ssh/id_rsa,

prints public key to terminal.


### 3. On the dev machine:
Create the same deployer user.

Paste the public key into:

/home/deployer/.ssh/authorized_keys


Set permissions:


chmod 700 /home/deployer/.ssh
chmod 600 /home/deployer/.ssh/authorized_keys
chown -R deployer:deployer /home/deployer/.ssh


Restart SSH if needed:


sudo systemctl restart ssh


✅ Verify It's Working


From the prod machine, try:

ssh deployer@<dev_machine_ip>

(There are several ways to view your machine's IP address:
- ip a
- ip addr show
- ifconfig

If all is correct — you’ll log in without a password.


✅ That’s it. Good luck! 🙂
