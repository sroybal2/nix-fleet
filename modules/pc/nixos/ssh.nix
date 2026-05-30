{ ... }: {
  # SSH server: remote access, SFTP, RootShell (iPhone).
  services.openssh = {
    enable = true;
    openFirewall = true; # opens TCP 22 in the firewall
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Public keys allowed to log in as steve (key-only auth).
  # To add the iPhone: generate a keypair in RootShell, then paste its
  # PUBLIC key as a new line below and re-run `nh os switch ~/nix-fleet`.
  users.users.steve.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDChAjc4APL7chJ7zNl0dIxVtE10ONMpIa0HF+z/Wpvv merobo2@pm.me"
  ];
}
