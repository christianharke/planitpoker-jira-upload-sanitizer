let

  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> {
    overlays = [ moz_overlay ];
  };

in

nixpkgs.mkShell {

  name = "planitpoker-jira-upload-sanitizer";

  buildInputs = with nixpkgs; [
    figlet lolcat # banner printing on enter

    latest.rustChannels.stable.rust
  ];

  shellHook = ''
    figlet $name | lolcat --freq 0.5
  '';
}
