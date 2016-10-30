#!/bin/bash

PACKAGE_EXTENSION=".tar.gz"
PACKAGE_NAME="$1"
PACKAGE_NUMBER="$2"

RELEASE_DIR="/data/releases/$PACKAGE_NAME-$PACKAGE_NUMBER"
PROJECT_DIR="/data/projects/$PACKAGE_NAME"

PACKAGE_FILE_NAME="$PACKAGE_NAME$PACKAGE_EXTENSION"

curl -o "$PACKAGE_FILE_NAME" "http://packages.s/$PACKAGE_FILE_NAME"

mkdir -p "$RELEASE_DIR"
tar -zxvf "$PACKAGE_FILE_NAME" -C "$RELEASE_DIR"

rm "$PACKAGE_FILE_NAME"

echo -n "Yes? (y/n) "

read ANSWER

if [ "$ANSWER" != "y" ]; then
    exit
fi

rm -rf "$PROJECT_DIR"

ln -s "$RELEASE_DIR" "$PROJECT_DIR"