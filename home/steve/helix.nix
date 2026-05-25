{ pkgs, ... }: {
  programs.helix = {
    enable = true;

    extraPackages = with pkgs; [
      nil
      nixpkgs-fmt
    ];

    languages = {
      language-server.nil = {
        command = "nil";
        config.nil.formatting.command = [ "nixpkgs-fmt" ];
      };

      language = [{
        name = "nix";
        auto-format = true;
        language-servers = [ "nil" ];
      }];
    };
  };
}
