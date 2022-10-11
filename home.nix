{ lib, config, pkgs, ... }: 
{
  imports = [./i3.nix ./vscode.nix ./firefox.nix ./alacritty.nix ./zsh.nix];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;

    userName = "reallygoodaccount1";
    userEmail = "jonah@slackorama.com";
  };

  gtk.enable = true;
  gtk.gtk3.extraConfig = {"gtk-application-prefer-dark-theme" = "true";};

  programs.tmux = {
    enable = true;
    shell = config.home.sessionVariables.SHELL;
  };
  
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
             "discord" "vscode" "spotify" "spotify-unwrapped" "VCV-Rack"
           ];

  home.packages = with pkgs; [discord spotify neofetch pavucontrol rustc cargo pipes flameshot vcv-rack alejandra
                              (pkgs.python39.withPackages (ppkgs: [ppkgs.black]))];

  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  home.stateVersion = "22.05";
  home.username = "user";
  home.homeDirectory = "/home/user";
}
