{ pkgs, ... }: {
  users.users.steve = {
    isNormalUser = true;
    description = "steve";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" "cdrom" "optical" "wireshark" ];
    shell = pkgs.zsh;
  };
}
