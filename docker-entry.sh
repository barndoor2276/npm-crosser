#!/bin/bash

PRINT_USAGE(){
        echo "Usage: {docker command} [OPTION] [args]"
        echo ""
        echo "Options:"
        echo -e "\t-i|--install npm1 [npm2 npm3...]"
}

case "$1" in
    -i|--install)
        if [[ ! -z "${@:2}" ]]; then
            cd proj
            echo "npm --arch=arm --unsafe-perm --no-save install ${@:2}"
            npm --arch=arm --unsafe-perm --no-save install "${@:2}"
            exit 0
        fi
        echo "Incorrect or missing arguments."
        echo ""
        PRINT_USAGE
        exit 1
        ;;
    *)
        PRINT_USAGE
        exit 1
        ;;
esac

exit 1