alias ls='ls -Ah'
alias lsl='ls -lAh'

alias noti='sleep 5; echo'
alias alert='/home/korv/scripts/alert'

alias nixtest='sudo nixos-rebuild test'
alias nixeditconfig='sudo vim /etc/nixos/configuration.nix && nixswitch && alert'
alias nixpackages='sudo vim /etc/nixos/packages.nix && nixswitch && alert'

alias nixfindpackage=~/scripts/nix/find.sh
alias nixfastfind=~/scripts/nix/find.sh
alias nfind=~/scripts/nix/find.sh

alias nixswitch='sudo nixos-rebuild switch'
alias nswitch='sudo nixos-rebuild switch'

alias grepinverted="grep -v"
alias grepinvertedwithpipe="| grep -v"
alias gnomeextfind=~/scripts/nix/gnomefindext.sh
alias nfindgnomeext=~/scripts/nix/gnomefindext.sh

alias ..bashrc='. ~/.bashrc'

alias nixupdatesearch='~/scripts/nix/updateStore.sh'

alias twidth='dconf write /com/gexperts/Tilix/quake-width-percent'
alias theight='dconf write /com/gexperts/Tilix/quake-height-percent'
alias tautohide='/home/korv/scripts/tilixautohide'

alias neofetch=fastfetch
alias lock='xdg-screensaver lock'
alias chawan='cha'
alias pixelIp=192.168.1.4
alias s20Ip=192.168.1.5
alias 192.168.1.=192.168.1.
alias blurtoggle=~/scripts/blurwindows
alias logout='gnome-session-quit --logout'
alias cl='clear'
alias mv='mv -v'
alias rm='trash'
alias poweroff='gnome-session-quit --no-prompt --power-off'
alias shutdown='gnome-session-quit --no-prompt --power-off'

alias sshmoln='ssh moln'
alias torrent='transmission-remote --add'
alias potsify='spotify_player'
alias spotifyplayer='spotify_player'
alias reboot='gnome-session-quit --no-prompt --reboot'
alias ff=fastfetch