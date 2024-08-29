load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load(":repositories.bzl", "capnp_cc_toolchain", "capnp_toolchain")

def _impl(_):
    http_archive(
        name = "capnproto",
        build_file = "//third_party/capnproto:BUILD.capnp.bazel",
        sha256 = "e07446f56043c983e009038e69d18ff86a2924909f0b518ccf47eccf5ac03919",
        strip_prefix = "capnproto-0.10.3",
        urls = [
            "https://github.com/capnproto/capnproto/archive/refs/tags/v0.10.3.tar.gz",
        ],
    )
    capnp_toolchain()
    capnp_cc_toolchain()

capnp_toolchain_extension = module_extension(implementation = _impl)
