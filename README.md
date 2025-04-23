# 🚀 Burp Suite Professional Auto Installer

Automated installer for Burp Suite Professional with all prerequisites and activation.

![Burp Suite Logo](https://portswigger.net/cms/images/47/2a/6179-brand-2018-master-1200x250.png)

## 📌 Features
- ✔️ Automatic installation of latest Burp Suite Professional
- ✔️ Auto-configuration of all Java requirements
- ✔️ System-wide shortcuts creation
- ✔️ Automatic professional version activation
- ✔️ Supports both Windows and Linux
- ✔️ Clean UI with colored status messages

## ⚙️ System Requirements
- Windows 10/11 or Linux OS
- 500MB+ storage space
- Internet connection

## 🛠️ Installation

### For Windows
1. Open PowerShell as Administrator
2. Copy and paste this command:

```powershell
iwr -useb "https://raw.githubusercontent.com/pl7x3cut0r/Burpsuite-Professional/main/install.ps1" | iex

For Linux

    Open Terminal

    Run these commands sequentially:

bash

sudo apt update
sudo apt install git -y
git clone https://github.com/pl7x3cut0r/Burpsuite-Professional.git
cd Burpsuite-Professional
chmod +x install.sh
sudo ./install.sh

🎯 Usage

After successful installation, launch Burp Suite Pro using:
Windows:

    Type burpsuite in PowerShell/CMD

    Or double-click Burp-Suite-Pro.vbs in installation folder

Linux:
bash

burpsuitepro

📂 Post-Installation File Structure

📦 Program Files/pl7x3cut0r
├── 📜 burpsuite_pro_v2025.jar      # Main Burp Suite file
├── 📜 loader.jar                   # Activation tool
├── 📜 burpsuite.bat                # Windows launcher
└── 📜 Burp-Suite-Pro.vbs           # Silent launcher

⚠️ Important Notes

    This project is for educational purposes only

    Consider purchasing an official license from PortSwigger to support developers

    Legal responsibility lies with the end user

📜 License

This project is licensed under the MIT License
👥 Contributors

    pl7x3cut0r

<p align="center"> <img src="https://img.shields.io/github/stars/pl7x3cut0r/Burpsuite-Professional?style=for-the-badge" alt="Stars"> <img src="https://img.shields.io/github/forks/pl7x3cut0r/Burpsuite-Professional?style=for-the-badge" alt="Forks"> <img src="https://img.shields.io/github/issues/pl7x3cut0r/Burpsuite-Professional?style=for-the-badge" alt="Issues"> </p> ```
