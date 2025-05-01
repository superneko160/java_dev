{
  description = "Java Development";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        
        # Javaのバージョン（JDK 23）
        jdk = pkgs.jdk23;

      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Java開発に必要なパッケージ
            jdk
            maven
            gradle
          ];

          shellHook = ''
            echo "JDK version: $(java --version)"
            echo "Maven: $(mvn --version | head -n 1)"
            echo "Gradle: $(gradle --version | head -n 3 | tail -n 1)"
          '';
        };
      }
    );
}

