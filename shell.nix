let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
  my-python-packages = ps: with ps; [
    filterpy
    jupyterlab
    notebook
  ];
in

pkgs.mkShell {
  packages = with pkgs; [
    git
    vim
    python3
    (pkgs.python3.withPackages my-python-packages)
  ];
}
