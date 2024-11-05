#!/usr/bin/env bash

set -eax

echo "Running install..."

ARCH="$(uname --processor)"

if [[ $ARCH == "arm64" ]]; then
    curl https://github.com/bazelbuild/bazelisk/releases/download/v1.23.0/bazelisk-linux-arm64 -Lo /usr/local/bin/bazel
    curl https://github.com/bazelbuild/buildtools/releases/download/v7.3.1/buildifier-linux-arm64 -Lo /usr/local/bin/buildifier
    curl https://github.com/bazelbuild/buildtools/releases/download/v7.3.1/buildozer-linux-arm64 -Lo /usr/local/bin/buildozer
    curl https://github.com/bazelbuild/buildtools/releases/download/v7.3.1/unused_deps-linux-arm64 -Lo /usr/local/bin/unused_deps
    curl https://github.com/withered-magic/starpls/releases/download/v0.1.15/starpls-linux-aarch64 -Lo /usr/local/bin/starpls

    # TODO Add starpls once arm64 builds are published
elif [[ $ARCH == "x86_64" ]]; then
    curl https://github.com/bazelbuild/bazelisk/releases/download/v1.23.0/bazelisk-linux-amd64 -Lo /usr/local/bin/bazel
    curl https://github.com/bazelbuild/buildtools/releases/download/v7.3.1/buildifier-linux-amd64 -Lo /usr/local/bin/buildifier
    curl https://github.com/bazelbuild/buildtools/releases/download/v7.3.1/buildozer-linux-amd64 -Lo /usr/local/bin/buildozer
    curl https://github.com/bazelbuild/buildtools/releases/download/v7.3.1/unused_deps-linux-amd64 -Lo /usr/local/bin/unused_deps
    curl https://github.com/withered-magic/starpls/releases/download/v0.1.15/starpls-linux-amd64 -Lo /usr/local/bin/starpls
else
    echo "Unknown arch $ARCH"
    exit 1
fi
chmod +x /usr/local/bin/bazel /usr/local/bin/buildifier /usr/local/bin/buildozer /usr/local/bin/unused_deps /usr/local/bin/starpls
