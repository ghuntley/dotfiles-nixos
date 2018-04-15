{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    jekyll
    ruby
    bundler
    bundix

  ];
}
