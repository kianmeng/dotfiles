#!/usr/bin/env python
# vi:et:sw=4 ts=4 ft=python

from __future__ import print_function

import sys


def main(*args):
    print(str(args))


if __name__ == "__main__":
    main(sys.argv[1:])
