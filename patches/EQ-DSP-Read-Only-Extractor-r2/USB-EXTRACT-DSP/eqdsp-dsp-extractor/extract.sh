#!/system/bin/sh
# Offline read-only extraction. No pm, dumpsys, services, remounts or tuning.
EQDSP_OUT=/storage/sdcard1/eqdsp-dsp-extract-r2
mkdir -p "$EQDSP_OUT" || exit 1
exec >"$EQDSP_OUT/extraction.log" 2>&1 || exit 1
set -x
EQDSP_FAILURES=0
copy_file() {
    [ -f "$1" ] || { echo "NOT PRESENT: $1"; return 0; }
    EQDSP_NAME=$(echo "$1" | sed 's#^/##;s#/#-#g')
    cp "$1" "$EQDSP_OUT/$EQDSP_NAME" || EQDSP_FAILURES=$((EQDSP_FAILURES+1))
}
copy_pattern() {
    EQDSP_PATTERN="$1"
    EQDSP_MATCHED=0
    # Patterns passed here are fixed by this script and contain no user input.
    for EQDSP_MATCH in $EQDSP_PATTERN; do
        [ -f "$EQDSP_MATCH" ] || continue
        EQDSP_MATCHED=1
        copy_file "$EQDSP_MATCH"
    done
    [ "$EQDSP_MATCHED" = 1 ] || echo "NO MATCH: $EQDSP_PATTERN"
}
extract_package() {
    echo "Looking up package metadata: $1"
    # packages.xml is read locally but is never copied/exported. Only the
    # selected packages' code paths are retained; no global app inventory.
    if [ ! -r /data/system/packages.xml ]; then
        echo "MISSING: packages.xml; package APK paths not resolved."
        return
    fi
    # This Android 8.1 firmware has sed but no awk. Package entries are one
    # line each in packages.xml, so resolve only the requested package line.
    EQDSP_PACKAGE="$1"
    EQDSP_PATHS=$(sed -n "/name=\"$EQDSP_PACKAGE\"/s/.*codePath=\"\([^\"]*\)\".*/\1/p" /data/system/packages.xml)
    if [ -z "$EQDSP_PATHS" ]; then echo "PACKAGE NOT FOUND: $1"; return; fi
    # Android package code paths have no whitespace on this firmware.
    for EQDSP_DIR in $EQDSP_PATHS; do
        case "$EQDSP_DIR" in *..*) echo "Rejected path"; continue;; esac
        case "$EQDSP_DIR" in
            /system/app/*|/system/priv-app/*|/oem/app/*|/oem/priv-app/*|/vendor/app/*|/vendor/priv-app/*|/data/app/*) ;;
            *) echo "Rejected non-app path: $EQDSP_DIR"; continue;;
        esac
        if [ -f "$EQDSP_DIR" ]; then
            case "$EQDSP_DIR" in *.apk) copy_file "$EQDSP_DIR";; esac
        elif [ -d "$EQDSP_DIR" ]; then
            for EQDSP_APK in "$EQDSP_DIR"/*.apk; do copy_file "$EQDSP_APK"; done
            for EQDSP_LIB in "$EQDSP_DIR"/lib/*/*.so; do copy_file "$EQDSP_LIB"; done
        fi
    done
}
echo "EQ & DSP service/HAL read-only extractor r2; $(date)"
extract_package com.syu.ms
extract_package com.syu.eq
for EQDSP_FILE in \
    /system/lib/libmedia.so /system/lib64/libmedia.so \
    /vendor/lib/soundfx/libvisualizer.so /vendor/lib64/soundfx/libvisualizer.so \
    /vendor/etc/tiny_hw.xml /vendor/etc/codec_pga.xml /vendor/etc/audio_para \
    /vendor/etc/audio_hw.xml /vendor/etc/audio_policy.conf \
    /vendor/etc/audio_policy_configuration.xml /vendor/etc/audio_effects.conf \
    /system/etc/audio_policy.conf /system/etc/audio_policy_configuration.xml \
    /system/etc/audio_effects.conf \
    /system/etc/tiny_hw.xml /system/etc/codec_pga.xml \
    /vendor/lib/libvbeffect.so /vendor/lib/libvbpga.so /vendor/lib/libdumpdata.so \
    /vendor/lib/libaudiomiscctl.so /vendor/lib/libAudioCustomMmi.so \
    /vendor/lib/libfminterface.so /vendor/lib/libFMHalSource.so \
    /vendor/lib/libresample48kto44k.so \
    /system/lib/libaudioutils.so /system/lib64/libaudioutils.so \
    /vendor/lib/libaudioutils.so /vendor/lib64/libaudioutils.so; do
    copy_file "$EQDSP_FILE"
done
for EQDSP_PATTERN in \
    '/system/framework/*syu*.jar' '/system/framework/*fyt*.jar' \
    '/system/lib/hw/audio.primary*.so' '/system/lib64/hw/audio.primary*.so' \
    '/vendor/lib/hw/audio.primary*.so' '/vendor/lib64/hw/audio.primary*.so' \
    '/system/lib/hw/audio_policy*.so' '/system/lib64/hw/audio_policy*.so' \
    '/vendor/lib/hw/audio_policy*.so' '/vendor/lib64/hw/audio_policy*.so'; do
    copy_pattern "$EQDSP_PATTERN"
done
echo "No audio dumps, identifiers, partition images or user settings collected."
echo "Copy failures: $EQDSP_FAILURES. Missing files are reported above."
if command -v sha256sum >/dev/null 2>&1; then
    for EQDSP_FILE in "$EQDSP_OUT"/*.apk "$EQDSP_OUT"/*.so "$EQDSP_OUT"/*.jar "$EQDSP_OUT"/*.xml; do
        if [ -f "$EQDSP_FILE" ]; then sha256sum "$EQDSP_FILE"; fi
    done
fi
echo "Read-only extraction r2 finished: $(date)"
sync
[ "$EQDSP_FAILURES" = 0 ]
