# Contributing Guide

Thanks for helping improve `native_updater` 🎉

This document explains:

1. How to contribute changes as a community member.
2. A maintainer recipe to publish releases that come from community PRs.

---

## How to contribute

### 1) Prepare your branch

- Fork the repository.
- Create a feature/fix branch from `main`.
- Keep each branch focused on one change only.

Example:

```bash
git checkout -b fix/null-safety-copy-update
```

### 2) Make a single-purpose change

- Do not mix unrelated refactors/features in the same PR.
- Keep commits easy to review.
- Explain **why** the change is needed (not only what changed).

### 3) Update docs when needed

If your change affects package behavior or release notes, also update:

- `README.md` (usage/setup changes)
- `CHANGELOG.md` (user-visible changes)

### 4) Open your PR

Please include:

- Problem statement
- Proposed solution
- Any issue reference (`Closes #<issue_number>` when applicable)
- Test notes / validation steps

If the change stays within the package scope and quality bar, we will be happy to review and merge it.

---

## Recipe: publishing releases from community PRs (maintainers)

Use the checklist below when publishing community-driven changes.

### A) Before merge

- Ensure PR is scoped and reviewed.
- Confirm linked issues and contributor attribution are present.

### B) Prepare release changes

1. **Bump version** in `pubspec.yaml`.
2. **Update `CHANGELOG.md`** with date and bullet points.
3. **Refresh dependencies/lock file** if dependency updates are part of the release.

### C) Merge and create release commit

Use a clear commit message format:

```text
Publishing version x.y.z

<summary of what was shipped>

This is to publish the changes requested by the community.

Closes #<issue>
Thanks @<contributor>
```

### D) Pre-publish requirements (what else is needed)

Before `flutter pub publish`, make sure all of these are true:

- You are a **pub.dev uploader/publisher member** for `native_updater`.
- You are logged in to pub.dev in your terminal (`dart pub login` if needed).
- `pubspec.yaml` has the final `version`, correct `homepage`/repository metadata, and valid SDK constraints.
- `CHANGELOG.md` has an entry for the exact version you are releasing.
- The repository is clean and committed (`git status` shows no unexpected changes).
- Package quality checks pass locally:
  - `dart format --set-exit-if-changed .`
  - `flutter analyze`
  - `flutter test`
- Dry-run publish succeeds:
  - `flutter pub publish --dry-run`

If dry-run reports warnings, fix them before the real publish.

### E) Publish to pub.dev

From repository root:

```bash
flutter pub get
flutter pub publish
```

Follow the pub.dev prompts/checks and confirm publish.

### F) After publish

- Tag the release in Git.
- Push tags.
- Announce the release and reference merged community PRs/issues.

---

## Quick quality checklist

- [ ] Single-purpose commits
- [ ] Rationale included in PR description
- [ ] README/CHANGELOG updated when needed
- [ ] Issue references included
- [ ] Contributor credited
