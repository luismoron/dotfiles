# i3dotfilesfedora
I3 dotfiles to fedora desktop

#nano /etc/dnf/dnf.conf

#fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True

sudo dnf install dnf5 -y;
sudo dnf groupinstall "development tools" -y;

My dotfiles and config files to fedoraI3

# Links to User dotfiles
rm -rf /home/$USER/.config/i3  
ln -s /home/$USER/Templates/i3dotfilesfedora/zshrc /home/$USER/.zshrc
ln -s /home/$USER/Templates/dotfiles/i3 /home/$USER/.i3  
ln -s /home/$USER/Templates/dotfiles/rofi /home/$USER/.config  
ln -s /home/$USER/Templates/dotfiles/picom /home/$USER/.config 
ln -s /home/$USER/Templates/dotfiles/dunst /home/$USER/.config 
ln -s /home/$USER/Templates/dotfiles/.zprofile /home/$USER 
ln -s /home/$USER/Templates/dotfiles/.config/systemd /home/$USER/.config 
ln -s /home/$USER/Templates/dotfiles/.screenlayout/ /home/$USER 
ln -s /home/$USER/Templates/dotfiles/ranger /home/$USER/.config
ln -s /home/$USER/Templates/dotfiles/usr/share/fonts /home/$USER/.local/share/