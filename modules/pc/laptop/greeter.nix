_:
{

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
    };

    programs.silentSDDM = {
        enable = true;
        theme = "default";
        settings = {
            Background = { Mode = "cover"; };
            General = { GreeterEnvironment = "QT_SCALE_FACTOR=2,QT_AUTO_SCREEN_SCALE_FACTOR=0"; };
            Wayland = {
                PrimaryDisplay = "eDP-1";
                EnabledHiDPI = true;
            };
        };
    };
}
