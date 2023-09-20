# This flake was initially generated by fh, the CLI for FlakeHub (version 0.1.5)
# https://github.com/DeterminateSystems/fh
# then node and various other related pkgs were added
{
  # A helpful description of your flake
  description = "svelte kitdocs flake";

  # Flake inputs
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*.tar.gz";
  };

  # Flake outputs that other flakes can use
  outputs = { self, nixpkgs }:
    let
      # Helpers for producing system-specific outputs
      supportedSystems = [ "x86_64-linux" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in {
      # Development environments
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          # Pinned packages available in the environment
          packages = with pkgs; [
            nixpkgs-fmt
            node2nix
            nodejs-18_x # Node.js 18, plus npm, npx, and corepack
            # You can choose pnpm, yarn, or none (npm).
            nodePackages.pnpm
            nodePackages.typescript
            nodePackages.typescript-language-server

            playwright
          ];

          # A hook run every time you enter the environment
          shellHook = ''
            export EDITOR=vi
          '';
        };
      });
    };
}
