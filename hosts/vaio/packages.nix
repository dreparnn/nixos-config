{pkgs, ...}:{
  programs = {
    bash.vteIntegration = true;
    firefox.enable = true;
    thunar = { enable = true;
      plugins = with pkgs.xfce; [ thunar-volman thunar-archive-plugin thunar-media-tags-plugin ];
    };
    vim = {
      #enable = true;
      defaultEditor = true;
    };
    xfconf.enable = true;
  };
  environment.systemPackages = with pkgs; [
    surf /* browser */
    brightnessctl
    efibootmgr
    feh
    qimgv
    nomacs
    ffmpegthumbnailer
    fswebcam
    git
    gh
    gitg
    gscreenshot
    keepassxc
    git-credential-keepassxc
    cryptsetup
    mpv
    mullvad-vpn /* duh */
    networkmanagerapplet
    nextcloud-client
    sops /* secret manager */
    spotify-player mlterm
    #taskwarrior3 /* task manager */ ptask /* taskwarrior plugin */
    xorg.xev lsof showmethekey trashy termimage xprintidle xdotool place-cursor-at mktemp xclip
];
}
