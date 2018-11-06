# npm-crosser

Docker project for installing cross compiled npm modules. Currently installs modules using node v8.11.3-linux-x86 for armhfv7.

## Building the container

```bash
docker build -t npm-crosser .
```

## Running the container

```bash
docker run --rm -it --volume /path/to/download:/workdir/proj npm-crosser [OPTIONS] [ARGS]
```

### Options

    -i|--install

## Examples

```bash
docker run --rm -it --volume $(pwd):/workdir/proj npm-crosser --install unix-dgram
docker run --rm -it --volume /some/other/dir:/workdir/proj npm-crosser -i unix-dgram shx ionic
```
