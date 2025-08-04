{
  system,
  nixpkgs,
  edinix,
}:

let
  pkgs = import nixpkgs { inherit system; };
  helix = edinix.helix.${system} {
    profiles.nix.enable = true;
  };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    chicken
    chickenPackages.chickenEggs.lsp-server
    helix.editor
    helix.tooling
  ];
}
