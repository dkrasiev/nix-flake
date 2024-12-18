{ user, ... }:

{
  services.syncthing = {
    enable = true;
    user = user.name;
    dataDir = "/home/${user.name}/Documents";
    configDir = "/home/${user.name}/Documents/.config/syncthing";
    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any folders added or deleted through the WebUI
    settings = {
      devices = {
        "MacBookAir" = { id = "FQ74OEB-2O3FQYT-UBS7KXC-JQBGNOM-55HFAHZ-OA36VNH-KC3FRBK-XTAU7QL"; };
        "RMX3630" = { id = "ZXKR363-Y32NEBB-3TW5SAN-IIORSEA-JPSLHP5-OOHCIPW-JFVN4J4-RWM3PAK"; };
        # This PC
        # "WorkPC" = { id = "DEVICE-ID-GOES-HERE"; };
        "HomePC" = { id = "MOSNHHJ-CMB6A4C-WIBAU6F-ANYMOJU-E4UYRWN-UHS5ENM-3F257LE-3GWRDQ4"; };
      };
      folders = {
        "default" = {         # Name of folder in Syncthing, also the folder ID
          path = "/home/${user.name}/Sync";    # Which folder to add to Syncthing
          devices = [
            "MacBookAir"
            "RMX3630"
            # "WorkPC"
            "HomePC"
          ];      # Which devices to share the folder with
        };
      };
    };
  };
}
