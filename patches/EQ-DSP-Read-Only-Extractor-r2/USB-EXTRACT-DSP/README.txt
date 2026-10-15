EQ & DSP READ-ONLY EXTRACTOR r2

Copy the CONTENTS of this folder to an otherwise empty USB drive and add the
known-compatible lsec6521update file at the USB root. Do not combine it with
the patch installer or restore payload.

After the updater completes, return the `eqdsp-dsp-extract-r2` folder created
on the USB drive. The extractor does not change audio settings, capture audio,
or copy the complete package database.

r2 replaces an `awk` package lookup that is unavailable on this firmware and
adds selected primary audio HAL/policy files needed for static analysis.
