# Bazel Developer Environment for VSCode

Tools to quickly assemble a developer environment for Bazel.

This will likely also work well for projects using Bazel, however that is not the focus.

## Extensions

If using a dev container, these will already be installed.

- `bazelbuild.vscode-bazel`
- `zxh404.vscode-proto3`
- `ms-vscode.cpptools`
- `galexite.bazel-cpp-tools`
- `georgewfraser.vscode-javac`
  1. Run `bazel build //src:bazel-dev` so external dependencies can be resolved*.
  2. *External dependencies will not resolve until [georgewfraser/java-language-server#288](https://github.com/georgewfraser/java-language-server/pull/288) is merged and published†.
  3. †Technically the issue can be workaround in a `tools/bazel` script by injecting `--keep_going` and returning a `0` exit code.

## Environment

### [Dev Container](https://containers.dev/)

To use, copy folder in `./dev-containers/master` to the Bazel repo root.

### Nix (soon)

...

## TODO

- [ ] Publish image so container starts faster.
- [ ] Define environment in Nix (for `nix-shell` and `nix shell`), and possibly use Nix to generate the dev container image (adds native macOS support).
- [ ] Figure out something for Windows, perhaps using Windows containers or something similar to Nix.
