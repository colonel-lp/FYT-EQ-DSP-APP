# EQ & DSP — public repository instructions

## Repository duties

- Repository: `colonel-lp/FYT-EQ-DSP-APP`, branch `main`. Contains official releases, concise `CHANGELOG.md`, public documentation and existing patch/download catalogues.
- Application source, service patch APKs/scripts/recipes and private engineering records belong in `colonel-lp/Joying-EQ-DSP` (`source/`, `tools/`, `docs/`). Do not copy them into this repository as part of changelog/release publication.
- Publish controller APKs/releases only when explicitly authorized; a source-build request is not controller-APK authorization. Do not build/sign from this repository. Retain existing license/distribution terms and signing compatibility.
- Public patch archives are owner-created deliverables. Publish or alter release assets/catalogues only within the authorized scope and after the actual artifact exists. Retain established catalogues/legacy entries; use real compatibility, size/hash and download URLs, never placeholders.
- Keep `CHANGELOG.md` byte-identical to private `source/app/src/main/assets/changelog.md`. Retain complete versioned change points and offline/bundled compatibility; empty release descriptions do not replace maintained notes. README is a short release/download/license entry point.
- Do not expose private source, logs, unpublished investigations or private-only links in new public summaries. Preserve existing public history through immutable links.

## Shared working rules

- Keep replies concise. Follow current owner instructions; clarify genuine ambiguity without repeating permissions already granted. Full GitHub access does not expand the requested task.
- Read current instructions and only task-relevant files/sections. Search with `rg`; read targeted ranges. Do not routinely load whole repositories, tool registries, changelogs, archives or successful logs.
- Batch independent reads; keep dependent edits and publication sequential. Inspect every result. Avoid duplicate reads, one commit per file and repeated successful checks.
- Keep large text/binary/base64 payloads, manifests and logs on disk or inside programmatic tool execution. Return compact status, paths, sizes and IDs; never expose encoded files to the conversation to construct an upload.
- Prefer permitted, authenticated Git from disk; otherwise use connected GitHub tools. Connector login does not authenticate Git. Never extract connector credentials. Reuse known blobs; upload identical bytes once. Use bounded requests, saving successful IDs immediately.
- Read current file/branch identity before edits and use current file SHA or a guarded branch update for publication. Preserve newer owner changes; no blind overwrites or force pushes. Verify once with compact commit/path/blob metadata, not full-file or binary rereads.
- Upload authorized changes by default unless download/local-only delivery is requested. For multi-step work, first save a local checklist plus originals/destination manifest; complete/check off one stage at a time and retain publication receipts. Resume unfinished work without rebuilding or re-uploading confirmed objects.
- After an ambiguous write, make a small status read before retrying. At most one retry after a concrete correction or confirmed transient fault; a second failure or context/payload limit stops that publication stage. Report errors, permission blocks or accumulating request overhead promptly, with completed uploads, local remainder and next option. Do not loop or restart builds to fix transfers.
- Never create ZIPs or run archive-generation helpers for builds, patches, scripts or recovery; the owner creates ZIPs. Preserve original artifacts and offer download access if publication cannot finish.
- Use short bullets and useful mapping tables. Keep one canonical document per topic; preserve important commands, paths, ranges, hashes, compatibility, backups, failure handling and evidence limits.
- Changelogs contain identifiable grouped feature/fix/compatibility bullets, combining small UI adjustments. Retain release headings; keep technical detail in topic/validation records and preserve full history with immutable commit links. Do not duplicate release notes across READMEs, pending lists and guides.
- Keep historical proposals, restrictions and pending statuses explicitly historical. They do not override current owner instructions/status. Open history only when needed; never silently discard important evidence.
- Check only affected behavior/links and necessary invariants; broaden for a concrete failure or risk. Documentation-only work needs no APK, version increment or application test suite.
- Distinguish source checks, stand-ins, compilation, signature verification and real device/audio testing. Report only work actually completed; distinguish observed errors from suspected causes. Instructions reduce overhead but cannot guarantee platform limits will never be reached.
- Never commit signing keys, credentials, local SDK paths or routine build output. Preserve existing signing identities and unrelated owner files.

- Keep this shared section identical in both AGENTS.md files when changing workflow rules; repository duties remain specific. Check the counterpart for shared-rule edits, not for every routine task.

## Essential commands

- Locate files/text: `rg --files`, `rg -n 'pattern' path`; read a bounded range with `sed -n 'START,ENDp' file`.
- If authenticated Git is available: `git fetch origin`, `git status --short`, `git diff --stat`, `git diff --check`.
- For an authorized commit on the intended branch: `git add -- <changed-paths>`, `git commit -m "<summary>"`, `git push origin HEAD:<branch>`. Check the expected remote head first; never force overwrite newer work.
- With connector tools, use current-SHA file updates or bounded text/blob batches followed by one guarded commit/ref update. Pass large payloads programmatically, not as model-generated literals.
- These commands are conditional workflow examples, not instructions to rerun them unnecessarily. Use the selected procedure README for exact build/sign/test/USB commands; do not duplicate changing recipes here.
