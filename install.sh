#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m'
print_status() {
    local color=$1
    local message=$2
    local prefix=""
    case $color in
        "RED") prefix="[-]" ;;
        "GREEN") prefix="[+]" ;;
        "YELLOW") prefix="[!]" ;;
        "CYAN") prefix="[*]" ;;
        *) prefix="[ ]" ;;
    esac
    echo -e "${!color}$prefix $message${NC}"
}
print_status "CYAN" "Setting up the required components, please wait..."
sudo apt update
sudo apt install git axel openjdk-21-jre openjdk-22-jre openjdk-23-jre -y
if [ $? -eq 0 ]; then
    print_status "GREEN" "Dependencies installed successfully"
else
    print_status "RED" "Failed to install dependencies"
    exit 1
fi
print_status "CYAN" "Creating custom directories..."
sudo mkdir -p /pl7x3cut0r/Burpsuite-Professional
sudo chown -R $USER:$USER /pl7x3cut0r
if [ -d "/pl7x3cut0r/Burpsuite-Professional" ]; then
    cd /pl7x3cut0r/Burpsuite-Professional || exit
    print_status "GREEN" "Custom directory created successfully"
else
    print_status "RED" "Failed to create custom directory"
    exit 1
fi
print_status "CYAN" "Downloading Burpsuite Professional Latest..."
version=2025
url="https://portswigger-cdn.net/burp/releases/download?product=pro&type=Jar"
axel "$url" -o "burpsuite_pro_v$version.jar"
if [ -f "burpsuite_pro_v$version.jar" ]; then
    print_status "GREEN" "Burpsuite Professional downloaded successfully"
else
    print_status "RED" "Failed to download Burpsuite Professional"
    exit 1
fi
print_status "CYAN" "Downloading loader.jar..."
git clone https://github.com/pl7x3cut0r/Burpsuite-Professional.git /tmp/burp-temp
cp /tmp/burp-temp/loader.jar .
rm -rf /tmp/burp-temp
if [ -f "loader.jar" ]; then
    print_status "GREEN" "Key loader downloaded successfully"
else
    print_status "RED" "Failed to download key loader"
    exit 1
fi
print_status "CYAN" "Starting Key loader.jar..."
(java -jar loader.jar) &
print_status "GREEN" "Key generator started in background"
print_status "CYAN" "Creating launcher script..."
cat > BurpSuitePro <<EOF
#!/bin/bash
java --add-opens=java.desktop/javax.swing=ALL-UNNAMED \
--add-opens=java.base/java.lang=ALL-UNNAMED \
--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED \
--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED \
--add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED \
-javaagent:/pl7x3cut0r/Burpsuite-Professional/loader.jar -noverify -jar /pl7x3cut0r/Burpsuite-Professional/burpsuite_pro_v$version.jar &
EOF
chmod +x BurpSuitePro
sudo cp BurpSuitePro /usr/local/bin/BurpSuitePro
if [ -f "/usr/local/bin/BurpSuitePro" ]; then
    print_status "GREEN" "Launcher script created and installed to /usr/local/bin"
else
    print_status "RED" "Failed to create launcher script"
    exit 1
fi
print_status "CYAN" "Starting Burpsuite Professional..."
(./BurpSuitePro) &
print_status "GREEN" "Burpsuite Professional started in background"
print_status "GREEN" "Installation completed successfully!"
print_status "GREEN" "You can now run Burpsuite Professional by typing 'BurpSuitePro' in any terminal"
print_status "GREEN" "Enjoy the benefits of Burp Suite Pro For Free "
print_status "GREEN" "Don't forget to follow me on my personal accounts — pl7x3cut0r welcomes you"
