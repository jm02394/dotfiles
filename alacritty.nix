{
  config,
  pkgs,
  ...
}: let
  termfont = {family = "MesloLGS Nerd Font";};
in {
  programs.alacritty = {
    enable = true;

    settings = {
      fonts = {
        normal = termfont;
        bold = termfont;
        italic = termfont;
        bold_italic = termfont;
        size = "12";
      };

      shell = {
        program = config.home.sessionVariables.SHELL;
        args = ["-c" "tmux attack || tmux new"];
      };

      colors.normal = {
        black = "0x282828";
        red = "0xcc241d";
        green = "0x98971a";
        yellow = "0xd79921";
        blue = "0x458588";
        magenta = "0xb16286";
        cyan = "0x689d6a";
        white = "0xa89984";
      };

      colors.bright = {
        black = "0x928374";
        red = "0xfb4934";
        green = "0xb8bb26";
        yellow = "0xfabd2f";
        blue = "0x83a598";
        magenta = "0xd3869b";
        cyan = "0x8ec07c";
        white = "0xebdbb2";
      };

      colors.primary.background = "0x282828";
      colors.primary.foregroundground = "0xebdbb2";

      cursor = {
        style = "Beam";
        thickness = 0.2;
      };
    };
  };
}
