# Glossary

**Character** — the module that draws the
arrow itself (`❯`), green after success
and red after failure; the prompt's last
word on the previous command (chapter 6).

**Command timeout** — the global
`command_timeout`, 500 milliseconds by
default, after which a module's external
commands are cut off and the module
contributes nothing (chapters 8, 10).

**Configuration file** — the TOML file
that arranges the modules:
`~/.config/starship.toml` by default, or
the path in `STARSHIP_CONFIG`
(chapters 2, 9).

**Detector** — the half of a module that
decides whether it has anything to say in
the current folder; the half that reads
marker files and runs tools (chapter 2).

**Directory truncation** — the directory
module's habit of showing only the last
parts of a long path — three components
by default, five in the lab's
configuration (chapters 4, 9).

**Format string** — the string that
arranges text and `$variables`, at the
top level to order the modules, and per
module to shape a segment; brackets make
a part conditional, parentheses style it
(chapter 9).

**Git status symbols** — the bracketed
set after the branch: `!` modified, `+`
staged, `?` untracked, `$` stashed, `⇡`
ahead, `⇣` behind, `⇕` diverged, `=` in
conflict, `✘` deleted, `»` renamed
(chapter 5).

**Marker file** — a file whose presence
declares a folder's nature to a module:
`pyproject.toml`, `.python-version`,
`package.json`, `.nvmrc`, `Cargo.toml`
and their many kin (chapter 7).

**Module** — one fact about the current
context, with a detector, a format and a
style: directory, git_branch, python,
status and a hundred more (chapter 2).

**Nerd Font** — a programming font patched
with an icon library, which carries the
Private Use glyphs (such as the branch
symbol, U+E0A0) that ordinary fonts leave
blank (chapter 3).

**Preset** — a complete configuration
shipped inside the binary and printed by
`starship preset <name>`: a worked
example to adopt and then edit
(chapter 11).

**Private Use Area** — the range of
Unicode codepoints reserved for fonts to
fill as they please; a character there
renders only where a font has drawn it
(chapters 3, 14).

**Prompt** — the line a shell prints when
it is ready for a command; the object
Starship composes, and this guide's whole
subject (chapter 1).

**Pseudo-terminal (PTY)** — a terminal
provided by software rather than
hardware; the device the lab's
interactive sessions ran in, so they
could be kept as transcripts
(chapter 4).

**Right prompt** — a second, right-aligned
prompt string (`right_format`), available
in some shells and not in bash or
PowerShell (chapter 12).

**Segment** — one module's rendered
contribution to the prompt: `on  main`,
`via 🐍 v3.12.3`, and the like.

**STARSHIP_CONFIG** — the environment
variable that points Starship at a
configuration file other than the
default; the lab's rehearsal tool
(chapters 3, 9).

**Startup file** — the file a shell reads
on starting (`~/.bashrc`, `~/.zshrc`, …),
where the single line that enables
Starship lives — last (chapter 2).

**Status module** — the module that names
a failure outright (`❌3`), disabled by
default; distinct from the character,
which only changes colour (chapter 6).

**Toggle** — `starship toggle <module>`,
which flips a `disabled` key that already
exists in the configuration — and refuses
to invent one (chapter 10).

**Transient prompt** — a shell feature
(fish, PowerShell) that replaces prompts
already scrolled past with a shorter
form (chapter 12, documented only).

**Upstream** — the remote branch a local
branch tracks; without one, the prompt
can show neither ahead nor behind,
however true either is (chapter 5).
