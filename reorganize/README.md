
# Dotfiles (by unixsuperhero)

## Table of Contents

* concept
* setup instructions
  * setup script
  * todo

## Concept



## Setup Instructions


### `sh setup`

### Setup To Do

Create 3 scripts:

1. build
2. install
3. setup (build + install)

Details:

1. `build`
  * create a `./builds/<timestamp>/` folder and symlink
    `./builds/latest` to it
    * before anything is created or overwritten in the
      `$HOME` directory, everything is prepared in this
      `build` folder
    * probably a symlink to the real folder which is
      timestamped in `tmp/` like this: `tmp/build.20150313/`
2. `install`
  * everything in `./builds/latest` is copied to `$HOME/` as-is
    * anything that already exists in `$HOME/` will be
      copied to `./build/backup/`
    * all copy/backup information can be stored in the
      `./build/install.log` file

