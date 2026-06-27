## nix os dotfiles with flakes and home manager
1. create a new directory (nix-dots) owned by user and cp /etc/nixos/hardware-configuration.nix to it
2. clone repo into same directory
4. run a sudo nixos-rebuild switch --flake ~/nix-dots#nixy
5. pray that i actually did this right and you get a working system
6. (optional) cry when it fails
