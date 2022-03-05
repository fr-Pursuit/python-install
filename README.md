# Python installer

Utility script created to install multiple versions of Python alongside each other on the same system.

The script can be used with this simple command:

    sudo python-install <version>

where `<version>` is the Python version that will be install.

This script is licened under the [GNU GPLv3](./LICENSE) license.

## Installing a Python version

When the `python-install <version>` command is run, the source code that corresponds to the specified Python version is downloaded and built from the official Python website.

The resulting Python binaries are saved in the `/opt/python/{version}` directory (where `{version}` is the installed Python version).

## Use a specific Python version

The most straightforward way to use a specific Python version is to call it via its absolute path (ex: `/opt/python/3.10/bin/python`).

To set the default Python version for a particular user, simply modify its `.profile` to add the corresponding `/opt/python/{version}/bin` folder at the beginning of the user's `PATH`.

## Uninstalling a Python version

To uninstall a Python version, simply remove the corresponding `/opt/python/{version}` directory.
