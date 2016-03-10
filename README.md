# Syndicate Filesystem Client

This is a user gateway that implements a FUSE filesystem.  It lets you mount a Syndicate volume in your filesystem hierarchy.

# Building

To build, you will first need to install [syndicate-core](https://github.com/syndicate-storage/syndicate-core).

Then to build, type:
```
    $ make
```

To install, type:
```
    $ make install PREFIX=<your prefix> DESTDIR=<your destdir>
```

