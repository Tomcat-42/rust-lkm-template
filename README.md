# Rust Loadable Kernel Module Template

## Setup

Note that you need to have a
[_rust enabled_](https://tomcat0x42.me/linux/rust/2023/04/01/linux-kernel-rust-dev-environment.html)
kernel to use this template. Follow the instructions on the link or see one of
the references.

The default paths for scripts in this template are:

- `KERNEL`: `../linux`
- `BUSYBOX`: `../busybox`

So, you should have a `KERNEL` dir with a rust enabled kernel already built and
a `BUSYBOX` dir with a **ALREADY** built and configured busybox.

For automating the setup of the environment, run the `setup` script:

```bash
./scripts/setup
```

Refer to the script for more info.

## Building

I wrote a simple wrapper script for the `make` command for compiling this LKM.
It is located in the `scripts` directory. You can use it like this:

```bash
./scripts/build
./scripts/build -t clean
./scripts/build -t rust-analyzer
./scripts/build -k /path/to/rust/enabled/kernel -b /path/to/busybox
# ... and so on
```

Please refer to the
[kernel docs](https://www.kernel.org/doc/html/latest/kbuild/kbuild.html) for
more info on basic Kbuild usage.

There's also rust specific targets. For example, you can build the rust-analyzer
project configuration with:

```bash
./scripts/build -t rust-analyzer
```

Note that we have a bug in the current mainline kernel that prevents
rust-analyzer from working properly with LKMs. You can find a patch for it
[here](https://lore.kernel.org/rust-for-linux/20230121052507.885734-1-varmavinaym@gmail.com/).

## Running

First, build the LKM. Then, you can use the `run` script to run it in a qemu VM:

```bash
# Default locations: KERNEL=../linux, BUSYBOX=../busybox
./scripts/run
# Custom locations
./scripts/run -k /path/to/rust/enabled/kernel -b /path/to/busybox
```

This script will simply copy all the `.ko` files to the initramfs and run the
VM.

## Hot-reloading

You can use the `hot-reload` script to hot-reload the LKM in the running VM:

```bash
./scripts/hot-reload
```

It uses the `cargo-watch` crate to watch for changes in the source code and then
running `./scripts/build` to build the LKM and `./scripts/run` to run it in the
VM. Please refer to the script for more info.

## References

- [Linux Kernel Module Programming Guide](https://www.tldp.org/LDP/lkmpg/2.6/html/index.html)
- [Rust for Linux project](https://github.com/Rust-for-Linux)
- [Literally me](https://tomcat0x42.me/linux/rust/2023/04/01/linux-kernel-rust-dev-environment.html)
