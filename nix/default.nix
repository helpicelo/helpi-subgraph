{ sources ? import ./sources.nix, pkgs ? import sources.nixpkgs { } }:

with pkgs;

{
  shell = mkShell {
    nativeBuildInputs = [
      yarn
      nodejs

      darwin.apple_sdk.frameworks.AppKit
      darwin.apple_sdk.frameworks.Security
    ];
    CFLAGS = if stdenv.isDarwin then "-I/usr/include" else "";
    LDFLAGS = if stdenv.isDarwin then
      "-L${darwin.apple_sdk.frameworks.CoreFoundation}/Library/Frameworks:${darwin.apple_sdk.frameworks.CoreServices}/Library/Frameworks:${darwin.apple_sdk.frameworks.Security}/Library/Frameworks:${darwin.apple_sdk.frameworks.AppKit}/Library/Frameworks"
    else
      "";
  };
}