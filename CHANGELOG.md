# EQ & DSP — Changelog

## 1.67-beta — 17 October 2026 (source build 88)

- Add independent C1–C3 crossover slots with live response/DSP editing, verified Cancel and accepted-slot storage; Undo tracks selection changes rather than custom edits.
- Add a draggable SINE/PINK/WHITE test bar with frequency entry, logarithmic slider and level/playback controls; launch beside Speaker Test and return to the dashboard.
- Align toolbar groups, equalize display controls, compact Lock EQ and separate Settings checkbox sections while preserving their layout.
- Source-only update using the existing Processing r3 patch. Head-unit layout, playback/capture and hardware acceptance remain pending.

## 1.66-beta — 17 October 2026 (source build 87)

- Fix crossover group OFF/ON without replaying EQ, retain filter settings, serialize live filter/Notch slider changes and allow preset recovery after failed DSP verification.
- Refine crossover selector/menu, 20 Hz OFF styling and Subwoofer layout/NOTCH toggle/Q labels; isolate changed-control indicators, remove EQ bank-button change highlighting and refresh selected-bank readback.
- Source-only update; head-unit confirmation is still required, including the intermittent Rear EQ display report.

## 1.65-beta — 17 October 2026 (source build 86)

- Add eight app-designed HPF/LPF choices, themed response/F3 selection and compact crossover, sub EQ and independent Surround controls; Front/Rear crossover group retains its OFF settings.
- Preserve exact filter banks in presets and bypass; guard incomplete saves, retain retryable Undo/A-B restores and describe DSP changes in history.
- Clarify installed patch versions/checksum errors and offer download-again actions; combined DSP download awaits the owner's finalized ZIP.
- Source-only update for Processing r3 protocol 2, with guarded legacy fallback. Head-unit layout/audio acceptance remains pending.

- Grouped change points by release; minor visual adjustments are combined.
- Historical entries describe their own release. Later entries supersede earlier behavior; a source-build entry does not imply a supplied APK or hardware verification.
- [Full pre-cleanup notes, including detailed UI changes](https://github.com/colonel-lp/FYT-EQ-DSP-APP/blob/842f51677a62313230242b46aee4f20599fcfb1a/CHANGELOG.md).

## Processing service diagnostic r4 — 16 October 2026

- Live Front/Rear HPF shape checks remain immediate; coefficient mismatches receive readback-only retries every 50 ms for up to 1.5 seconds.
- Requires full verification before save; adds guarded rollback and retained LIV4 apply/rollback diagnostics for presets, bypass and Undo/A-B.
- Signed service r4 / installer 7 supplied; controller unchanged. Hardware acceptance remains pending.

## USB patch procedures — 16 October 2026

- Uses APK-free CHECK, patched-only INSTALL and factory-only RESTORE across applicable service/native procedures.
- Preserves verified, hash-named backups of actual installed files; improves exact rollback and system-app launcher/backup handling. Existing binary bytes and catalogues are retained.

## Processing service diagnostic r3 — 16 October 2026

- Adds conditional startup coefficient readback retries at 50 ms intervals within 1.5 seconds; immediate checks and existing fallback remain.
- Adds STG3 startup evidence without changing normal live-control timing or the controller version.

## Processing r2 diagnostic r2 — service-only, 16 October 2026

- Adds pre-fallback HPF/control-register snapshots to the bounded 64-integer diagnostic report.
- Supplies the signed service with diagnostic-r1 upgrade and factory restore; retains readiness/fallback guards and does not claim a hardware fix.

## v1.64-beta — source build 85

- Adds direct scrollbar dragging/track tapping in Loudness Adaptive Curve.
- Adds readable service mismatch details and diagnostic-r1 APK recognition; supplies the signed diagnostic service/USB procedures.
- Controller remains source-only; the Processing hardware fault is not claimed fixed.

## v1.63-beta — source build 84

- Adds SERVICE PATCHES diagnostics: separate detection/readiness, protocol/profile/status, raw replies and service APK identity.
- Explains why DSP PROCESSING is unavailable without bypassing guards.
- Compacts adaptive sliders and makes FIXED immediately apply/persist the displayed depth. Source-only; no hardware fix claimed.

## v1.62-beta — source build 83

- Corrects Loudness child-window stacking, slider sizing/placement and dismissal.
- Uses horizontal Adaptive Curve sliders with scrollbar while retaining live persistence, presets and CANCEL/BACK behavior. Source-only.

## v1.61-beta — source build 82

- Adds independent clean TA/Surround routing plus DSP PROCESSING: Butterworth/Linkwitz–Riley HPF/LPF shapes, sub polarity and one sub PEQ.
- Corrects predicted vendor HPF Q to 0.5; Post-EQ remains an approximation.
- Integrates extension state with preset categories, comparisons, Undo/A-B and bypass; preserves guarded stock/r1 compatibility and verified service rollback/persistence.
- Includes Loudness popup and spectrum-height corrections. This entry records source work; signed service delivery and hardware findings are recorded separately.

## v1.60-beta — source build 81

- Reuses main preset dialogs, themed controls and correctly anchored Loudness menus/sliders.
- Limits global Loudness Undo/history to ON/OFF; parameters, curve and cutoff stay current.
- Keeps continuous preset comparison across callbacks/reopening and protects newer edits from stale readback.

## v1.59-beta — source build 80

- Redesigns the Loudness popup and complete presets, including STOCK and legacy-file compatibility.
- Persists all live/unnamed edits; BACK closes and CANCEL restores the opening state independently of file management.
- Extends display-only spectrum gain to +24 dB.

## v1.58-beta — source build 79

- Models STOCK/CUSTOM Loudness in Post-EQ using current parameters/effective volume, with a labelled fallback.
- Adds separate Loudness presets, cutoff storage and modified indication while preserving ON/OFF; partial-save controls were later replaced in 1.59.
- Refreshes hardware readback after volume changes and updates verified patch downloads/catalogue compatibility. Carries the CRLF installer fix.

## v1.57-beta — source build 78

- Adds patched-service Loudness controls: STOCK/CUSTOM, fixed/adaptive depth, corner frequencies and HiBoost, with guarded readback/persistence.
- Adds volume-cutoff automation with locks, fresh-state and bypass/settling safeguards.
- Introduces live preview, OFF staging and CANCEL restoration; parameter history/save behavior was revised in 1.59–1.60.

## v1.56-beta — source build 77

- Adds display-only spectrum gain (initially +12 dB), theme-saved per-style Decay and floor-line fading.
- Releases the Joying display-timeout override when backgrounded and bounds failed-restore retries.
- Aligns preset/theme confirmation button spacing.

## v1.55-beta — source build 76

- Requests FIXED Visualizer capture gain and adds session-only FIXED/AUTOMATIC comparison with actual-mode/native peak/RMS diagnostics.
- Retains FFT processing and 8-bit capture; quiet-detail/real-unit comparison remains a limitation.

## v1.54-beta — source build 75

- Corrects false 20–22 Hz edge energy using Hann-weighted DC removal while retaining genuine bass and the existing RMS/silence gate.
- Preserves FFT fallback, smoothing, decay and Post-EQ; finite-window tone spreading remains expected.

## v1.53-beta — source build 74

- Adds optional P²BASS OFF ramping; default direct switching preserves selected gains and preset behavior.
- Speeds verified bypass completion through fresh callbacks, batched TA-dependent restoration and removal of redundant waits; retains required Q/Loudness guards.
- Refines Settings layout/touch alignment and hides selected-band shading/bell details with EQ sliders.

## v1.52-beta — source build 73

- Bounds each bank spectrum to its EQ-centre range plus one octave, capped at 20 Hz–20 kHz.
- Adds themeable changed-value indication with a separate display preference.
- Trials 100 ms bypass staging and aligns Settings controls; preserves the archived system-app download outside the offered catalogue.

## v1.51-beta — source build 72

- Saves verified patch downloads directly to shared Downloads, with legacy permission handling, save verification and Retry Save.
- Removes offered system-app downloads, hides experimental loopback selection and reorganizes Settings.
- Prevents routine spectrum messages obscuring download-save feedback.

## v1.50-beta — source build 71

- Adds matched patch downloads with compatibility/integrity checks and bundled instructions; downloads do not execute scripts.
- Improves linked-frequency safeguards, frequency-only copy, full-bank F↔R direction selection and reverse page navigation.
- Corrects narrow EQ peaks and spreads spectrum smoothing across its range; updates Settings theming.
- Trials 200 ms bypass staging with existing confirmation/recovery retained; superseded by the 100 ms trial in 1.52.

## v1.49-beta — source build 70

- Loads maintained public changelog notes with bundled/cached offline fallback and version ordering.
- Keeps Download & Install independent of changelog-fetch failures and empty release descriptions.

## v1.48-beta — source build 69

- Adapts landscape layouts/popups while retaining proportions and matching touch coordinates; selects 2048 treble FFT when supported.
- Unifies update installation across lifecycle/OEM fallbacks; preserves verified downloads until installed-version confirmation.
- Improves package/version/signer/lineage and Android API compatibility checks; guards bypass/context handling and reduces drawing allocations.

## v1.47-beta — source build 68

- Fixes flat-USER confirmation around vendor Q-write coalescing and stored-bank saving; restores original EQ directly on exit.
- Releases failed restoration locks while retaining snapshots, fresh-state retry and confirmed live masks.
- Keeps Balance/Fade/Level/Amp/Volume editable through bypass; aligns Undo/A-B and preset comparison.
- Coordinates Hide/Show, Link, Smooth and Drag without changing DSP values.

## v1.46-beta — source build 67

- Adds saved BYPASS INCLUDES with live category changes, one original snapshot and confirmed targeted restoration.
- Integrates bypass with history, A/B, presets and failure/cancellation handling; excludes subwoofer processing.
- Reorganizes Settings and restores the shared spectrum ridge/smoothing geometry. Later releases correct vendor sequencing and timing.

## v1.45-beta — source build 66

- Improves startup/daily update checks and version detection from all attached APK assets; retains validated Download & Install.
- Preserves narrow FFT peaks, shared frequency mapping, spectrum headroom and elapsed-time decay.
- Coordinates Loudness OFF/settling before EQ/crossover bypass and restores Loudness last.

## v1.44-beta — source build 65

- Fixes AGP 8.x BuildConfig generation and adds the Changelog/update installer with daily checks and package/version/signer/integrity validation.
- Adds independent theme-saved smoothing for Aurora and both line styles on a shared logarithmic grid.

## v1.43-beta — source build 64

- Uses one shared temporally smoothed spectrum before Front/Rear Post-EQ, keeping expanded bass views consistent.

## v1.42-beta — source build 63

- Coordinates graph/slider reveal behavior with Link, Smooth and Drag; consumes reveal touches to avoid unintended edits.
- Adds linked-copy INFO and outside-tap dismissal while retaining live-editor restore rules.

## v1.41-beta — source build 62

- Updates slider/changed-marker theming and themes remaining dialogs; adds selectable/copyable preset values.
- Disables LINK when leaving page 2 and centres notifications.

## v1.40-beta — source build 61

- Restores linked frequency editing within both banks’ valid ranges and adds Drag EQ alignment safeguards.
- Coordinates page-2 actions and linked gain feedback; refines handles and changed markers.

## v1.39-beta — source build 60

- Fixes linked-frequency editor deadlock using active-bank limits; linked frequency mirroring was restored in 1.40.
- Adds range/clamping feedback and page-2 action staging; separates graph/popup-surface theming.

## v1.38-beta — source build 59

- Adds linked-frequency mismatch/copy choices with ordered-band validation, including preset arrays.
- Makes Update conditional on an editable preset/theme and adds bank-reset choices.

## v1.37-beta — source build 58

- Keeps hidden EQ controls protected by locks; refines Hide/Show and page navigation.
- Updates the default theme, off-state labels and Settings/page-3 appearance.

## v1.36-beta — source build 57

- Batches ordinary preset/history restoration and runs verified TA/sub gates concurrently.
- Reapplies TA-disturbed optional settings and retains final readback, cancellation and failure checks.

## v1.35-beta — source build 56

- Reduces preset/A-B/Undo pacing and first-check delays without removing gate order, readback or recovery.

## v1.34-beta — source build 55

- Unifies presets, A/B and Undo through a fresh-readback restore engine; resolves missing legacy fields against live settings.
- Preserves immutable history, exact crossover sections and preset identity; cancels obsolete delayed work.
- Corrects sub-filter labels and uses atomic preset updates with rename-collision checks.

## v1.33-beta — source build 54

- Restores sub gain/filters while enabled, then restores the saved enable state.
- Keeps Manage dialogs open through file actions and preserves preset/bypass A/B identity.

## v1.23-beta — source build 44

- Corrects physical left/right TA mapping on the tested unit and adds exact EQ/crossover bypass restoration.
- Adds remembered page navigation, graph/surface theming and optional fullscreen title; moves Speaker Test to Settings.
- Strengthens screen-awake/notification lifecycle handling.

## v1.21-beta — source build 42

- Corrects compact panel geometry, bank/control spacing and spectrum-selector sizing across layouts.
- Refines the approximate volume-dependent Loudness treble display.

## v1.20-beta — source build 41

- Refines all layout/fullscreen controls, graph space and page-3 navigation.
- Adds wake-lock support and improves the approximate compensated Loudness display. Source/device checks remain separate.

## v1.19-beta — source build 40

- Adds spectrum-only layout, persistent screen/layout controls and independent Post-EQ Bass/Crossover/Loudness modelling switches.
- Refines dashboard/Settings geometry and Aurora rendering. Models remain approximate.

## v1.18-beta — source build 39

- Adds four-channel spoken Speaker Test with temporary balance/fade routing and restoration.
- Adds experimental Loudness prediction and P²Bass gain ramping around OFF; audio transition validation remains required.

## v1.17-beta — source build 38

- Adds remembered dashboard layouts and Keep Screen On.
- Adds Bass 1024/2048/4096 and Treble 1024/2048 FFT choices with actual-size diagnostics/fallback; requires confirmation for experimental policy routing.
- Retains the separate Visualizer4096 companion; updates spectrum/theme controls. Source-only.

## v1.16-beta — Visualizer4096 companion (build 37)

- Requests 4096 waveform samples with supported-size fallback; more than 1024 on the tested unit requires the separate native patch.
- Uses Java Hann FFT with long bass/short treble windows, 600–1000 Hz blend and full one-sided range; avoids oversized Android packed FFT and stale callbacks.
- Leaves normal speaker routing and DSP/preset/theme/UI state unchanged. Controller update is separate from the native patch.

## v1.15-beta

- Restores Android Visualizer as the default and makes policy 0x2/0x3 explicit session-only experiments with warnings/fallback.
- Retains multi-resolution policy capture and adds a read-only native/audio extraction package.

## v1.14-beta

- Introduces privileged continuous policy capture and multi-resolution bass/treble FFT with fallback.
- Improves button/version diagnostics and trials a new privileged app path. Later releases restore Visualizer as default and retain only explicit policy experiments.

## v1.13-beta

- Reorganizes Theme/Settings controls and clarifies preset wipe-on-update.
- Changes the temporary privileged policy diagnostic to loopback-only 0x2; it can divert/mute playback and unregisters afterward.

## v1.10-beta

- Refines spectrum selector/Aurora controls and adds themeable inactive borders with legacy-theme compatibility.
- Separates toolkit/service identity and adds read-only ALSA diagnostics without claiming runtime DSP discovery.

## v1.09-beta

- Fixes spectrum style-ID mapping and dialog clipping; improves Settings text alignment.

## v1.08-beta

- Expands independent Line glow/Aurora glow controls with theme migration and adjusts coloured-bar thresholds.
- Reorganizes Options/System panels.

## v1.06-beta

- Improves low-frequency FFT resolution using DC-removed Hann waveform input and compatibility fallback; adds silence-aware plotting.
- Refines spectrum selector, hidden-EQ labels and Aurora controls.

## v1.05-beta

- Adds optional preset categories, wipe-on-update and stored-value review.
- Introduces in-graph spectrum selection/style editors and improves low-frequency power interpolation.
- Reorganizes Hide EQ/display controls and independent glow/Aurora adjustments.

## v1.04-beta

- Restores earlier Aurora appearance, retains the alternate clipped style and adds independent theme colours.
- Compacts preset/theme management and app-themed rename dialogs.

## v1.03-beta

- Excludes Amp/Subwoofer enable state from presets at this release; later optional-category behavior supersedes this.
- Changes global-lock Level behavior and improves Aurora gradient/trail clipping; refines Settings/Smooth feedback.

## v1.02-beta

- Refines Aurora timing, shadow/fill clipping, style naming and live hue controls.
- Adjusts spectrum long-press timing and non-fullscreen Settings appearance.

## v1.01-beta

- Persists main display/edit state across lifecycle recreation and adds Diagnostics SHARE.
- Improves spectrum interpolation, active-bank Post-EQ and continuous Aurora rendering.
- Reorganizes Settings/theme controls and EQ label alignment.
