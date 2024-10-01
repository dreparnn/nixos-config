{ lib, pkgs, config, ... } :
with lib;
let cfg = config.scripts;
in {
  options.scripts = {
    enable = mkEnableOption "DESCRIPTION";

    };

  config = lib.mkIf cfg.enable {
    environment.localBinInPath = true;
    environment.etc."bashrc".text =
    "\
    echo bishybashy
    ";
  };
}