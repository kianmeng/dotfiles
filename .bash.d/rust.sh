# rustc: error while loading shared libraries: librustc-4e7c5e5c.so: cannot
# open shared object file: No such file or directory
# see https://github.com/rust-lang/rust/issues/15684
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
