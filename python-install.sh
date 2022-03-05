#!/bin/bash

###############################
# Python installer by Pursuit #
###############################

set -e  # Stop if any command fails

if [ -z "$1" ]
then
    echo "Usage: python-install <version>"
    exit 1
fi

VERSION=$1
VERSION_MAJOR=$(echo $1 | cut -d"." -f1)
VERSION_MINOR=$(echo $1 | cut -d"." -f2)
VERSION_BUILD=$(echo $1 | cut -d"." -f3)

OUTPUT=/opt/python/$VERSION
TMP=/tmp/python-install-$VERSION
trap 'rm -rf -- "$TMP"' EXIT  # Delete temp directory if any command fails

# Download and extract the Python source code
echo "Downloading Python $VERSION..."
mkdir -p "$TMP"
cd "$TMP" && wget "https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz"
cd "$TMP" && tar -xf "Python-$VERSION.tgz"
rm "$TMP/Python-$VERSION.tgz"

# Build Python
echo "Building Python $VERSION..."
cd "$TMP/Python-$VERSION" && ./configure --enable-optimizations --prefix $OUTPUT
cd "$TMP/Python-$VERSION" && make install

# Delete temp directory
echo "Cleaning up build directory..."
rm -rf -- "$TMP"

# Create utility symlinks
echo "Creating utility symlinks..."
ln -s "$OUTPUT/bin/idle$VERSION_MAJOR.$VERSION_MINOR" "$OUTPUT/bin/idle"
ln -s "$OUTPUT/bin/pip$VERSION_MAJOR.$VERSION_MINOR" "$OUTPUT/bin/pip"
ln -s "$OUTPUT/bin/pydoc$VERSION_MAJOR.$VERSION_MINOR" "$OUTPUT/bin/pydoc"
ln -s "$OUTPUT/bin/python$VERSION_MAJOR.$VERSION_MINOR" "$OUTPUT/bin/python"
ln -s "$OUTPUT/bin/python$VERSION_MAJOR.$VERSION_MINOR-config" "$OUTPUT/bin/python-config"

echo "Python $VERSION has been installed successfully"
