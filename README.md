# Starship for Mere Mortals

Every time a shell finishes a command, it
prints a **prompt** — the little line that
says *ready when you are*. The prompt a
shell ships with says almost nothing:
a symbol, maybe your name, and a wait.
**Starship** replaces that line with one
that reports for duty. It tells you the
folder you are in, the git branch you are
standing on and whether the work there is
saved, the language version this folder
expects, whether your last command failed,
and how long it took — recomputed fresh
every time you press Enter, in whichever
shell you favour, from one configuration
file you control.

This guide explains how that works, how to
install Starship and read the prompt it
gives you, how to follow it into a git
repository and watch it keep score, how to
ask it *why* it printed what it printed,
and how to make it yours: your segments,
your order, your colours, and the noisy
parts switched off. The limits are stated
plainly, including the quiet ways a prompt
can fail — a configuration it cannot parse
is ignored without a fuss, and a glyph
without the right font is just a box.

One rule is worth stating before the
first install, and chapter 1 returns to
it: **your prompt introduces your
machine.** It can carry your username,
your computer's name, your folder paths,
your project and branch names, even a
cloud account or a Kubernetes context,
into every screenshot, screen-share and
terminal recording you make. Configure it
like you will be photographed wearing it.

The lab behind this guide ran the real
thing: **Starship 1.27.0**, the official
release binary with its checksum verified,
driven in interactive **bash** and
**zsh** sessions inside a real terminal,
against practice folders built for the
purpose — a small git project with its own
local remote, so the prompt's claims about
branches, stashes and unpushed commits
could be checked against git itself. The
lab changed the prompt's mind five ways
with a configuration file of its own,
broke that file two ways to watch what
Starship does with a bad one, applied a
preset, timed every segment, and counted
the exact characters in the prompt to show
which ones need a special font. What it
could not run, it did not fake: the other
shells Starship supports are taught from
their generated initialisation scripts and
the documentation, and are labelled as
such wherever they appear. `criteria.md`
keeps the full ledger.

## What this guide covers

- [**What Starship is**](what-starship-is.md) —
  the prompt as an instrument panel, what
  a module is, and the screenshot rule
  that is part of the tool, not an
  afterthought
- [**The moving parts**](the-moving-parts.md) —
  one binary, one line in your shell's
  startup file, one configuration file,
  and a hundred small modules, and which
  part holds what
- [**Installing Starship**](installing-starship.md) —
  the official release with its checksum,
  the package managers, the installer
  script, and the font question answered
  before it bites
- [**Your first prompt**](your-first-prompt.md) —
  switching it on in bash, and taking the
  default prompt apart segment by segment
  with `starship explain`
- [**Git in the prompt**](git-in-the-prompt.md) —
  branch, dirty, staged, untracked,
  stashed and unpushed, each state made
  for real and read off the prompt
- [**When commands fail**](when-commands-fail.md) —
  the arrow that blushes, the status
  segment that is off until you ask,
  durations, and background jobs
- [**Languages and toolchains**](languages-and-toolchains.md) —
  how the prompt knows a folder is a
  Python or Node project, what version it
  is really reporting, and the package
  segment's private little rule
- [**Reading Starship's mind**](reading-starships-mind.md) —
  `explain`, `timings`, `module` and
  `print-config`: the tools that show
  what the prompt computed and why
- [**Configuring Starship**](configuring-starship.md) —
  the configuration file, the format
  string that decides what appears, and
  the lab's five changes, each one
  visible
- [**Making it yours**](making-it-yours.md) —
  styles and symbols, switching modules
  off, taming the directory, and the
  settings that keep a prompt fast
- [**Presets**](presets.md) — ready-made
  configurations shipped with the tool,
  applied for real, and why a preset is
  a starting point rather than a taste
- [**Starship in other shells**](other-shells.md) —
  zsh verified live, and fish, PowerShell
  and the rest from their initialisation
  scripts and the documentation
- [**The neighbours**](the-neighbours.md) —
  Oh My Posh, Powerline, Pure, Spaceship,
  the frameworks' own themes, and the
  hand-written prompt: what each does
  that Starship doesn't, and vice versa
- [**Limits**](limits.md) — it renders
  and changes nothing, its glyphs need a
  font, its failures are silent, and its
  bill arrives on every Enter
- [**Troubleshooting**](troubleshooting.md) —
  the prompt that did not change, the
  boxes where symbols should be, the
  slow prompt, the configuration that
  vanished, and the traps this guide's
  lab fell into so you don't have to
- [**Glossary**](glossary.md) — the
  terms, collected in one place

## What it doesn't cover

Writing shell startup files in general,
or teaching any shell's language — the
sister guides to Bash and PowerShell in
this series do that, and this guide only
ever adds one line to a startup file.
Designing a colour scheme from nothing:
chapter 11's presets and chapter 10's
restyling give most readers more prompt
than they need. Terminal emulators
themselves — their fonts, their settings,
their tabs — are pointed at, not taught,
though chapter 3 settles the one question
that matters here, which font the glyphs
need. And Starship's hundred-plus modules
are not a phone book to read aloud: the
guide teaches the ones you will meet
daily and shows you how to interrogate
the rest.

## How to use this guide

Read chapter 1 for the model and the
rule, and chapter 2 before installing
anything — knowing which part holds what
turns later confusion into a named
problem. Chapters 3 and 4 belong in one
sitting: install, switch on, and take the
default prompt apart while it is still
strange. Chapter 5 repays doing at a
keyboard inside a repository you can
afford to dirty — the lab's practice
project is in `starship-lab/`, with a
script that builds it. Chapters 9 and 10
are where the prompt becomes yours; keep
your changes as small as the lab's, and
check each one the way chapter 8 teaches.
The lab's transcripts live in
`starship-lab/transcripts/`; its
configuration files in `starship-lab/`
itself; its notes are
`examples/lab-notes.txt`.

---

## Part of the series

This guide is one of the [For Mere Mortals](https://paulsullivan33-dev.github.io/mere-mortals/) guides: plain-language guides to the tools programmers and makers use.

Related guides:

- [Bash for Mere Mortals](https://paulsullivan33-dev.github.io/bash-for-mere-mortals/)
- [PowerShell for Mere Mortals](https://paulsullivan33-dev.github.io/powershell-for-mere-mortals/)
- [Linux for Mere Mortals](https://paulsullivan33-dev.github.io/linux-for-mere-mortals/)

## License

The writing in this guide is licensed under [CC BY 4.0](https://github.com/paulsullivan33-dev/starship-for-mere-mortals/blob/main/LICENSE). Code examples and lab scripts are licensed under the [MIT License](https://github.com/paulsullivan33-dev/starship-for-mere-mortals/blob/main/LICENSE-CODE).
