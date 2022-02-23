#!/bin/sh

set -e

if [ -z ${SERVERKEY+x} ]; then
    echo "No Server Token Found, check secret...";
else
    echo "Authentication using Server ";
        sh -c "jfrog config import $SERVERKEY"
        sh -c "jfrog rt ping"
fi

for cmd in "$@"; do
    echo "Running '$cmd'..."
    if [ "$cmd" != "-v" ]; then
        if sh -c "jfrog docker scan $cmd"; then
            # no op
            echo "Successfully ran '$cmd'"
        else
            exit_code=$?
            echo "Failure '$cmd', exited with $exit_code"
            exit $exit_code
        fi
    else
        sh -c "jfrog $cmd"
        echo "Successfully ran '$cmd'"
    fi
done