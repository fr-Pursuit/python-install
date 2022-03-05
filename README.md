# Python installer

This is a utility script created to install multiple versions of Python alongside each other on the same system.

The script can be used with this simple command:

    sudo python-install <version>

where `<version>` is the Python version that will be install, in the format `X.Y.Z`.

Alternatively, this script can be downloaded and used directly from GitHub with this command:

    curl -s https://raw.githubusercontent.com/fr-Pursuit/python-install/master/python-install.sh | sudo bash -s <version>

This script is licened under the [GNU GPLv3](./LICENSE) license.

## Python build dependencies

Before using this script, please make sure you have all the required [Python build dependencies](https://github.com/pyenv/pyenv/wiki#suggested-build-environment).

## Installing a Python version

When the `python-install <version>` command is run, the source code that corresponds to the specified Python version is downloaded and built from the official Python website.

The resulting Python binaries are saved in the `/opt/python/{version}` directory (where `{version}` is the installed Python version, in the format `X.Y`).

## Use a specific Python version

The most straightforward way to use a specific Python version is to call it via its absolute path (ex: `/opt/python/3.10/bin/python`).

To set the default Python version for a particular user, simply modify its `.profile` to add the corresponding `/opt/python/{version}/bin` folder at the beginning of the user's `PATH`.

## Uninstalling a Python version

To uninstall a Python version, simply remove the corresponding `/opt/python/{version}` directory.
