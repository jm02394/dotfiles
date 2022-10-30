{ lib, config, pkgs, ... }: 
{
  imports = [./i3.nix ./vscode.nix ./firefox.nix ./alacritty.nix ./zsh.nix ./fonts.nix ./tmux.nix];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;

    userName = "reallygoodaccount1";
    userEmail = "jonah@slackorama.com";
  };

  gtk.enable = true;
  gtk.gtk3.extraConfig = {"gtk-application-prefer-dark-theme" = "true";};
  
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
              "discord" "vscode" "spotify" "spotify-unwrapped"
            ];

  home.packages = with pkgs; [jdk jre discord spotify neofetch pavucontrol rustc cargo pipes flameshot alejandra rustfmt gcc libsecret wineWowPackages.stable neovim
                              (pkgs.python39.withPackages (ppkgs: [ppkgs.black]))];

  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
    /*OPENSSL_DIR = pkgs.openssl.dev;
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";*/
  };

  home.stateVersion = "22.05";
  home.username = "user";
  home.homeDirectory = "/home/user";
}
