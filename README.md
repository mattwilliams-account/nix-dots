## nix os dotfiles with flakes and home manager
1. create a new directory (nix-dots) owned by user and cp /etc/nixos/hardware-configuration.nix to it
2. clone repo into same directory
git clone https://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@github.com/mattwilliams-account/nix-dots.git
4. run a sudo nixos-rebuild switch --flake ~/nix-dots#nixy
5. pray that i actually did this right and you get a working system
6. (optional) cry when it fails
