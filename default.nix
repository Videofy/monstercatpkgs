{ pkgs ? null
, haskellPackages ? null
}:
let
  stdenv = pkgs_.stdenv;
  nixpkgs = import <nixpkgs> {};
  jb55pkgs = import <jb55pkgs> {};

  pkgs_ = if pkgs == null then nixpkgs.pkgs else pkgs;
  hp = if haskellPackages == null
         then pkgs_.haskellPackages
         else haskellPackages;
  callHsPackage = hp.callPackage;
  overrideCabal = pkgs_.haskell.lib.overrideCabal;
  callPackage = pkgs_.callPackage;

  monstercatpkgs = rec {
    csv-delim = callPackage ./pkgs/csv-delim {};

    import-scripts = callPackage ./pkgs/import-scripts {
      inherit (jb55pkgs) csv-delim csv-scripts;
      inherit (haskellPackages) report-downloader;
    };

    haskellPackages = rec {
      csv-parser = callHsPackage ./pkgs/haskell/csv-parser.nix {};

      flexible = callHsPackage ./pkgs/haskell/flexible.nix {};

      flexible-instances = callHsPackage ./pkgs/haskell/flexible-instances.nix {
        inherit flexible;
      };

      money = callHsPackage ./pkgs/haskell/money.nix {};

      # monstercat-backend = callHsPackage ./pkgs/haskell/monstercat-backend.nix {
      #   inherit flexible flexible-instances;
      # };

      report-downloader = callHsPackage ./pkgs/haskell/report-downloader { };

      payment = import ./pkgs/haskell/payment {
        inherit monstercatpkgs;
      };

    };
  };
in monstercatpkgs
