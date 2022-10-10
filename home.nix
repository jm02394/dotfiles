{ lib, pkgs, ... }: 
{
  imports = [./i3.nix ./vscode.nix ./firefox.nix ./alacritty.nix];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;

    userName = "reallygoodaccount1";
    userEmail = "jonah@slackorama.com";
  };
  
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
             "discord" "vscode" "spotify" "spotify-unwrapped"
           ];

  home.packages = with pkgs; [discord spotify neofetch pavucontrol];

  home.stateVersion = "22.05";
  home.username = "user";
  home.homeDirectory = "/home/user";
}
