# What Starship Is

A **shell** — bash, zsh, fish, PowerShell —
spends most of its life waiting. Between
one command and the next it prints a
**prompt**: a short line that marks the
boundary, carries anything the shell wants
you to know, and ends where your typing
begins. The prompt most shells ship with
is a missed opportunity wearing a dollar
sign. It might show your username and the
machine's name. It will not tell you that
you are three folders deep in a repository
with uncommitted work, on the wrong
branch, in a project that expects a
different Python than the one installed,
ten seconds after a command failed.

**Starship is a replacement prompt.** It
is a single program, written in Rust,
that your shell calls each time it needs
to draw a prompt. Starship looks around —
at the folder you are in, the repository
that contains it, the files that mark a
project, the command that just finished —
and hands the shell a rendered line
assembled from small pieces it calls
**modules**. A module is one fact, given
a symbol, a style and a sentence shape:
the directory module, the git branch
module, the Python module, the module
that reports how long the last command
ran. There are more than a hundred. Most
stay silent until their subject is in the
room: the git modules say nothing outside
a repository, the language modules say
nothing until a folder looks like one of
their projects.

The name is honest advertising. It is the
prompt from a television starship — an
instrument panel that assumes you want to
know the state of the ship at a glance,
because the next decision depends on it.

## Why anyone would do this

Four honest reasons account for nearly
every install:

- **Orientation.** *Where am I, in what,
  in which state?* is the question a
  terminal asks a dozen times an hour. A
  good prompt answers it before you think
  to type `pwd` or `git status` — and the
  lab's favourite moment in this guide is
  the prompt announcing an untracked file
  the instant a program created one
  (chapter 4's session, transcript t02).
- **Cheap warnings.** The failed command
  whose red arrow you notice *before* you
  build three more commands on its
  supposed success. The branch name that
  stops you committing to `main` what was
  meant for a feature branch. These cost
  nothing to show and plenty to miss.
- **One prompt everywhere.** The same
  configuration file drives Starship in
  bash, zsh, fish, PowerShell and a dozen
  other shells. Learn it once, carry it
  to every machine and shell you use —
  chapter 12 runs the identical prompt in
  two shells to prove the point.
- **A prompt that is yours.** The order,
  the colours, the symbols, the facts
  themselves are all configuration. The
  default is a sensible stranger's taste;
  chapters 9–11 make it yours, or hand
  you someone else's taste whole, via
  presets.

## The rule, stated before everything else

A prompt is not a security tool, and this
guide will not pretend the stakes are
mitmproxy's. But a rich prompt has one
property worth a rule, because it is easy
to forget exactly when it matters:

> **Your prompt introduces your machine —
> configure it like you will be
> photographed wearing it.**

Whatever you teach the prompt to display,
it displays in every screenshot you take
of your terminal, every screen-share with
a colleague, every recorded demo and
asciinema cast, every photo of a screen
at a conference. Usernames and hostnames
are the obvious passengers. Folder paths
name your projects and your employer.
Branch names name your features. Starship
has modules for your cloud account, your
Kubernetes context, your Google Cloud
project — each one a small announcement
to whoever ends up looking. None of this
argues against a rich prompt; the author
of this guide uses one. It argues for
choosing its contents the way you would
choose what goes on a name badge, and for
a second look at the prompt before the
screenshot, not after the posting.
Chapter 14 returns to this.

A smaller, related discipline belongs to
the install itself: the prompt runs on
*every* command you execute, inside your
shell, with your permissions. Get Starship
the way chapter 3 does — from the
project's own releases or your system's
package manager — and be wary of any
walkthrough that begins by piping a
stranger's script into your shell.

## A first taste

After installing (chapter 3) and adding
one line to a shell startup file, the
prompt in an ordinary folder looks like
this (the lab's machine, transcript t01):

```text
root in starship-scratch/lab/plain
⬢ [OCI] ❯
```

and `starship explain` takes it apart:

```text
root in                      -  The active user's username
starship-scratch/lab/plain   -  The current working directory
⬢ [OCI]                       -  The container indicator, if inside a container.
❯                             -  A character (usually an arrow) beside where the text is entered in your terminal
```

Every later chapter is an unpacking of
those four lines: why the username is
showing at all (the lab's user is root,
and root is always named), why the
directory is three components and no
more, why a container badge has appeared
in a guide whose machine is itself inside
a container, and why the whole line is
recomputed — at a measurable cost,
chapter 8 — every single time.

## Who it is for

The developer who lives in repositories
and is tired of typing `git status` to
learn what the prompt could have said.
The learner who wants the terminal to
teach as it goes: a prompt that names the
branch and the language is a quiet tutor.
The multi-shell and multi-machine worker
who wants one familiar line everywhere.
The common thread is one person who has
decided the waiting line should work for
its keep.

## What it is not

Starship is not a shell: it changes
nothing about how commands run, what your
aliases do, or how completion works — it
renders a string and hands it back
(chapter 14 is firm about this). It is
not a terminal: it draws nothing itself,
it emits text and colour codes into
whatever terminal you already use, which
is why fonts are the terminal's business
and chapter 3's warning. It is not a
theme pack for one shell's framework —
though chapter 13 compares it with the
neighbours that are — and it is not a
monitoring system: everything it shows
was true at the instant you pressed
Enter, about the folder you are standing
in, and it refreshes only when the shell
asks again.
