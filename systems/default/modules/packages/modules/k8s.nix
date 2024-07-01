{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kompose
    kubectl
    kubernetes
    minikube
  ];
}
