#!/bin/bash
set -e

pushd $(mktemp -d)
wget https://github.com/LucianoPAlmeida/variable-injector/releases/download/${variable_injector_version}/variable-injector-${variable_injector_version}-x86_64-apple-macosx10.10.zip
unzip variable-injector-${variable_injector_version}-x86_64-apple-macosx10.10.zip

#Check verbose
VERBOSE=""
if [${verbose} = true ]; then
    VERBOSE="--verbose"
fi;

TEMP_DIR=$(pwd)
popd

${TEMP_DIR}/variable-injector-${variable_injector_version}-x86_64-apple-macosx10.10/variable-injector --file ${files_paths} --ignore ${vars_to_ignore} $VERBOSE