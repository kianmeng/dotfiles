#!/usr/bin/env bash
#
# Build the Deb package for the latest unstable Vim for Debian. 
#
#     $ bash bash build_latest_vim.sh
#
# @see http://vim.wikia.com/wiki/Building_Vim

APP_NAME="vim"
BUILD_PATH="/tmp/$APP_NAME"

sudo apt-get install -y mercurial libssl-dev

# This going to take a while as we're downloading a lot of packages.
sudo apt-get -y build-dep vim

if [ -d "$BUILD_PATH" ]; then
    cd $BUILD_PATH
    hg pull
    hg update
else
    # Show the progress as it going to take a while as well.
    hg --debug -v clone http://hg.debian.org/hg/pkg-vim/vim $BUILD_PATH

    cd $BUILD_PATH
    hg checkout unstable
fi

# To prevent the build failure of 
#     ...
#     make: [configure-stamp-vim-gtk] Error 1
#     rm configure-stamp-vim-tiny
#     dpkg-buildpackage: error: debian/rules build gave error exit status 2
#     ...
#
# @see http://lanyitin.tw/post/build-vim-7.4-deb-file-on-wheezy/
sed -i 's/$(shell python-config --configdir)/\/usr\/lib\/python2.7\/config\//' debian/rules
debian/rules update-orig

# from man dpky-buildpackage
# -b Specifies a binary-only build, no source files are to be built and/or
#    distributed.
# -d Do not check build dependencies and conflicts.
#     ...
#     dpkg-checkbuilddeps: Build conflicts: ruby1.8 (<< 1.8.7.358-8) ruby1.8-dev (<< 1.8.7.358-8)
#     dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
#     dpkg-buildpackage: warning: (Use -d flag to override.)
#     ...
# -j Number of jobs allowed to be run simultaneously
dpkg-buildpackage -b -i -I -d -j4
