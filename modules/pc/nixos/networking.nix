_: {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  programs.wireshark = {
    enable = true;
    dumpcap.enable = true;
    usbmon.enable =true;
  };
}
