# pico-docker-env

Provides a quick and simple way to start a command-line based build environment for the RP2040 microcontroller and the [pico-sdk](https://github.com/raspberrypi/pico-sdk) from the Raspberry Foundation.

The container fetches everything needed to build an RP2040-based project so there is no need to manually download the SDK, export the `PICO_SDK_PATH` environment variable, install the ARM binaries etc.

This project can be added to an existing repository either by simply copying the files across or as a git sub-module.

To add it as a sub-module run
```
git submodule add https://github.com/rhulme/pico-docker-env docker
```

You may wish to adapt `Dockerfile` to your own requirements, such as adding additional (cross-)compilers for building host tools to communicate with the microcontroller.

Whether the files are simply copied or added as a sub-module, the rest of the README assumes they are in the `docker` sub-directory in the project's root directory.

To start the build environment, simply run:
```
docker/buildenv
```

The first time `buildenv` is run it will create the Docker container, which may take some time depending on the speed of your machine.

When the container starts, it will create a `build` sub-directory in the current directory (if necessary), change to it and then start a bash shell.

From there you can build as normal.  For example:

```
cmake ..
make -j4
```
