# Rust Loadable Kernel Module Template

## Environment

Note that you need to have a [_rust enabled_](https://tomcat0x42.me/linux/rust/2023/04/01/linux-kernel-rust-dev-environment.html) kernel to use this template. Follow the instructions on the link or see one of the references.

## Building

I wrote a simple wrapper script for the `make` command for compiling this LKM. It is located in the `scripts` directory. You can use it like this:

```bash
./scripts/build
./scripts/build -t clean
./scripts/build -k /path/to/rust/enabled/kernel
# ... and so on
```

Please refer to the [kernel docs](https://www.kernel.org/doc/html/latest/kbuild/kbuild.html) for more info on basic Kbuild usage.

There's also rust specific targets. For example, you can build the rust-analyzer project configuration with:

```bash
./scripts/build -t rust-analyzer
```

Note that we have a bug in the current mainline kernel that prevents rust-analyzer from working properly with LKMs. You can find a patch for it [here](https://lore.kernel.org/rust-for-linux/20230121052507.885734-1-varmavinaym@gmail.com/).

## Running

- **TODO**: do.

## References

- [Linux Kernel Module Programming Guide](https://www.tldp.org/LDP/lkmpg/2.6/html/index.html)
- [Rust for Linux project](https://github.com/Rust-for-Linux)
- [Literally me](https://tomcat0x42.me/linux/rust/2023/04/01/linux-kernel-rust-dev-environment.html)
