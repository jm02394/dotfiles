{ lib, pkgs, config, ... }: let
  mod = "Mod4";

  wallpaper =
    pkgs.nixos-artwork.wallpapers.simple-dark-gray-bottom.gnomeFilePath;
in {
  #services.picom.enable = true;

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
        {
          always = true;
          command = "${pkgs.feh}/bin/feh --bg-fill ${wallpaper}";
        }
      ];

      bars = [
        {
          mode = "dock";
          hiddenState = "hide";
          position = "bottom";
          workspaceButtons = true;
          workspaceNumbers = false;
          statusCommand = "${config.programs.i3status-rust.package}/bin/i3status-rs ${config.xdg.configHome}/i3status-rust/config-bottom.toml";
          fonts = {
            # Monospace still makes fontwawesome fonts work
            # putting fontawesome as the font face makes colons off-center
            names = ["monospace"];
            size = 10.0;
          };
          trayOutput = "primary";
          colors = {
            background = "#282828";
            statusline = "#ffffff";
            separator = "#666666";
            focusedWorkspace = {
              border = "#b8bb26";
              background = "#98971a";
              text = "#ffffff";
            };
            activeWorkspace = {
              border = "#333333";
              background = "#5f676a";
              text = "#ffffff";
            };
            inactiveWorkspace = {
              border = "#333333";
              background = "#222222";
              text = "#888888";
            };
            urgentWorkspace = {
              border = "#2f343a";
              background = "#900000";
              text = "#ffffff";
            };
            bindingMode = {
              border = "#2f343a";
              background = "#900000";
              text = "#ffffff";
            };
          };
        }
      ];

      colors = {
        focused = {
          background = "#98971a";
          border = "#b8bb26";
          childBorder = "#b8bb26";
          indicator = "#ffffff";
          text = "#262626";
        };
      };
    };
  };

  programs.i3status-rust = {
    enable = true;

    bars.bottom = {
      theme = "gruvbox-dark";
      icons = "awesome6";
      blocks = [
        {
          block = "disk_space";
          path = "/";
          alias = "/";
          info_type = "available";
          unit = "GB";
          interval = 15;
          warning = 20.0;
          alert = 10.0;
        }
        {
          block = "memory";
          display_type = "memory";
          format_mem = "{mem_used_percents}";
          format_swap = "{swap_used_percents}";
          interval = 5;
        }
        {
          block = "cpu";
          interval = 5;
        }
        {
          block = "load";
          interval = 5;
          format = "{1m}";
        }
        {block = "sound";}
        {
          block = "time";
          interval = 1;
          format = "%a %m/%d, %I:%M %p";
        }
      ];
    };
  };
}