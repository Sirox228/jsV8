echo "compiling for architecture: $1"

cd v8/tools/dev

PWD=$(pwd)

export PATH="$PATH:$PWD/depot_tools"

case "$1" in
    armv7-a)
        python gm.py android_arm.release
        ;;
    armv8-a)
        python gm.py android_arm64.release
        ;;
    *)
        echo "you didn't specify an architecture or specified invalid one (available options: armv7-a, armv8-a)"
        exit 1
        ;;
esac

cd ../../
ls
