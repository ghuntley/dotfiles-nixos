{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    ctags
     
    cabal2nix
    cabal-install
    stack

    haskell.compiler.ghc822

    # libraries
    haskellPackages.alex
    haskellPackages.happy
    haskellPackages.hakyll

    # tools
    #haskellPackages.hscope
    #haskellPackages.argon          # code complexity (req: haskell 7.10)
    haskellPackages.codex           # ctags file generator for cabal project dependencies
    haskellPackages.ghc-mod         # ghc-mod is a backend program to enrich editors
    haskellPackages.ghcid           # GHCi as a daemon
    haskellPackages.hasktags        # Produces ctags "tags" and etags "TAGS" files for Haskell programs 
    haskellPackages.hlint           # linter
    haskellPackages.hoogle          # type signature search
    haskellPackages.hpack           # yaml based package format
    haskellPackages.hspec           # testing framework
    haskellPackages.pointfree       # http://pointfree.io/
    haskellPackages.pointful        # https://github.com/23Skidoo/pointful
    haskellPackages.stylish-haskell # pretty printer
    haskellPackages.tasty           # testing framework
    haskellPackages.weeder          # dead code detection

  ];
}
