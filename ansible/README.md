# Ansible for Sausage Store

## 🛠 Prerequisites

Before running the playbook, ensure the following steps are completed:

1. **Create a Virtual Machine (VM)**
   - The VM should have an `ubuntu` user.
   - Load your **SSH public key** onto the VM (e.g., using **Yandex Cloud** or another provider).

2. **Update Inventory File (`inventory.yaml`)**
   - Set your VM's **public IP address**:
     ```yaml
     ansible_host: <your_server_ip>
     ```
   - Provide the **path to your SSH private key**:
     ```yaml
     ansible_ssh_private_key_file: ~/.ssh/<your_ssh_private_key>
     ```

3. **Install Ansible**
   - If Ansible is not installed, install it using:
     ```bash
     python3 -m pip install --user ansible
     ```

4. **For WSL Users** (Windows Subsystem for Linux)
   - If your Ansible configuration files are **mounted to WSL**, set the `ANSIBLE_CONFIG` environment variable:
     ```bash
     export ANSIBLE_CONFIG=/mnt/c/users/<your_path_to_ansible.cfg_file>
     ```

---

## 🚀 Running the Playbook

Run the following command to execute the playbook:
```bash
ansible-playbook playbook.yaml --ask-vault-pass
```
🔑 **Vault Password:** `1234`

---

## 📂 Project Structure
```plaintext
├── README.md              # Documentation
├── ansible.cfg            # Ansible configuration file
├── roles/                 # Ansible roles
│   ├── backend/           # Backend setup
│   └── frontend/          # Frontend setup
├── group_vars/            # Group variables for inventory
│   └──all.yaml            # Global variables
├── inventory.yaml         # Hosts setup
└── playbook.yaml          # Main Ansible playbook
```

---

## 🎯 What This Playbook Does
This Ansible playbook sets up a **backend and frontend service** on a single server:

### Backend Tasks
✅ Install `openjdk-16-jdk`  
✅ Create a system user for the backend  
✅ Download the backend JAR from GitLab  
✅ Configure a systemd service for the backend  
✅ Start and enable the backend service  

### Frontend Tasks
✅ Install `nodejs`, `npm`, and `nginx`  
✅ Create a system user for the frontend  
✅ Configure `/var/www-data` directory  
✅ Download and extract the frontend from GitLab  
✅ Deploy an `nginx.conf` file  
✅ Restart NGINX  

---

## 🐞 Troubleshooting
### Check If Backend Is Running
```bash
sudo systemctl status backend
```
If it’s not running, check logs:
```bash
journalctl -u backend --no-pager --lines=50
```

### Check If NGINX Is Running
```bash
sudo systemctl status nginx
```
Test frontend accessibility:
```bash
curl -I http://localhost
```
