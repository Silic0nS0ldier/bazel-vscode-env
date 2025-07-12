# Bazel Developer Environment for VSCode

Devcontainer for developing Bazel on Linux (x86-64 or aarch64, according to host).

This will likely also work well for projects using Bazel, however that is not the focus.

## Extensions

If running the devcontainer with the VSCode integration, the following extensions will be automatically installed.

- `bazelbuild.vscode-bazel`
- `zxh404.vscode-proto3`
- `ms-vscode.cpptools`
- `galexite.bazel-cpp-tools`
- `siliconsoldier.java-with-bazel`
  (Run `bazel build //src:bazel-dev` so external dependencies can be resolved.)

## Recommended Setup

1. Create a workspace directory (e.g. `bazel-workspace`)
2. Clone Bazel under directory (e.g. `bazel-workspace/bazel`)
3. Clone this under directory as `.devcontainer` (e.g. `bazel-workspace/.devcontainer`)
4. Open workspace directory in VSCode.
5. Reopen in devcontainer.
6. `code bazel` in terminal to VSCode is running under `bazel` repository. Necessary for Java LSP to resolve workspace.

## TODO

- [ ] Publish image so container starts faster.
