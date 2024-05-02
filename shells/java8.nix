{ pkgs }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    jdk8
    maven
  ];
}
