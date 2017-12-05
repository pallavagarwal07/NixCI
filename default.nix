{pkgs ? import <nixpkgs> {} }:
let
  my_tex_packages = with pkgs; texlive.combine {
    inherit (texlive) scheme-medium appendix changebar footmisc multirow
    overpic stmaryrd subfigure titlesec wasysym xargs bigfoot luatex lipsum
    fontawesome adjustbox collectbox wrapfig fancyhdr;
  };
in
  pkgs.stdenv.mkDerivation {
    name = "all";
    src = ./.;
    buildInputs = with pkgs; [
      my_tex_packages
    ];
    buildPhase = ''
      pdflatex test.tex
    '';
    installPhase = ''
      mkdir $out
      cp test.pdf $out/test.pdf
    '';
  }
