echo "compiling for architecture: $1"

PWD=$(pwd)

# export PATH="$PATH:$PWD/depot_tools/"

# alias gn=$PWD/depot_tools/gn

# stupid way to fix can't find gn
cd depot_tools
cp -r $(find . -name "*") /usr/bin
cd ../

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
