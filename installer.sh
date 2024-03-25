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
packages[Video]="ffmpeg vlc"
packages[Essentials]="xorg xorg-server base-devel"
packages[Development]="git vim gcc"
packages[Web]="firefox chromium"

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
