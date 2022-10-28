# cross.nix
with (import <nixpkgs> {});
let
  basePackages = [
    openssl
    libiconv
    cyrus_sasl
    pkg-config
    libmcrypt
    zlib
    zlib-ng
    cmake
    clang
    trunk
    nodejs-18_x
    wasm-pack

  ];

  inputs = basePackages
    # ++ lib.optional stdenv.isLinux inotify-tools
    ++ lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
        CoreFoundation
	Security
      ]);

in mkShell {
  buildInputs = inputs;
}
