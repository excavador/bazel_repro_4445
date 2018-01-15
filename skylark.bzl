_VIRTUALENV_BUILD_FILE = """package(default_visibility = ["//visibility:public"])
filegroup(name="virtualenv", srcs=glob(["virtualenv-15.1.0/**"], exclude=["virtualenv-15.1.0/__pycache__"], exclude_directories=1))
"""

_VIRTUALENV_WORKSPACE_FILE = """workspace(name = "virtualenv")"""

def register_repositories():
  native.new_http_archive(
      name="virtualenv",
      url = "https://pypi.python.org/packages/d4/0c/9840c08189e030873387a73b90ada981885010dd9aea134d6de30cd24cb8/virtualenv-15.1.0.tar.gz#md5=44e19f4134906fe2d75124427dc9b716",
      sha256 = "02f8102c2436bb03b3ee6dede1919d1dac8a427541652e5ec95171ec8adbc93a",
      build_file_content = _VIRTUALENV_BUILD_FILE,
      workspace_file_content=_VIRTUALENV_WORKSPACE_FILE,
    )

def _virtualenv_impl(ctx):
  result = ctx.actions.declare_directory(ctx.label.name)

  virtualenv_files = ctx.attr.virtualenv.files.to_list()

  for virtualenv_py in ctx.attr.virtualenv.files:
    if virtualenv_py.path.endswith('/virtualenv.py'):
      break

  ctx.actions.run_shell(
    inputs=virtualenv_files,
    outputs=[result],
    command="""#!/bin/bash
set -eu
{python} {virtualenv} {result}
{python} {virtualenv} --relocatable {result}
""".format(python=ctx.attr.python, virtualenv=virtualenv_py.path, result=result.path)
  )

  return [DefaultInfo(files=depset([result]))]

_virtualenv = rule(
    implementation = _virtualenv_impl,
    attrs = {
      "virtualenv": attr.label(allow_files=True, default="@virtualenv//:virtualenv"),
      "python": attr.string(),
    },
)

def virtualenv(name=None):
  _virtualenv(name=name, python=select({
        "//:osx":   "/usr/local/bin/python3.6",
        "//:linux": "/usr/bin/python3.6",
       }, no_match_error = 'unsupported OS'))

