# Reading Starship's Mind

Chapter 4 introduced `starship explain`
as the master key. This chapter collects
the rest of the bunch: the four
subcommands that let you interrogate the
prompt instead of guessing at it. A
prompt built from a hundred conditional
modules would be a black box without
them; with them, every behaviour in this
guide — including the two silent failures
waiting at the end of this chapter — can
be produced, timed and explained on
demand.

All four run outside any shell, in the
folder you care about, and three of them
accept the same context flags as
`starship prompt` itself (`--status`,
`--cmd-duration`, `--path`, and friends),
so a state you cannot conveniently
arrange live — an exit code of 3, a
95-second command — can still be
interrogated after the fact.

## `starship explain` — who is speaking

You have seen it throughout: the prompt,
one segment per line, each with its
reason. Two habits make it stronger.
Run it in a folder you have just left a
shell in, when the live prompt surprised
you — explain recomputes from the folder,
so it answers for the prompt you would
get *now*. And read it for **absences**:
the module that is not listed is a
detector that did not fire, which points
at chapter 7's marker files or chapter
15's disabled switches, not at the
renderer.

## `starship timings` — who is slow

`timings` prints every module that
produced output or took at least a
millisecond, with the text it produced.
In trailnotes (transcript t07):

```text
$ starship timings

 Here are the timings of modules in your prompt (>=1ms or output):
 git_status  -   6ms  -   ""
 python      -   3ms  -   "via 🐍 v3.12.3 "
 directory   -   2ms  -   "trailnotes "
 netns       -   2ms  -   ""
 username    -  <1ms  -   "root in "
 git_branch  -  <1ms  -   "on  main "
```

The whole prompt costs on the order of
fifteen milliseconds here, and the
table tells you where it goes: the git
modules shell out to git, the language
modules run interpreters to ask their
versions, and the simple facts — who you
are, where the arrow points — are nearly
free. Nothing in this repository is
slow. In a repository with a hundred
thousand files, or on a filesystem that
lies about being local, this table is
the difference between *the prompt feels
sticky* and *git_status takes 300ms* —
and `starship explain` in chapter 5's
trap had a sibling here: timings shows
you the module, the module points at the
tool beneath it.

Note also the modules with empty text —
`git_status` spent its 6ms to conclude,
correctly, that a clean repository earns
an empty bracket, and `netns` checked
for a network namespace and found none
worth naming. Detectors pay their cost
even when silent; that is the real price
list of a rich prompt.

## `starship module` — one witness at a time

`starship module <name>` runs a single
module in the current folder and prints
what it would contribute:

```text
$ starship module git_status
(a clean repository: the module prints nothing at all)
```

Nothing is a complete answer — it is how
the lab proved, in chapter 7, that the
package module was withholding its
segment over the `private` rule rather
than failing to run. Combined with
`--path`, it lets you question a folder
you are not standing in. When a segment
misbehaves, this is the isolation ward:
one module, one folder, no choir.

## `starship print-config` — the merged truth

`print-config` prints the configuration
Starship is *actually* using: your file,
with every default you did not mention
filled in around it. Its head (transcript
t07) shows the default `format` is the
shorthand `$all`, followed by the full
parade of module names that shorthand
stands for, and the global defaults a
troubleshooter actually needs:

```text
format = "$all"
right_format = ""
scan_timeout = 30
command_timeout = 500
add_newline = true
```

When a setting seems ignored, this is
where you check whether Starship ever
heard it — and under which spelling.
Which brings the chapter to the two
failures it promised, both from the
lab's pair of deliberately broken
configurations.

## The two silent failures

**A configuration that is not valid TOML
is ignored — politely, and almost
silently.** Point `STARSHIP_CONFIG` at
`broken-starship.toml` and the error goes
to the error stream, once:

```text
[ERROR] - (starship::config): Unable to parse the config file: TOML parse error at line 3, column 6
```

—and then Starship renders the *default*
prompt and exits successfully (transcript
t07). In a live shell, where the error
stream scrolls past at startup if it is
shown at all, the only symptom is a
prompt that looks like yesterday's
defaults. Your shell never breaks. Your
customisations just vanish.

**A typo in the format string fails in
complete silence.** `typo-starship.toml`
is perfectly good TOML whose format names
a module called `$charakter`. Starship
renders `root in ❯` — it skipped the
unknown name without a single line of
complaint, keeping the modules it
recognised. No error, no warning, exit
code 0.

These are not complaints about the tool;
they are its documented temperament, and
chapter 15 turns both into checklist
entries. But they are why this chapter
exists: with a program that fails this
quietly, the interrogation tools are not
a luxury. They are how you find out.
