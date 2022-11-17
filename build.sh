echo "compiling for architecture: $1"

PWD=$(pwd)

# export PATH="$PATH:$PWD/depot_tools/"

# alias gn=$PWD/depot_tools/gn

rm v8/tools/dev/gm.py

cp gm-modded.py v8/tools/dev/gm.py

cd v8/tools/dev

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
