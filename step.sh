#!/bin/bash
set -e

pushd $(mktemp -d)
wget https://github.com/LucianoPAlmeida/variable-injector/releases/download/${variable_injector_version}/x86_64-apple-macosx10.10.zip
unzip x86_64-apple-macosx10.10.zip
cp -f x86_64-apple-macosx10.10/release/variable-injector /usr/local/bin/variable-injector
cp -f x86_64-apple-macosx10.10/release/libSwiftSyntax.dylib /usr/local/lib/libSwiftSyntax.dylib

#Check verbose
VERBOSE=""

if [ ${verbose} = "true" ]; then

    VERBOSE="--verbose"
fi;

TEMP_DIR=$(pwd)
popd

variable-injector --file ${files_paths} $VERBOSE --ignore ${vars_to_ignore} 