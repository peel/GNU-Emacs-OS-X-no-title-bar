{pkgs ? import <nixpkgs> {}, withBorderless ? true }:

# Running:
# nix-shell --pure

with pkgs;

let
  patchBorderless = ./GNU-Emacs-OS-X-no-title-bar.patch;
  emacs = (pkgs.emacs.override{ srcRepo=true; inherit (pkgs) autoconf automake texinfo;})
                     .overrideAttrs (oldAttrs: rec { patches = oldAttrs.patches ++ lib.optional withBorderless patchBorderless;});
in stdenv.mkDerivation {
  name = "emacs-borderless";
  src = "./";
  buildInputs = [ emacs ];

  shellHook = "which emacs";
}
