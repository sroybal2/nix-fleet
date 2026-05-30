{ ... }: {
  # WebDAV server for Joplin sync (iPhone + desktop both support WebDAV natively).
  # Joplin sync target: http://<this-host>:6065/  user "joplin", password from env file.
  services.webdav = {
    enable = true;
    user = "steve";
    group = "users";
    settings = {
      address = "0.0.0.0";
      port = 6065;
      directory = "/var/lib/joplin-webdav";
      permissions = "CRUD"; # full read/write for sync
      users = [
        {
          username = "joplin";
          # bcrypt hash of the WebDAV password. The {bcrypt} prefix tells
          # webdav to treat the rest as a hash (without it, it's compared as
          # plaintext). A hash is safe in the Nix store; plaintext is not stored.
          # Regenerate with: mkpasswd -m bcrypt -R 10 -s <<< 'NEWPASS'
          password = "{bcrypt}$2b$10$hxyaP3ENzkJeoi5L5.OhLutGir15OPiKBUGKA5kNpGWTn109eXPOG";
        }
      ];
    };
  };

  # Storage directory for the synced Joplin data.
  systemd.tmpfiles.rules = [
    "d /var/lib/joplin-webdav 0700 steve users -"
  ];

  networking.firewall.allowedTCPPorts = [ 6065 ];
}
