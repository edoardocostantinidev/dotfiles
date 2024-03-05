#!/bin/bash

set -ex

cp -r /etc/nixos/*.nix ./nixos/
git add -A
git commit -am "Bump nix"