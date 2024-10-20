{ lib, pkgs, config, ... }:
with lib;
let
cfg = config.nc;
ncversion = "29";
in
{
  options.nc.enable = mkEnableOption "";

  config = lib.mkIf cfg.enable {
    fileSystems = {
      "/".device = "/dev/sda2";
      "/var/lib/nextcloud/5tb" = {
       label = "5tb";
        device = "/dev/disk/by-uuid/cbbd80d8-68e0-4288-afcd-b040c8865dd8";
        options = [ "uid=990" "gid=989" "dmask=007" "fmask=117" ];
      };

        #options = [ "uid=990" "gid=989" "dmask=007" "fmask=117" ];
        #label = "usb";
      #"/var/lib/nextcloud" = {
      #  device = "/dev/disk/by-uuid/ace3495c-8cff-4084-89b5-85c7b5789b3a";
      #};
    };


    services.nginx = {
      enable = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
    };
    services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
      forceSSL = true;
      enableACME = true;
    };
    security.acme = {
      acceptTerms = true;
      certs = {
        ${config.services.nextcloud.hostName}.email = "webmaster@kevindybeck.com";
      };
    };
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };

    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud${ncversion};
      maxUploadSize = "1G";

      #https = true;
      hostName = "localhost";
      #home = "";
      datadir = "/var/lib/nextcloud/5tb/newdir";
      #secretFile = "path"; #{"redis":{"password":"secret"}}

      appstoreEnable = true;
      phpOptions = {
        catch_workers_output = "yes";
        display_errors = "stderr";
        error_reporting = "E_ALL & ~E_DEPRECATED & ~E_STRICT";
        expose_php = "Off";
        "opcache.fast_shutdown" = "1";
        "opcache.interned_strings_buffer" = "16";
        "opcache.max_accelerated_files" = "10000";
        "opcache.memory_consumption" = "128";
        "opcache.revalidate_freq" = "1";
        "openssl.cafile" = "/etc/ssl/certs/ca-certificates.crt";
        #memory_limit = "512";
        output_buffering = "0";
        short_open_tag = "Off";
        instanceid = "ocvufs9qxu02";
        passwordsalt = "XDtrXybh8uBcOgIATWsJ7zV+h07pHt";
        secret = "Uf6KwmcYdtW1WkvlvNrOaoLdvhH8EDsPZWnG66/ALHU17fAO";
        logfile = "/var/log/nextcloud";
        dbtype = "mysql";
        dbtableprefix = "oc_";
        mysqlutf8mb' =" tru";
        installed = "ru";
        default_locale = "sv_SE";
        default_phone_region = "SE";
        twofactor_enforced = "false";
        #twofactor_enforced_groups = array ();
        "bulkupload.enabled" = "false";
        maintenance = "false";
        maintenance_window_start = "4";
        #app_install_overwrite = "array (0 => 'sharerenamer')";
        "htaccess.RewriteBase" = "/";
        mail_from_address = "kevin.dybeck";
        mail_smtpmode = "smtp";
        mail_sendmailmode = "smtp";
        mail_domain = "gmail.com";
        mail_smtphost = "smtp.gmail.com";
        mail_smtpport = "465";
        mail_smtpauth = "1";
        mail_smtpname = "kevin.dybeck@gmail.com";
        mail_smtppassword = "mvki bkbv cnzz nikx";
        mail_smtpdebug = "als";
        mail_smtpsecure = "ssl";
        theme = "";
      };
      settings = {
      # trusted_domains = ["moln.kevindybeck.com" "192.168.1.12"];
      # skeletondirectory "";
        loglevel = 2;
        log_type = "syslog"; #"errorlog", "file", "syslog", "systemd"
      };
    # configureRedis = ;
      database.createLocally = true;
      config = {
        #adminuser = "admin";
        adminpassFile = "/run/secrets/nc-admin-pw";# "string";
        dbuser = "nextcloud";
        dbtype = "mysql"; #"sqlite", "pgsql", "mysql"
        dbname = "nextcloud";
        #dbtableprefix = "oc_"; #"string"
        #dbpassFile = null; #"string"
      };
      autoUpdateApps = {
        enable = true;
        startAt = "05:00:00";
      };
      extraAppsEnable = true;
      extraApps ={
        inherit (pkgs.nextcloud${ncversion}Packages.apps)
        bookmarks
        calendar
        contacts
        cookbook
        cospend
        deck
        #files_texteditor
        #files_markdown
        mail
        music
        notes
        phonetrack
        tasks
        ;
        #sharerenamer = pkgs.fetchNextcloudApp {
        #  #name = "sharerenamer";
        #  sha256 = "74d46c22ed0f24a6fe00b2acf8e7f6a3a469ed00984ee035277c5ac9f605908e";
        #  license = "AGPL";
        #  url = "https://github.com/JonathanTreffler/sharerenamer/releases/download/v3.4.0/sharerenamer.tar.gz";
        #  #version = "3.4.0";
        #};
        #timemanager = pkgs.fetchNextcloudApp {
        #  #name = "timemanager";
        #  sha256 = "a4594a3bc8c6239c1ab7df7ceaedc517065e4ca6401fbd4fa553306e5cdffec5";
        #  license = "AGPL";
        #  url = "https://github.com/te-online/timemanager/archive/refs/tags/v0.3.16.tar.gz";
        #  #version = "0.3.16";
        #};
      };
    };
  };
}

