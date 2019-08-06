config_setting(
    name = "osx",
    values = {"cpu": "darwin"},
)
config_setting(
    name = "linux",
    values = {"cpu": "k8"},
)

load("//:skylark.bzl", "virtualenv")
virtualenv(name="venv")
