# EQ & DSP — Changelog

## v1.52-beta — source build 73

- Bounds each bank's spectrum to one octave below its first centre and above its last, capped at 20 Hz and 20 kHz. A Rear bank spanning 25–100 Hz now displays 20–200 Hz. Excludes outside frequencies and limits colour/curve detail in narrow margins while preserving shared FFT data, smoothing and full-range Front rendering.
- Adds a saved CHANGED INDICATOR theme colour and persistent INDICATE CHANGES option under OTHER (enabled by default). Selector dots are smaller, centred and have 12 px edge clearance. Changed included preset values use text colour; Balance/Fade handles use outlines; Level uses text only. Respects unchecked/missing preset categories, keeps Theme comparison separate and excludes Loudness.
- Trials 100 ms for the four bypass EQ staging/USER-restore waits, retaining command order, fresh readbacks, timeouts, recovery and other ramps. Timing and audible transitions require head-unit confirmation.
- Makes Settings right-panel buttons the System-button height. Speaker Test and Download Patches match the full System-row width; Speaker Test has 6 px vertical panel padding, the enlarged Patches panel places Download Patches 6 px above its bottom, and Visualizer controls align with System controls across viewports.
- Reconciles the canonical Markdown user guide, documentation links and functionality records. Preserves the archived public system-app ZIP while keeping it out of the offered catalogue.

## v1.51-beta — source build 72

- Saves verified patch ZIPs directly into shared Downloads, avoiding the OEM save-location picker that did not appear. Android 9 and earlier request storage permission when needed; Android 10+ use the Downloads provider. Verifies saved bytes, reports the saved filename/location, preserves existing unrelated files and offers Retry Save after a failure.
- Suppresses the routine spectrum-start toast on activity resume so it does not obscure patch-save feedback. Capture errors and explicit capture changes retain their messages.
- Removes system-app install/uninstall downloads from the bundled and public catalogues, and ignores those entries in older online catalogues. Retains the private installer procedures.
- Hides the Loopback Policy dropdown while retaining its capture implementation. Renames the Settings panel to PATCHES & EXPERIMENTAL and moves Download Patches below the Visualizer controls.
- Moves OTHER and all its checkboxes together to the bottom of the same Settings box, beneath Post-EQ modelling and Bypass Includes.
- Removes the read-only extractor compatibility text beneath its download button; download instructions and ZIP contents remain intact.

## v1.50-beta — source build 71

- Trials 200 ms EQ staging/USER restore delays in bypass, retaining fresh readback confirmation, timeouts, recovery, Loudness settling and the P²Bass ramp. Live includes, presets, Undo and A/B retain their existing transaction handling; timing still needs confirmation on the head unit.
- Spreads Aurora and both line-style smoothing across 0–100. The previous 96-point appearance is at 80; saved values migrate by effective sample density. Keeps working decay, FFT calculations, shared bass/full-range mapping and the per-style slider positions.
- Linked slider frequency copies now change only frequency and never replay the initiating gain drag. Gains and Q remain unchanged; a new compatible drag can edit gains.
- Linked Drag EQ requires matching Front/Rear frequencies across all bands. Its mismatch dialog offers frequency-only copy in either direction or Cancel, and active Drag EQ is disabled if Link/frequencies become incompatible.
- F<>R opens a direction dialog for the existing full-bank copy (frequency, Q and gain). Removes double-click direction and long-press Undo shortcuts. Both copy paths keep frequencies ordered while writing; Undo remains available.
- Long-pressing page selectors 1 or 2 cycles backwards, matching double-click. Keeps page 3 X behavior.
- Includes every exact band-centre sample in combined and selected EQ curves, correcting understated narrow peaks. Keeps the 48 kHz peaking-filter model and existing graph axes; physical DSP/Q matching remains unconfirmed.
- Settings checkbox-section titles, System App/Patches/Experimental title, System title and version text follow the Text colour picker. Aligns Wipe unchecked values left and renames the highlighted button Changelog/Update.
- Adds Download Patches below Loopback Policy. A public ZIP catalogue checks device/Android/ABI constraints and exact readable native SHA-256 signatures; unknown or unreadable files remain unverified. Always offers the read-only extractor, plus the supported system-app install/uninstall and Visualizer install/restore packages.
- Shows each ZIP's README warnings/instructions before download, verifies ZIP size/SHA-256, and saves through Android's document picker. Downloads do not execute scripts. Packages require the compatible firmware updater trigger; the system-app package requires the owner's existing signed APK. Native scripts recheck signatures before replacement.

## v1.49-beta — source build 70

- Reads the complete Changelog list from the maintained public CHANGELOG.md file.
- Bundles the same file for offline use and retains the last successfully fetched copy.
- Keeps full notes for versions whose GitHub release descriptions are empty.
- Shows notes for the available update first and keeps Download & Install.
- Loads changelog content independently of update detection, so a file/network error does not hide an installable update.

## v1.48-beta — source build 69

- Uses the available landscape viewport on larger and smaller resolutions.
  Dashboard panels and graph/slider space adapt to the aspect ratio; text,
  round indicators and icons retain their proportions. Settings keeps a uniform
  control scale with adapted panel spacing. Touch coordinates and popup anchors
  follow the same transforms. Retains the 1024×600 baseline and landscape-only
  orientation. Native dialogs scale with the page and constrain oversized
  content to the viewport with scrolling.
- Defaults the Treble Visualizer window to **2048** after the active capture
  path confirms that size is available. Stock/smaller paths fall back to 1024;
  explicitly saved selections are preserved. Diagnostics continues to show
  requested and actual capture/window sizes.
- Startup and Changelog **Download & Install** share the same installer path.
  Handoff waits for a resumed activity, retains a verified staged download across
  activity recreation, and carries content-URI read permission and ClipData.
  Tries Android's install-package action, then the OEM view-action fallback.
  Successful handoff dismisses the initiating dialog; launch or permission
  failures release the buttons for retry instead of leaving an opening message.
- Places the available release and its changelog first. Merges published and
  bundled older entries in version order without repeating the same version.
- Replaces the API-24-only Content-Length call with an API-23-safe header parser.
  Checks update directory creation, partial-download deletion and APK cleanup.
  Failed cleanup retains bookkeeping for retry. A verified APK is retained
  until the installed version confirms the update has completed.
- Uses SDK-gated long version codes and signing APIs on Android 9+ while retaining
  legacy Android 6/8.1 support. Rejects wrong-package, older and unrelated-signer
  APKs; modern forward signing lineage is considered while Android remains the
  final installation authority.
- Captures and guards bypass snapshots once in status, preset/history, A/B and
  diagnostic paths. Guards provider context and reflected audio-policy status.
  Retains bypass DSP sequencing and independent Balance/Fade/Level/Amp/Volume
  behavior, Undo/A/B and existing capture fallback.
- Adds click notifications to dashboard, Settings and Theme touch handling and
  reuses slider/thumb, Settings outline and graph-hit buffers. Leaves the working
  Aurora/line rendering, smoothing and decay unchanged.

## v1.47-beta — source build 68

- Fixes the bypass `flat USER bank not confirmed` failure. Joying's `bm`/`bs`
  dispatcher combines same-band Q edits over 100 ms, so v1.46's immediate
  change-and-return could erase the detour before the device received it.
  Bypass now holds the detour through dispatch and the following 300 ms USER
  save, confirms the stored flat bank and Q, then restores and confirms Q in
  a separate step. Live crossover changes continue to keep EQ flat.
- Bypass exit restores the original factory mode or complete saved USER EQ
  directly, without requiring another flat-bank staging operation. Preset
  loading and ordinary edits can proceed after the saved state is confirmed.
- Failed restores release the restoring lock while retaining the original
  snapshot for retry. Failed checkbox choices return to the last applied mask.
  Retries refresh DSP state before comparing values, so partial restoration
  cannot make stale readbacks cause required writes to be skipped. Failed entry
  delivers its completion exactly once after recovery.
- Retains selectable bypass, Undo/history and A/B behavior, Loudness settling,
  P²Bass ramps, Settings layout and the v1.46 spectrum rendering.
- **Balance, Fade, Output Level, Amp On/Off and Volume** can be changed while
  bypass stays active. Their edits remain when bypass is turned off; Undo
  restores them without leaving the bypass session, and A/B returns to their
  captured values. Preset modified status accounts for saved optional control
  changes while ignoring temporary bypass processing.
- Turning **SMOOTH** or **LINK** on shows the EQ curve, matching **DRAG EQ**
  across dashboard layouts. **HIDE EQ** turns off Link, Smooth and Drag EQ,
  cancels pending Smooth adjustment and keeps the current DSP values. Showing
  EQ again leaves those modes off. UI choices are saved.
- Updates the in-app changelog and APK output name to `EQ-DSP-v1.47-beta.apk`.

## v1.46-beta — source build 67

- Adds **BYPASS INCLUDES** in the Settings left pane: **Bass Enhancement |
  Crossover**, then **TA/Surround | Loudness**, in two checkbox rows. Choices
  are saved separately from Post-EQ modelling and from history snapshots.
  Defaults are Crossover and Loudness checked, Bass Enhancement and TA unchecked.
- EQ is always flattened during bypass. Crossover included selects STANDARD
  with all four Front/Rear HPF sections at Full (20 Hz); Crossover excluded
  selects a flat USER curve and preserves/restores the original four sections.
  Subwoofer filters and subwoofer enable remain outside bypass.
- Checkbox changes apply live while bypass stays enabled, including from
  Settings. Only changed categories are disabled/restored; the original session
  snapshot is retained. Unchecking restores the original value, including OFF.
  Rapid changes coalesce to the latest request without a full preset replay.
- Stages a flat custom USER bank before mode changes, waiting for the firmware's
  300 ms custom-save job and confirming every active band's readback. This
  prevents USER mode from loading the stored non-flat curve during live changes.
  STANDARD is selected last, after flat EQ and all four Full sections are confirmed.
- Retains P²Bass gain ramps, Loudness gain/SETUP settling and TA gate/delay/IIR
  restoration. Waits for an in-flight ordinary Loudness write before bypass
  transitions. Refreshes states and repairs known side effects with targeted
  writes. Missing original values reject the affected choice; failed readbacks
  do not report success and retain the restore snapshot for retry.
- Integrates bypass with Undo/history, A/B and ordinary edits/preset saving.
  Entry, exit and completed live changes each create one history action.
  Live Undo changes the mask without leaving bypass; A/B restores the normal
  comparison and returns to the captured mask and original snapshot. Temporary
  disabled values do not dirty or get saved into presets. DSP edits restore the
  original settings before calculating/applying the edit. A drag started during
  bypass restores it and asks for a fresh drag against the original curve.
- Highlights BYPASS only after its target is confirmed; Diagnostics reports
  pending/incomplete transitions, the confirmed mask and any restore failure.
  Normal Back/teardown retains the Binder callback path until the finite restore
  finishes, rather than discarding the delayed restoration jobs.
- Moves **SPEAKER TEST** into its own middle-right box, shortens/reflows the
  upper experimental box, and preserves the bottom System box and its controls.
  **CHANGELOG** now uses the same permanent accent/border highlight as BACK.
- Restores Aurora's earlier peak-sample → weighted-average → rounded-curve
  geometry on the shared frequency grid. **Smooth 0** retains full detail;
  **Smooth 60** uses the old 96-point averaging width; higher settings soften
  the ridge further. Narrow FFT tones remain represented before averaging;
  smoothing can reduce their drawn height, rather than inflate adjacent levels.
- Keeps the independent theme-saved Smooth slider for Aurora and both line
  styles, below all other sliders. Both views share the smoothed frequency
  curve. Corrected FFT sampling, positive headroom, graph labels and the shared
  Post-EQ button remain; the working elapsed-time attack/decay is unchanged.
- Updates the in-app changelog and APK output name to `EQ-DSP-v1.46-beta.apk`.

## v1.45-beta — source build 66

- Performs a fresh update check at startup, retains the daily automatic check
  and immediately checks when Changelog is opened. A failed network check no
  longer consumes the daily check interval.
- Recognises APK versions from asset filenames when the release tag/title is
  generic, including `Beta-Release` / `test`. Examines every attached APK,
  selects a newer release and explains missing versions, invalid links and
  already installed/older releases in the changelog.
- Keeps Download & Install as the sole download action. Package, signing
  certificate, higher APK versionCode and available SHA-256 checks remain in
  place; the staged APK is deleted on the first launch after successful install.
- Preserves the strongest native FFT bin in each shared logarithmic display
  cell. Narrow treble tones are no longer lost by sampling only cell centres.
  Uses the same frequency nodes, including both banks' axis anchors, when
  drawing full-range and bass-expanded curves.
- Softens the common ridge with a peak-preserving Gaussian envelope and
  elapsed-time attack/release. Default Smooth 60 is tuned toward the earlier
  Aurora softness; layered hue, glow and trails remain. Main ridge and ghost
  decay on animation frames, including stale captures, instead of depending
  on FFT callbacks or abruptly switching to the sparse analyser.
- Preserves headroom through spectrum/Post-EQ processing and clips at the
  graph viewport, removing the artificial unity ceiling near displayed +8 dB.
  Model gain fades continuously near the plotting floor, and decorative ridge
  motion fades with silence.
- Keeps the existing graph labels and shared Post-EQ button. Aurora and both
  line styles retain their independent, theme-saved Smooth sliders below all
  other sliders. With Post-EQ enabled, different Front/Rear filter settings
  can still produce different predicted responses.
- Includes the committed bypass correction: saves Loudness, confirms it is
  OFF and waits for Joying's gain transition before bypassing EQ/front-rear
  HPFs; restores EQ/HPFs before restoring Loudness. Cancellation, unavailable
  readback and command failures abort entry. Bypass intentionally removes
  front/rear HPFs, including an active 45 Hz crossover.
- Names the built APK `EQ-DSP-v1.45-beta.apk`.

## v1.44-beta — source build 65

- Explicitly enables Gradle BuildConfig generation, fixing the updater's four
  missing-symbol errors when compiling with Android Gradle Plugin 8.x.
- Replaces Exit App with a Changelog dialog containing the installed build's
  notes and published release history. Opening it immediately checks the public
  `FYT-EQ-DSP-APP` release channel and offers Download & Install when a newer
  published beta or full release is available.
- Adds a silent automatic update check at most once every 24 hours. No GitHub
  credentials are stored in the APK and there is no separate download-only
  action.
- Downloads updates into app-specific storage, checks the GitHub SHA-256 digest
  when present, and always validates the package name, higher version code and
  signing certificate before opening Android's installer. The staged APK is
  deleted on the first launch after a successful update.
- Adds independent 0–100 Smooth sliders for Line • simple, Line • glow and
  Aurora. Each defaults to 60, is saved with Themes and appears beneath that
  style's other sliders.
- Applies the new visual smoothing on the common fixed logarithmic frequency
  grid before graph remapping. The full-range and bass-expanded views therefore
  remain consistent while temporal response, bars and Post-EQ calculations
  remain unchanged.
- Names the built APK `EQ-DSP-v1.44-beta.apk`.

## v1.43-beta — source build 64

- Calculates one temporally smoothed input spectrum on a fixed 20 Hz–20 kHz
  logarithmic grid, then applies the selected Front or Rear Post-EQ model. An
  expanded bass axis now remaps the same underlying values instead of changing
  the smoothing width or apparent level; the existing shared Post-EQ button is
  unchanged.
- Adds fixed-grid spectrum regression tests.
- Names the built APK `EQ-DSP-v1.43-beta.apk`.

## v1.42-beta — source build 63

- Turning LINK, SMOOTH or DRAG EQ off preserves the current visibility of the
  gain sliders and EQ curve instead of revealing hidden controls.
- While SMOOTH or DRAG EQ is active, touching the graph reveals both the gain
  sliders and EQ curve if either is hidden. The revealing touch is consumed so
  it cannot also alter a gain using the previous graph geometry.
- Adds an INFO button beside CANCEL in both linked-frequency copy dialogs. It
  explains why an invalid Front/Rear copy direction can be unavailable and how
  to align the bands instead.
- Allows every app popup and dialog to close when the user taps outside it,
  including the frequency and Q slider editors. Live editors retain their
  existing cancel/restore behaviour when dismissed this way.
- Names the built APK `EQ-DSP-v1.42-beta.apk`.

## v1.41-beta — source build 62

- Themes the BAL, FADE, LEVEL and VOL slider handles with the Button ON Border
  colour outside and the Panels colour inside.
- Narrows the vertical EQ gain handles to 22 × 8 px while retaining the same
  12 px centred horizontal line.
- Automatically disables LINK when leaving page 2 and shows a centred
  `LINK EQ disabled` toast.
- Adds a COPY button to the preset View Values dialog and makes its text
  selectable.
- Applies the active theme to all remaining native app alerts, including
  confirmations, warnings, preset validation and diagnostics dialogs.
- Centres app toast notifications while leaving their system appearance
  unchanged.
- Names the built APK `EQ-DSP-v1.41-beta.apk`.

## v1.40-beta — source build 61

- Restores true linked frequency editing: a frequency-box change writes the
  corresponding Front and Rear bands together and is limited to the frequency
  range valid in both banks. A clear conflict dialog replaces an unchecked or
  impossible individual edit.
- Adds the same Front/Rear frequency-match preflight to DRAG EQ. A mismatch
  offers the valid copy directions and asks the user to restart the gesture.
- Turns Link off without leaving page 0 or 1. Turning Link on opens page 2 and
  enables immediately because the mode toggle itself writes no DSP values.
- Increases the page-opening delay before F↔R actions to 500 ms; actions remain
  immediate when page 2 is already displayed.
- Shows the live dB bubble on both corresponding sliders during a linked gain
  drag when both graphs are visible.
- Makes the vertical gain handle a fixed 26 × 8 px with nearly square corners,
  a centred horizontal dash, bank-colour fill and theme Borders outer colour.
- Keeps modified Preset and Theme selector borders unchanged and replaces the
  small corner marker with a vertically centred 16 px yellow dot, inset 6 px
  from the right border.
- Names the built APK `EQ-DSP-v1.40-beta.apk`.

## v1.39-beta — source build 60

- Fixes the linked frequency-editor deadlock by deriving each popup range only
  from the neighbouring bands in the displayed Front or Rear bank. Frequency
  edits no longer mirror through Link; linked gain and Q, including the v1.38
  frequency-alignment safeguard, are retained.
- Shows the calculated minimum and maximum at the ends of the frequency slider.
  Keyboard Done replaces an out-of-range typed value with its clamped value;
  OK keeps the live value and Cancel restores the value present on opening.
- Opens independent Front/Rear page 2 when an available F↔R or Link control is
  pressed. Actions wait until page 2 has been visible for 300 ms, act immediately
  when it was already displayed, and leave page 2 open afterwards.
- Renames Graph / Slider Background to Graph Background. It now colours only the
  EQ graph; popup slider surfaces use Panels.
- Replaces the main vertical EQ slider thumb with a wider, almost-square-cornered
  rectangle at the existing height. Its fill follows the displayed EQ bank and
  its outer edge follows the theme Borders colour.
- Names the built APK `EQ-DSP-v1.39-beta.apk`.

## v1.38-beta — source build 59

- Adds linked-EQ frequency mismatch choices before a linked gain edit, validates
  frequency-copy directions against ordered neighbouring bands and explains
  unavailable choices.
- Enforces the 1/10/100 Hz ordered-band spacing in live edits and presets, rejects
  invalid preset frequency arrays, and adds clickable Front/Rear reset choices.
- Shows Update in the Presets and Themes menus only when an editable item is loaded.

## v1.37-beta — source build 58

- Prevents Flat, A/B, F↔R, Link, Smooth and Drag EQ from revealing hidden EQ
  controls while Lock EQ or the main lock is active.
- Changes Hide EQ to Show EQ while hidden and matches its text size to the
  surrounding toolbar buttons.
- Shortens the page-cycle single/double-tap window to 200 ms.
- Moves Edit Theme below Manage Themes in the Themes menu.
- Uses the supplied dark theme as the built-in Default while preserving named
  themes and user-customised Default settings.
- Enlarges the page-3 X touch target, removes its background and border, uses
  the global theme text colour, and removes the title bar from page 3.
- Uses Button OFF Text for Bass Enhancement, Subwoofer and Time Alignment value
  buttons while their feature is off; renames Test to Speaker Test.
- Names the built APK `EQ-DSP-v1.37-beta.apk`.

## v1.36-beta — source build 57

- Restores ordinary EQ and optional settings as an immediate command batch.
- Runs the verified TA and subwoofer gate sequences concurrently; each retains
  its enable, readback, value, final-state and failure checks.
- Reapplies independent optional settings after TA settles, since command 30
  can disturb them on this firmware, then performs the same final readback.
- Avoids a redundant TA ON command after restoring TA values.

## v1.35-beta — source build 56

- Shortens per-command pacing and the first readback check during preset,
  A/B and undo replay. Gate order, fresh-readback checks, retries and failure
  handling remain the same.

## v1.34-beta — source build 55

- Uses one restore engine for presets, A/B and undo, with fresh Joying readback
  checks before disabling TA/subwoofer and before reporting success.
- Resolves missing legacy preset fields against current settings without changing
  the saved file; compares actual values instead of a sticky UNSAVED flag.
- Preserves independent undo snapshots, exact crossover sections and preset names;
  cancels obsolete delayed restores, TA edits and SMOOTH work.
- Displays subwoofer HPF/LPF using the same frequency labels as their sliders.
- Writes preset updates through a temporary file and rejects rename collisions.
- Review and test details: [Preset code review](https://github.com/colonel-lp/Joying-EQ-DSP/blob/main/docs/functionality/PRESET-REVIEW.md).

## v1.33-beta — source build 54

- Restores saved subwoofer gain and filters while the subwoofer is temporarily
  enabled, then applies the preset's saved on/off state.
- Keeps Manage Presets and Manage Themes open through rename, delete and value
  views, refreshing the list after a change; labels the built-in presets System.
- Preserves the selected preset label through EQ bypass and lets A/B compare
  bypass against the saved preset, returning to bypass on the next press.

## v1.23-beta — source build 44

- Corrects the tested unit's physical left/right Time Alignment mapping while
  leaving all other channel controls unchanged.
- Adds separate graph/slider-surface theming, optional fullscreen title, and a
  two-row Post-EQ settings layout; moves Speaker Test into Settings.
- Replaces the page selector with persistent themed `0` and `1/2/3` controls,
  including forward/reverse single/double-tap sequences. Page 3 is graph-only;
  its internal X returns to page 1, or cycles backward on double-tap.
- Adds temporary EQ/crossover bypass with exact EQ/HPF snapshot restoration and
  the Joying STANDARD + four 20 Hz condition required by the BU32107 path.
- Strengthens Keep Screen On for Joying overlays and adds flag, wake-lock and
  lifecycle diagnostics. Persistent-notification visibility now follows
  `onStart()`/`onStop()` and survives task removal. Restores layout-2 padding.

## v1.21-beta — source build 42

- Corrects the three-button Mute/Loudness/Lock EQ panel to a 96 px height,
  with 6 px padding around and between its 24 px buttons on layouts 1 and 2.
- Restores layout 2's Level/Volume and adjacent panel to the same width as
  layout 1, with a matching 6 px gap before the enlarged EQ graph.
- Matches the spectrum selector's height and typography to Front/Rear EQ,
  sizes its button and list to fit the longest style name, and right-aligns
  all three controls on layout 3.
- Labels Hide EQ consistently on layout 2; it still hides both banks there.
- Gives the optional, display-only Loudness Post-EQ treble contour a slower
  volume-dependent fade. This remains an approximation until the Joying
  volume-to-depth table can be measured or extracted.

## v1.20-beta — source build 41

- Uses the compact non-fullscreen lower-panel and bottom-bar dimensions in both
  window modes, giving the recovered fullscreen height to the EQ graph and
  vertical slider panels.
- Fixes Layout 1 and 2 panel geometry: Lock EQ now shares the correctly padded
  Mute/Loudness group, Layout 1's action group fills the released row space,
  and Layout 2 highlights only its currently selected bank while both graphs
  remain editable.
- Improves Layout 3 with Front/Rear bank buttons, a bottom-right close button,
  and long-press close to toggle fullscreen.
- Makes Keep Screen On show an outlined circle while off and adds an Android
  wake lock alongside the window/view flags for FYT units that ignore the flag.
- Corrects the Rear EQ/Hide EQ gap, centres and equalises the three Options
  section headings, and normalises the Loudness Post-EQ prediction to show the
  compensated bass/treble contour while still fading flat by volume 25.
- Java 8 source syntax checked. Compile in Android Studio and verify Keep Screen
  On, all four layouts and the modelled Loudness response on the unit.

## v1.19-beta — source build 40

- Keeps the EQ toolbar, bottom bar, panel controls and labels at their design
  size across fullscreen modes; adjusts graph height and vertical slider tracks.
- Makes layout 1 switch the graph to Rear EQ, keeps the same Level/Volume width
  as layout 0, and puts Loudness and Mute in an outlined panel. Layout 2 groups
  Lock EQ, Loudness and Mute in one outlined panel.
- Adds layout 3 with a full-screen spectrum, style picker and X back to layout
  0, remembering the active bank from layouts 0 and 1. The layout and capture
  source states remain independent.
- Updates the layout number and Keep Screen On icons and reapplies the screen
  wake flag when the Activity, window or content view becomes visible.
- Adds separately saved visual Post-EQ modeling switches for Bass Enhancement,
  Front/Rear crossover and Loudness. P²Bass keeps the selected 0–12 dB shelf
  and frequency; crossover follows each reported HPF section. The approximate
  Loudness curve uses Joying's 125 Hz / 4 kHz / HiBoost 0.2 setup and fades
  toward flat between master volume 0 and 25.
- Rearranges Settings headings and the FFT/dropdown labels, removes obsolete
  warnings, and makes Aurora's dim waveform ridge smoother.
- Java 8 source syntax checked. Compile in Android Studio and verify the
  layouts, audio-test routing, Keep Screen On and P²Bass click on the unit.

## v1.18-beta — source build 39

- Adds a **Test** button beside Amp. A four-channel popup plays packaged female
  spoken clips through the selected Front/Rear and Left/Right Joying balance/fade
  position, then restores the previous settings after each clip, when leaving
  the popup, or when backgrounding the app. Test requires amp on and mute off.
- Adds an opt-in **Loudness in Post-EQ (experimental)** setting. When the Joying
  Loudness switch is on, it estimates the frequency response from the BU32107
  datasheet page 44, Figure 55: -15 dB, LPF 100 Hz, HPF 10 kHz, HiBoost .55.
  The actual Joying coefficient settings are unknown. This is a display-only
  approximation and has no effect on the DSP output.
- When Bass Enhancement is turned off, sends decreasing front/rear P²Bass gain
  steps before disabling the P²Bass master, then restores the saved gains while
  off. The settings and preset state retain the original gain. This relies on
  the chip's soft gain transition and needs listening validation on the unit;
  the Joying service's implementation has not been measured.
- Source only: compile in Android Studio with the existing signing key, then
  test the Test popup routing and Bass Enhancement switch with the speakers.

## v1.17-beta — source build 38

- Uses the v1.16 Visualizer4096 companion as its baseline. The separate native
  patch is unchanged; without that patch the 1024-sample stock Visualizer still
  works, and the new FFT window choices fall back to the available samples.
- Adds a square page selector in the bottom bar: layout 0 retains the original
  dashboard; layout 1 enlarges the single EQ graph and Level/Volume sliders;
  layout 2 shows separate Front and Rear graphs when independent EQ is on.
  Shared controls, EQ state, Drag EQ, Smooth and Lock EQ remain the same across
  layouts. Layout 2 falls back to 0 when independent EQ is disabled.
- Adds a themed Keep screen on toggle beside the page selector and fullscreen
  control. Its state, and the selected layout, persist across restarts.
- Renames the dashboard title to EQ & DSP, sets Bar • coloured to distinct
  green/yellow/orange/red quarters of the graph, and updates the settings title.
- Adds Bass 1024/2048/4096 and Treble 1024/2048 window choices for the
  Visualizer's Java FFT. Diagnostics show both requested and active sizes.
  Policy 0x2 and 0x3 now both require confirmation before changing routes.
- The Test voice clips, P²Bass click investigation, and Loudness model were
  deferred to v1.18-beta.
- Source only: compile in Android Studio with the existing signing key. No
  Gradle/Android SDK build was available in the packaging environment, and
  layout behaviour still needs on-unit visual and audio testing.

## v1.16-beta — Visualizer4096 companion (build 37)

- Explicitly requests 4096 waveform samples on the tested Android 8.1 SC9853i
  platform, with checked fallback to 2048/1024 and smaller supported sizes.
- Requires the separate Visualizer4096 system patch for more than the stock
  1024 samples on this unit. The system API deliberately still advertises 1024.
- Uses a 4096-sample bass FFT and the newest 1024 samples for faster mids/highs,
  with a smooth 600–1000 Hz blend. Both use gain-corrected Hann windows.
- Retains the full one-sided frequency range (2048 bins at 4096 samples).
- Never requests Android's native packed FFT above 1024; FFT is calculated in
  Java. Discards callbacks from released Visualizer instances.
- Normal speaker routing is unchanged. Visualizer remains the default; the
  existing explicitly selected 0x2/0x3 experiments are retained unchanged.
- No DSP writes, preset/theme formats, or UI layout changes in this companion.
- Source only: compile EQDSP.apk in Android Studio using the same signing key
  as the installed app. A normal APK update is separate from the native patch.

## v1.15-beta

- Restored Android Visualizer as the safe default spectrum source, preserving normal speaker playback and the original, fuller-height visualization.
- Added a session-only Spectrum Input selector to the new **SYS APP & EXPERIMENTAL** Settings panel: Android Visualizer, policy 0x2 and policy 0x3.
- Policy 0x2 requires confirmation because this FYT firmware diverts matched playback away from the speakers. Policy 0x3 tests render-plus-loopback and automatically returns to Visualizer if Android rejects it.
- Retained the v1.14 continuous 48 kHz multi-resolution capture implementation for the two explicitly selected experimental policy modes.
- Experimental input selections are never saved; every new app process starts with Android Visualizer.
- Added a separate read-only lsec extraction package for collecting the unit's Visualizer/audio-effect libraries and configuration before considering any system patch.

## v1.14-beta

- Replaced the limited 1,024-sample Visualizer input on privileged installations with continuous 48 kHz AudioPolicy loopback capture.
- Added a multi-resolution spectrum: a 16,384-sample Hann-windowed FFT for bass, a faster 4,096-sample FFT for mids/highs, and a smooth 600–1,000 Hz blend. High-frequency display updates run at about 23 fps while the bass transform refreshes at about 12 fps.
- Kept Android Visualizer and the Joying analyser as automatic fallbacks when policy capture is unavailable.
- Removed state-dependent fill colours from ordinary buttons. Their interiors remain at the configured button background; state is indicated by the border and the existing on/off text colours.
- Made the displayed version/build read directly from the installed APK and added the separate Package Manager record to Diagnostics.
- Updated the privileged installer to move the app to `/system/priv-app/EQDspV114`, remove only its stale compiled-code entries and force the Joying Android 8.1 Package Manager to scan a genuinely new code path.

## v1.13-beta

- Reordered the Theme & Appearance colour editor into paired rows: Front/Rear EQ; Text/Sliders; horizontal/vertical grid; Background/button background; on/off text; on/off button border; Panels/borders.
- Centred the Theme & Appearance, Options and System headings; enlarged the Settings headings; added the requested empty panel above System.
- Made the font control left-aligned at the same width as a colour button, with a matching Back button beside it.
- Renamed the preset-update option to “Wipe unchecked values in preset on update”.
- Changed the privileged dynamic AudioPolicy diagnostic to loopback-only routing (0x2), because this unit rejects the combined render + loopback route (0x3). The temporary test can briefly mute or divert playback and always unregisters afterwards.

## v1.10-beta

- Sized the graph's spectrum-style selector and dropdown to their longest title; enlarged both sets of text.
- Made Aurora's GLOW 100 brighter while keeping its previous appearance at 50, and reordered its controls to HUE, WAVE, GLOW.
- Added a themeable inactive-button border colour, preserving the independent Front/Rear EQ, Hide EQ and Crossover borders. Existing themes retain their previous derived colour on import.
- Separated the installed toolkit package version from any unexposed service version in Diagnostics. Added read-only ALSA card, PCM and codec identifiers where accessible, without presenting the tested unit's BU32107 as a runtime discovery.

## v1.09-beta

- Corrected spectrum rendering to follow stable style IDs, so the alphabetically ordered menu now displays Line • simple, both Bar styles, Line • glow and Aurora correctly while retaining their matching editors.
- Removed titles from all spectrum colour-wheel dialogs and reduced their wheel height so Aurora's complete control set and Cancel/OK buttons remain visible.
- Re-centred Settings checkbox and System-button labels from their actual glyph bounds to prevent top or bottom clipping without reducing the text size.

## v1.08-beta

- Expanded Line • glow to 100 steps: 0 removes its shaded glow, 50 matches the old maximum and 100 provides a stronger effect. Existing saved themes migrate without changing appearance.
- Added an independent 0–100 Aurora glow control: 0 removes the under-wave fill, 50 preserves the previous appearance and 100 supplies a stronger controlled fill without altering the ridge or shadow lines.
- Rebalanced Bar • coloured so its green-to-yellow, yellow-to-orange and orange-to-red transitions begin at −6 dB, 0 dB and +6 dB respectively.
- Moved Options into a full-height left settings panel while retaining the System panel's earlier size and position.

## v1.06-beta

- Fixed the graph spectrum selector so its full five-style menu opens below the top-right button.
- Replaced the packed analyser data with a DC-removed, Hann-windowed waveform FFT, using up to 2048 samples where supported, to sharply reduce the long frequency tails and improve bass resolution; the Android FFT remains a compatibility fallback.
- Added silence-aware spectrum handling so Post-EQ gain cannot turn the analyser floor into a visible response when no audio is playing.
- Returned HIDE EQ to the Front/Rear EQ group, immediately after Rear EQ, while keeping the display controls together.
- Added frequency labels to the graph x-axis while EQ controls are hidden.
- Extended Aurora's waveform-strength range: 0 removes the ridge while retaining its under-wave effect, and 20 produces a brighter ridge.

## v1.05-beta

- HIDE is now HIDE EQ; it hides gain, frequency and Q controls and expands the graph. EQ-editing toolbar actions reveal the controls again.
- Moved EQ Curve, Spectrum and Post-EQ to the left of HIDE EQ.
- Spectrum styles are now Line • simple, Bar • simple, Bar • coloured, Line • glow and Aurora.
- Added an in-graph style selector: tap for styles and long-press for the current style editor. Long-pressing the main Spectrum button does nothing.
- Line • glow has a live glow-strength control. Aurora has live hue-range and independent 0–20 waveform-line brightness controls.
- Corrected low-frequency spectrum spreading by replacing fixed three-bin averaging with two-bin power interpolation.
- Added optional preset save/restore categories, wipe-on-update behaviour, and a stored-value viewer in Manage Presets.

## v1.04-beta

- Restored the `v1.02` AURORA 3 appearance with Aurora 2 response timing, shared-gradient rendering and a seam-safe continuous fill.
- Added AURORA 4 to retain the clipped-below-ridge `v1.03` appearance; its banded fill is now continuous to remove pale horizontal lines.
- Added independent theme colours for AURORA 3 and AURORA 4; both use the live hue-range control.
- Made Manage Presets and Manage Themes substantially smaller, with compact list rows and Rename/Delete controls at the bottom.
- Replaced the system rename prompts with smaller app-themed rename dialogs.

## v1.03-beta

- Presets no longer save, restore or compare the AMP and SUBWOOFER on/off states; their controls and all subwoofer tuning settings remain available.
- Removed the SMOOTH working popup while retaining the same smoothing operation.
- Global Lock now disables and visually dims the output LEVEL control while leaving Volume, Loudness and Mute available.
- Reworked AURORA 3 to reuse one hue gradient per frame, match AURORA 2 response timing and clip every glow and shadow trail below the main ridge.
- Made the Spectrum Options, Font and Theme boxes identical in size with equal vertical spacing.

## v1.02-beta

- Added two softer shadow bands to every Aurora style.
- Made AURORA 3 react faster to rising and falling spectrum energy while retaining its smooth multicolour appearance.
- Clipped the AURORA 3 colour fill to its smooth ridge to prevent stray coloured pixels in the black area above it.
- Shortened the SPECTRUM long-press delay from 560 ms to 450 ms.
- Renamed the simple spectrum styles to Line • simple, Bar • simple and Bar • coloured.
- Moved the AURORA 3 hue-range slider into its colour editor, directly below the colour/value picker, with immediate live preview.
- Increased non-fullscreen Settings text slightly, fixed the THEME & APPEARANCE heading clearance and made the colour-theme buttons taller while preserving the lower control heights.

## v1.01-beta

- Main-screen display state now survives backgrounding and activity/process recreation: DRAG EQ, EQ CURVE, SPECTRUM, POST-EQ, HIDE, EQ/global locks, EQ link, displayed bank and independent Front/Rear selected bands.
- F and Q row labels now share a centred inset, with the smaller Q button respecting the EQ panel padding.
- AURORA 3 now uses continuous smooth hue-gradient paths, continuous trails and a deeper level-reactive colour fill below the ridge.
- Settings uses the full available width in non-fullscreen mode.
- THEME & APPEARANCE now places ordinary colours first, followed by SPECTRUM OPTIONS, FONT and the bottom THEME selector. Spectrum options open their editor on the main dashboard.
- OPTIONS fills the space above the restored Beta 20-style SYSTEM panel; app/version text is back at the bottom.
- Diagnostics adds Android SHARE alongside COPY.
- Spectrum sampling now uses a narrow, symmetric FFT RMS interpolation to reduce bin-leakage variation without frequency-dependent tilt; post-EQ calculation explicitly uses the displayed EQ bank.
