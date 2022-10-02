# My Dotfiles

My Dotfiles for i3 Fedora

#Modificar los DNF para volverlos mas rapidos
 
fastestmirror=1
#minrate=2M 
max_parallel_downloads=10

##Comando a usar comandos como ROOT:

dnf check-update;
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y;
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y;
dnf groupinstall "development tools";
dnf copr enable fuhrmann/i3-gaps -y;
dnf remove i3 -x perl*,dejavu-sans-mono-fonts,vte-profile,vte291,xcb-util-cursor,xcb-util-keysyms, xcb-util-wm, xdg-user-dirs,xfce4-terminal,xorg-x11-fonts-misc,xss-lock;
dnf install git libnotify notification-daemon breeze-cursor-theme neovim ranger zsh polkit-gnome dnfdragora dnfdragora-updater qt5ct mplayer lightdm-slick-greeter xfce4-power-manager redshift redshift-gtk lxappearance ranger bat lsd file-roller picom g++ clipit materia-gtk-theme xclip xarchiver zip unzip unrar conky gtk-murrine-engine gtk2-engines viewnior zsh zsh-autosuggestions zsh-syntax-highlighting xbacklight -y;
dnf update -y;

#Neovim NVchad

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

#ZSH oh-my-zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

My person Dotfiles

PowerLevel10k git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


