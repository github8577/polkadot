# Copyright 2018 Parity Technologies (UK) Ltd.
# This file is part of Polkadot.

# Polkadot is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Polkadot is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Polkadot.  If not, see <http://www.gnu.org/licenses/>.

#! Obtains the Polkadot version from the Cargo.toml file

#!/bin/sh
# version.sh

# Install ggrep since it has Perl compatibility to support regular 
# expressions using lookaheads
# Reference: https://stackoverflow.com/a/26064330/3208553

# Enable dupe and install
brew tap homebrew/dupes
brew install homebrew/dupes/grep
# Install the perl compatible regular expression library
brew install pcre

SUCCESS=0                      # if grep lookup succeeds

CARGO_FILE='../Cargo.toml'     # Polkadot Rust configuration $CARGO_FILE
GREP_OPTS='-H -A 5 --color'
# regular expression that grabs the version number from the line containing
# the text `version = "`, and excludes the `"` at the end of the line 
TARGETSTR='((?<=version = ")(?!")([0-9].[0-9].[0-9]))'

POLKADOT_VERSION=$(ggrep -P $GREP_OPTS "$TARGETSTR" "$CARGO_FILE")

echo

if [ $? -eq $SUCCESS ]
then
  echo "Polkadot version $POLKADOT_VERSION found in $CARGO_FILE"
else
  echo "Polkadot version not found in $CARGO_FILE"
fi

# References:
# - http://tldp.org/LDP/abs/html/textproc.html
