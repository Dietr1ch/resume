{ pkgs ? import <nixpkgs> {} }:

let
  custom_texlive = (pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-medium

      dvisvgm
      dvipng # for preview and export as html
      wrapfig
      amsmath
      ulem
      hyperref
      capt-of

      fontawesome

      # AltaCV deps
      fontawesome5
      tcolorbox
      environ
      tikzfill
      enumitem
      adjustbox
      dashrule
      ifmtarg
      multirow
      changepage
      paracol
      lato
      biber
      biblatex
      biblatex-ieee
      accsupp
      pdfx
      xmpincl

      bigfoot;

      #(setq org-latex-compiler "lualatex")
      #(setq org-preview-latex-default-process 'dvisvgm)
  });
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    gnumake

    custom_texlive
    # texlive.combined.scheme-small
    texlive.combined.scheme-medium
    # texlive.combined.scheme-full

    biber
    biblatex-check

    font-awesome_6
    texlivePackages.fontawesome
  ];
}