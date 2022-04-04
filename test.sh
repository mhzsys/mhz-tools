#!/bin/bash

GOVERSION=$( curl "https://go.dev/VERSION?m=text" )

echo "Installing GO version: $GOVERSION"