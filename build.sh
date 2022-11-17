echo "compiling for architecture: $1"

PWD=$(pwd)

# export PATH="$PATH:$PWD/depot_tools/"

# alias gn=$PWD/depot_tools/gn

cd v8
gclient sync
python gsutil.py config
./build/install-build-deps.sh

# stupid way to fix can't find gn
cp -r depot_tools/* v8/tools/dev
rm v8/tools/dev/gm.py
cp gm-modded.py v8/tools/dev/gm.py

cd v8/tools/dev

./gn gen out/android_arm64.release

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
