# Zig Chocolatey Package

This repository contains the content of a [Chocolatey](https://chocolatey.org) package to install the [Zig](https://ziglang.org/) programming language.

## Building and pushing the package

- **Build**: `choco pack`
- **Test install**: `choco install zig -dv -s .`
- **Publish**: `choco push zig.[VERSION].nupkg -s https://push.chocolatey.org/`