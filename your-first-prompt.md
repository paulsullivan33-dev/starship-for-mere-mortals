# Your First Prompt

This chapter switches Starship on in bash
and takes the default prompt apart until
every segment can be named. The check at
the end is a single command that explains
any prompt you will ever see — including
the ones in later chapters that the lab
deliberately rearranges.

## Switching it on

Add one line to the end of `~/.bashrc`:

```bash
eval "$(starship init bash)"
```

(The end matters — chapter 2 explains
why, and chapter 15 buries the readers
who put it in the middle.) Open a new
terminal, or start a fresh bash, and the
prompt changes on the spot. To try it
without touching your real startup file —
the way this guide's lab works — keep the
line in a file of its own and hand it to
bash directly:

```bash
bash --rcfile starship-lab/rc-bash -i
```

`starship-lab/rc-bash` is two lines long:
a comment and the same `eval`. Everything
in transcript t02 is a session started
exactly that way, in a real terminal —
a **pseudo-terminal**, the programmatic
kind, driven by the lab so the session
could be kept as text.

## The session

The lab started in an empty practice
folder and walked into the guide's
practice project (transcript t02):

```text
root in starship-scratch/lab/plain
⬢ [OCI] ❯ cd ../trailnotes

root in trailnotes on  main is 📦 v0.1.0 via 🐍 v3.12.3
⬢ [OCI] ❯ python3 notes.py "saw a heron by the creek"

noted.

root in trailnotes on  main [?] is 📦 v0.1.0 via 🐍 v3.12.3
⬢ [OCI] ❯
```

Read it slowly, because it is the whole
guide in miniature. In the plain folder
the prompt is two segments: the user and
the folder. Entering the repository adds
three more — the branch, the package
version, the Python version — without
being asked. And after the little
`notes.py` program writes its note to a
new file, the *next* prompt carries a
`[?]` the previous one did not: the
prompt noticed the untracked file before
any human ran `git status`. (Chapter 5
takes that `[?]` and its siblings one at
a time.) The prompt is not a decoration
that happens to mention git. It is a
report, recomputed per Enter, and this
is what it looks like when the report
changes under your hands.

## Taking the default apart

`starship explain` is the guide's master
key. Run in the plain folder (transcript
t01, colour codes stripped — the raw
output colours each segment as the prompt
does):

```text
$ starship explain

 Here's a breakdown of your prompt:
 root in                      -  The active user's username
 starship-scratch/lab/plain   -  The current working directory
 ⬢ [OCI]                       -  The container indicator, if inside a container.
 ❯                             -  A character (usually an arrow) beside where the text is entered in your terminal
```

Four segments, and each hides a small
lesson:

- **`root in`** — the username module. It
  does not show for an ordinary user at
  their own machine; it appears when the
  user is root (and is styled red, as
  root's name badge should be), when you
  are logged in over SSH, when the
  account differs from the login name, or
  when configured to always show. The lab
  runs as root, so the lab's prompts all
  carry it. On your own machine the same
  prompt will likely start at the folder.
- **`starship-scratch/lab/plain`** — the
  directory module, which by default shows
  at most the last **three** components of
  the path. The lab's folder is six deep;
  the prompt quietly keeps the tail. It
  also substitutes `~` for your home
  folder when it can. A reader whose
  prompt looks "cut off" has met this
  default, not a bug — chapter 10 adjusts
  it.
- **`⬢ [OCI]`** — the container module.
  The lab machine is itself a container,
  and the prompt says so, on a second
  visual line in the raw output. On a
  bare-metal machine or a full virtual
  machine this segment simply never
  appears — most modules are like that:
  present when relevant, invisible
  otherwise, and silent about their
  absence.
- **`❯`** — the character module, the
  arrow beside your typing. It is the one
  segment that reacts to the *previous
  command*: green after success, red
  after failure. Chapter 6 spends itself
  on that blush.

Two more features of the default hide in
the whitespace. The blank line above the
prompt is deliberate — `add_newline` is
on by default, giving each command block
breathing room — and the prompt ends with
a space and *no* newline, because your
typing continues the line.

## The check to keep

You now own the only diagnostic this
chapter insists on:

```bash
starship explain
```

Run it anywhere, any time the prompt
surprises you. It prints the prompt you
are looking at, segment by segment, each
with its reason for existing. Starship
never asks you to guess which module
spoke; it keeps the receipts, and
chapter 8 collects the rest of them —
`timings`, `module`, `print-config` —
for the days when `explain` is not
enough.
