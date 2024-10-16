{ lib, pkgs, config, ... } :
with lib;
let
  cfg = config.syncthing;
in {
  options.syncthing = {
    enable = mkEnableOption "DESCRIPTION";

    };

  config = lib.mkIf cfg.enable {
    systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";
    services.syncthing = {
      enable = true;
      user = args.vars.user;
      dataDir = "/home/${args.vars.user}/syncthing";
      configDir = "/home/${args.vars.user}/.config/syncthing";
      #systemService = true; #databaseDir =
    };
    users.users.${args.vars.user}.extraGroups = [ "syncthing" ];
  };
}