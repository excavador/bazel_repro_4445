# bazel repro for 4445
https://github.com/bazelbuild/bazel/issues/4445#issuecomment-357632594

# OSX

```
bazel build //:venv # fine
```

# Linux CentOS 7

```
bazel build //:venv # fail
```

```
[oleg@ci-slave-1:Ireland bazel_repro_4445]$ bazel build //:venv
.............
INFO: Analysed target //:venv (7 packages loaded).
INFO: Found 1 target...
INFO: From SkylarkAction venv:
Using base prefix '/usr'
New python executable in /home/oleg/.cache/bazel/_bazel_oleg/578b6baa72b973dde1d5aff4773fada4/bazel-sandbox/7259144068543139378/execroot/__main__/bazel-out/k8-fastbuild/bin/venv/bin/python3.6
Also creating executable in /home/oleg/.cache/bazel/_bazel_oleg/578b6baa72b973dde1d5aff4773fada4/bazel-sandbox/7259144068543139378/execroot/__main__/bazel-out/k8-fastbuild/bin/venv/bin/python
Installing setuptools, pip, wheel...done.
Making script /home/oleg/.cache/bazel/_bazel_oleg/578b6baa72b973dde1d5aff4773fada4/bazel-sandbox/7259144068543139378/execroot/__main__/bazel-out/k8-fastbuild/bin/venv/bin/easy_install relative
Making script /home/oleg/.cache/bazel/_bazel_oleg/578b6baa72b973dde1d5aff4773fada4/bazel-sandbox/7259144068543139378/execroot/__main__/bazel-out/k8-fastbuild/bin/venv/bin/easy_install-3.6 relative
Making script /home/oleg/.cache/bazel/_bazel_oleg/578b6baa72b973dde1d5aff4773fada4/bazel-sandbox/7259144068543139378/execroot/__main__/bazel-out/k8-fastbuild/bin/venv/bin/pip relative
Making script /home/oleg/.cache/bazel/_bazel_oleg/578b6baa72b973dde1d5aff4773fada4/bazel-sandbox/7259144068543139378/execroot/__main__/bazel-out/k8-fastbuild/bin/venv/bin/pip3 relative
Making script /home/oleg/.cache/bazel/_bazel_oleg/578b6baa72b973dde1d5aff4773fada4/bazel-sandbox/7259144068543139378/execroot/__main__/bazel-out/k8-fastbuild/bin/venv/bin/pip3.6 relative
Making script /home/oleg/.cache/bazel/_bazel_oleg/578b6baa72b973dde1d5aff4773fada4/bazel-sandbox/7259144068543139378/execroot/__main__/bazel-out/k8-fastbuild/bin/venv/bin/wheel relative
Making script /home/oleg/.cache/bazel/_bazel_oleg/578b6baa72b973dde1d5aff4773fada4/bazel-sandbox/7259144068543139378/execroot/__main__/bazel-out/k8-fastbuild/bin/venv/bin/python-config relative
ERROR: /home/oleg/bazel_repro_4445/BUILD:11:1: Error while validating output TreeArtifact File:[[/home/oleg/.cache/bazel/_bazel_oleg/578b6baa72b973dde1d5aff4773fada4/execroot/__main__]bazel-out/k8-fastbuild/bin]venv : /home/oleg/.cache/bazel/_bazel_oleg/578b6baa72b973dde1d5aff4773fada4/execroot/__main__/bazel-out/k8-fastbuild/bin/venv/lib/python3.6/config-3.6m-x86_64-linux-gnu (Operation not permitted)
ERROR: /home/oleg/bazel_repro_4445/BUILD:11:1: not all outputs were created or valid
Target //:venv failed to build
Use --verbose_failures to see the command lines of failed build steps.
INFO: Elapsed time: 6.309s, Critical Path: 3.15s
FAILED: Build did NOT complete successfully
```