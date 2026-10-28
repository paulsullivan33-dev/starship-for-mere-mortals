# Writing criteria for this guide

Every "for Mere Mortals" guide is written to the same nine-point
standard, so a reader who trusts one can trust the rest. Here it
is, with the verification notes for this particular guide below.

1. **Fix it first.** Reader outcomes lead, not action items: each
   chapter opens by naming the outcome it delivers, shows a check
   the reader can run to confirm they got it, and a reasonable
   reader finishes able to state what was done, what it means,
   and what to try next.
2. **Plain language.** Short sentences, everyday vocabulary,
   technical terms defined on first use. No slang, and no
   idioms that only make sense in one country — the reader may
   be translating as they go.
3. **No dead ends.** A guide never tells the reader to do
   something it cannot show them how to verify. Every claim a
   reader relies on — an install, a command, an output — is
   something this guide demonstrates or clearly labels
   documented-only below.
4. **Live-verified where it matters.** Procedures are run for
   real in the guide's lab wherever the build machine allows it,
   and the transcripts kept in the repository are the evidence.
   What could not be run is listed honestly below, never
   presented as if it had been.
5. **General audiences.** Nothing in this guide — examples,
   fixtures, names, addresses — is modelled on any particular
   reader or author's real life, network, or organisations.
   The lab's traffic is the lab talking to itself.
6. **Standalone.** A reader needs this guide, its lab, and
   nothing else. Where another guide would genuinely help, it
   is pointed to once, by name, and the chapter still completes
   without it.
7. **Honest about limits.** Chapter 14 names what the tool
   cannot do: it renders a string and changes nothing about the
   shell itself, its glyphs are empty boxes without the right
   font, a broken configuration fails silently back to the
   defaults and a mistyped name in the format string fails
   quieter still, its detectors report the surfaces they can
   find rather than the truth, and its cost is paid again on
   every Enter.
8. **The ethics rule is in the text, early.** Chapter 1 and the
   README state the rule plainly — *your prompt introduces
   your machine, so configure it like you will be
   photographed wearing it* — before any procedure
   depends on it, and later chapters point back to it where a
   segment would happily announce a username, a hostname, a
   folder path, an account or a context to whoever happens to
   be looking.
9. **Builds clean.** The site builds with MkDocs in strict mode
   with no warnings, and a fresh reader following the chapters
   in order reaches the stated outcome of each.

## Verification notes for this guide

The build machine is an Ubuntu 24.04 sandbox. Starship
**1.27.0** (the official `starship-x86_64-unknown-linux-gnu`
release archive, its SHA-256 matched against the checksum the
project publishes beside it) was exercised in interactive
bash 5.2.21 and zsh 5.9 sessions running in a pseudo-terminal,
and non-interactively through its own subcommands. The lab's
other tools were the machine's own: Python 3.12.3, Node
v24.22.1, git 2.43.0. The lab user is root, which is why the
username segment appears in every prompt in this guide; on an
ordinary account it hides, as chapter 4 explains. All
transcripts live in `starship-lab/transcripts/`. Where a
transcript presents prompt output, the colour escape codes
were stripped for legibility, except where the codes are
themselves the evidence (t04, t08).

Run for real, with transcripts as evidence:

- Install and version, the checksum ceremony of chapter 3
  (t00), and the first prompt and its `explain` breakdown in
  an empty folder (t01).
- A full interactive bash session: the prompt in a plain
  folder, entering the practice repository, a program
  creating a file, and the prompt announcing the untracked
  file before any human checked (t02).
- The git states of chapter 5, each made deliberately in the
  fixture repository and read off `starship explain`:
  modified `[!]`, staged `[+]`, untracked joining in `[+?]`,
  stashed `[$]`, ahead of the remote `[⇡]`, and clean again
  after pushing — including the first attempt's missing
  arrow, traced to a branch pushed without upstream
  tracking (t03).
- Failure and duration: the character's colour codes under
  `--status 0` and `--status 1` read through `cat -v`,
  `took 1m35s` at 95 seconds, silence at 1.5 seconds, a jobs
  count, and an interactive session in which `sleep 3`
  produced a real `took 3s` (t04, t04's PTY companion).
- Language detection in both fixture projects, the package
  segment in each, and the package segment's disappearance
  and return as `package.json` gained and lost its
  `"private": true` line (t05, t05b).
- The lab's own configuration (`starship-lab/starship.toml`):
  five changes applied together and separately visible —
  trimmed format, no blank line, deeper directory, status on,
  Python off (t06).
- The interrogation tools: `timings` naming git_status the
  slowest module in the fixture repository, `module` alone in
  a clean tree, `print-config`'s merged defaults, and the
  two manufactured failures — a configuration that is not
  valid TOML falling back to the default prompt after one
  error line, and a format naming a nonexistent module
  skipped in complete silence (t07).
- The prompt's character census (U+E0A0 proved to be a
  Private Use codepoint) and the font inventory: 2,051 fonts
  installed, none of them a Nerd Font (t08).
- Presets: the list, `pure-preset` printed, saved and
  applied for real in the fixture repository, and the
  `nerd-font-symbols` preset's branch glyph read from its
  printout (t09).
- Initialisation scripts generated for bash, zsh, fish and
  PowerShell (t10), and a full interactive zsh session
  wearing the identical prompt (t11) — including zsh's own
  `#` end-of-line marker, identified and left in.
- The `toggle` command flipping an existing `disabled` key
  both ways and refusing where none exists; a replacement
  character symbol; a directory substitution renaming a path
  component in the prompt only (t12).

Documented only — described from the project's documentation,
not run, and the text does not claim otherwise:

- Fish, PowerShell and the remaining shells (Elvish,
  Nushell, xonsh, Ion, tcsh, cmd via Clink): their
  initialisation scripts for fish and PowerShell were
  generated and read; none of these shells was run.
- The right-hand prompt and transient prompt, which the
  lab's two shells do not offer in a form the lab could
  exercise, and the vi-mode character shape.
- The git_state module's mid-merge and mid-rebase banners,
  and git_status's counts-instead-of-flags settings: the
  repository states were staged for the symbols, not for
  these.
- The neighbours of chapter 13 are characterised from their
  own documentation and reputations, not installed or
  benchmarked.

Fixtures are this guide's own and deliberately generic: a
twenty-line notes program and a web-page widget, an identity
invented for the lab's commits ("Lab User",
lab@example.invalid), a remote that is a folder on the same
machine, and one note about a heron. No example is modelled
on any real person, network, service or organisation, and
nothing left the machine the lab ran on.
