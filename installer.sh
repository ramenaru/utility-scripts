# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

success() {
    echo -e "${GREEN}$1${NC}"
}

error() {
    echo -e "${RED}$1${NC}"
}

confirm() {
    while true; do
        read -p "$1 [y/n] " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Define package groups
declare -A packages
packages[Essentials]="xorg xorg-server base-devel htop zsh curl less openssh rsync avahi reflector"
packages[Desktop]="lxappearance trash-cli tree fzf jq unzip zip whois wget rlwrap neofetch ncdu socat pacaur"
packages[Development]="vim neovim base-devel code clang nodejs npm java-openjdk ruby rust cargo go docker python"
packages[Network]="firefox chromium nginx postgresql nmap thunderbird discord wireshark-qt youtube-dl tor"
packages[Media]="ffmpeg vlc bluez okular xournalapp libreoffice-fresh spotify audacity kdenlive mpv simplescreenrecorder gimp inkscape"
packages[Font]="ttf-liberation ttf-jetbrains-mono noto-fonts-cjk ttf-font-awesome noto-fonts-cjk"
packages[WindowManager]="rofi polybar alacritty picom nitrogen"

install_packages() {
    for key in "${!packages[@]}"
    do
        if confirm "Do you want to install $key packages?"; then
            sudo pacman -S --noconfirm ${packages[$key]}
            success "$key packages installed."
        else
            error "$key packages skipped."
        fi
    done
}

echo "Welcome to installer.sh | created by ramenaru"
echo "This script will guide you automatically installing some basic package groups."

if [[ $EUID -ne 0 ]]; then
   error "This script must be run as root"
   exit 1
fi

install_packages

success "Installation complete! Enjoy your customized Arch Linux setup. | github.com/ramenaru"
