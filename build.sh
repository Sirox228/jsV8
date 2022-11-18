echo "compiling for architecture: $1"

# export PATH="$PATH:$PWD/depot_tools/"

# alias gn=$PWD/depot_tools/gn

cd depot_tools/v8

# stupid way to fix can't find gn
# cp -r depot_tools/* v8
#rm tools/dev/gm.py
#cp ../gm-modded.py tools/dev/gm.py

# ./gn gen out/android_arm64.release

export PATH="$PATH:/home/runner/work/jsV8/jsV8/depot_tools"

case "$1" in
    armv7-a)
        # python tools/dev/gm.py android_arm.release
        gn gen out.gn\myandroid --args='is_debug=false target_cpu="arm" v8_target_cpu="arm" target_os="android" is_component_build=false v8_use_snapshot=false v8_enable_i18n_support=false'
        ninja -C out.gn/myandroid.release
        ;;
    armv8-a)
        python tools/dev/gm.py android_arm64.release
        ;;
    *)
        echo "you didn't specify an architecture or specified invalid one (available options: armv7-a, armv8-a)"
        exit 1
        ;;
esac
cd ../../
ls
