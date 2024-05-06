{ pkgs, ... }:

derivation {
  pname = "firefox";
  version = "45.0.2";

  system = "x86_64-linux";

  src = pkgs.fetchurl {
    url = "https://ftp.mozilla.org/pub/firefox/releases/45.0.2/linux-x86_64/ru/firefox-45.0.2.tar.bz2";
    hash = "sha256-0nykcn6ds9wbf416mq2n8cm2dasfmjb08w96i3315xy513fk8kpx=";
  };

  installPhase = ''
    tar -xvjf ./firefox-45.0.2.tar.bz
    cp ./firefox/* ./
  '';

  outputs = [ "firefox" ];
}
