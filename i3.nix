{ lib, pkgs, ... }: let
  mod = "Mod4";

  wallpaper =
    pkgs.nixos-artwork.wallpapers.simple-dark-gray-bottom.gnomeFilePath;
in {
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;

      keybindings = lib.mkOptionDefault {
        "${mod}+n" = "move workspace to output left";
        "${mod}+m" = "move workspace to output right";

        "Print" = "exec flameshot gui";

        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume 1 +5%";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume 1 -5%";
      };

      window.hideEdgeBorders = "both";

      workspaceAutoBackAndForth = true;

      terminal = "alacritty";

      startup = [
        {command = "xrandr --output DP-1 --off --output HDMI-1 --off --output DP-2 --mode 2560x1440 --pos 1920x0 --rotate normal --output HDMI-2 --mode 1920x1080 --pos 0x0 --rotate normal";}
        {command = "sh ${./mouseconfig.sh}"; always = true;}
      ];
    };
  };
}