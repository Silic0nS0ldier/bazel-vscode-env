#!/usr/bin/env bash

set -eax

echo "Running install..."

ARCH="$(uname --processor)"

# renovate: datasource=github-tags depName=bazelbuild/bazelisk
BAZELISK_VERSION="v1.26.0"
# renovate: datasource=github-tags depName=bazelbuild/buildtools
BUILDTOOLS_VERSION="v8.2.1"
# renovate: datasource=github-tags depName=withered-magic/starpls
STARPLS_VERSION="v0.1.21"

if [[ $ARCH == "arm64" ]] || [[ $ARCH == "aarch64" ]]; then
    curl "https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-arm64" -Lo /usr/local/bin/bazel
    curl "https://github.com/bazelbuild/buildtools/releases/download/${BUILDTOOLS_VERSION}/buildifier-linux-arm64" -Lo /usr/local/bin/buildifier
    curl "https://github.com/bazelbuild/buildtools/releases/download/${BUILDTOOLS_VERSION}/buildozer-linux-arm64" -Lo /usr/local/bin/buildozer
    curl "https://github.com/bazelbuild/buildtools/releases/download/${BUILDTOOLS_VERSION}/unused_deps-linux-arm64" -Lo /usr/local/bin/unused_deps
    curl "https://github.com/withered-magic/starpls/releases/download/${STARPLS_VERSION}/starpls-linux-aarch64" -Lo /usr/local/bin/starpls

elif [[ $ARCH == "x86_64" ]]; then
    curl "https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-amd64" -Lo /usr/local/bin/bazel
    curl "https://github.com/bazelbuild/buildtools/releases/download/${BUILDTOOLS_VERSION}/buildifier-linux-amd64" -Lo /usr/local/bin/buildifier
    curl "https://github.com/bazelbuild/buildtools/releases/download/${BUILDTOOLS_VERSION}/buildozer-linux-amd64" -Lo /usr/local/bin/buildozer
    curl "https://github.com/bazelbuild/buildtools/releases/download/${BUILDTOOLS_VERSION}/unused_deps-linux-amd64" -Lo /usr/local/bin/unused_deps
    curl "https://github.com/withered-magic/starpls/releases/download/${STARPLS_VERSION}/starpls-linux-amd64" -Lo /usr/local/bin/starpls
else
    echo "Unknown arch $ARCH"
    exit 1
fi
chmod +x \
    /usr/local/bin/bazel \
    /usr/local/bin/buildifier \
    /usr/local/bin/buildozer \
    /usr/local/bin/unused_deps \
    /usr/local/bin/starpls

# 'ed' used in src/test/shell/bazel/starlark_repository_test.sh@test_disallow_unverified_http
sudo apt update  # Populate package metadata store
sudo apt install ed
