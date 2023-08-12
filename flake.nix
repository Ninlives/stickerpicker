{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
  outputs = { self, nixpkgs }:
  let
    sys = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${sys};
    in {
      packages.${sys}.default = with pkgs.python3.pkgs; buildPythonApplication {
        pname = "maunium-stickerpicker";
        version = "unstable";

        src = ./.;
        propagatedBuildInputs = [
          aiohttp
          yarl
          pillow
          telethon
          cryptg
          python-magic
        ];

        doCheck = false;
      };
    };
}
