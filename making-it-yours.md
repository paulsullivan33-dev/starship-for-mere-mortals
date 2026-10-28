# Making It Yours

Chapter 9 changed the prompt's skeleton.
This chapter changes its clothes: the
symbols it speaks in, the words it
substitutes, the modules it shows counts
for instead of flags — and the two
settings that keep all of it fast. Every
change here was run by the lab; the
evidence is transcript t12 unless a
chapter is named instead.

## Symbols: the arrow is a setting

The character module's arrow is two
settings, one per fate of the last
command:

```toml
[character]
success_symbol = "[➜](bold green)"
error_symbol = "[➜](bold red)"
```

Saved as `starship-lab/character.toml`,
the prompt's ❯ becomes ➜ in both states,
keeping the green/red testimony of
chapter 6. The bracket grammar from
chapter 9 is doing the work: the text in
the first brackets is the symbol, the
second pair styles it. Every module with
a `symbol` setting — git's branch glyph,
the languages' icons, the jobs ✦ — takes
the same treatment, which is also the
escape hatch from chapter 3's font
problem: a symbol your font cannot draw
can be replaced with one it can, or with
plain letters, and nothing else about
the prompt changes.

## Styles: colour with a vocabulary

A module's `style` accepts colour names
(`red`, `yellow`, `purple`, and their
`bold` and `bright-` variants), numbers
from the terminal's 256-colour palette,
and hex values — plus the attributes
`bold`, `underline`, `italic` and
`dimmed`, in combination. Chapter 9
painted the directory `bold yellow` and
the branch `bold purple` this way. Two
cautions from experience. Colour is the
least portable part of a prompt — a
scheme tuned on one terminal's palette
can look ill on another's — and it is
the least informative: a segment should
be identifiable by its symbol and place
even with the colour stripped, as every
transcript in this guide demonstrates by
stripping it.

## Substitutions: renaming the world

The directory module accepts a
`substitutions` table that rewrites path
components before display:

```toml
[directory]
substitutions = { "starship-scratch" = "LAB" }
```

and the lab's plain folder promptly
became `LAB/lab/plain`
(`starship-lab/substitutions.toml`,
transcript t12). Long work prefixes, a
home-folder path with your employer's
name in it (chapter 1 is listening), a
deep mount you always mean as just
"media" — substitutions are how a prompt
learns your private names for places
without renaming a single real folder.
Nothing on disk changes; only the
telling does.

## Switching off, and the honest toggle

You met `disabled = true` in chapter 9.
Its companion command is
`starship toggle <module>`, which flips
an *existing* `disabled` key in the
configuration file — the lab flipped the
lab configuration's Python off-switch
both ways, watching the file change
(transcript t12). Its limits are as
instructive as its convenience: asked to
toggle a module whose section has no
`disabled` key yet, it refuses —

```text
$ starship toggle directory
Given config key 'disabled' must exist in config file
```

Toggle is a light switch, not an
electrician: it operates what is wired,
and wires nothing. First-time changes
still belong in an editor, where you can
see the whole file.

## Counts instead of flags

Several summary modules can be taught to
count what they flag. git_status, for
instance, will report `[!3 +2 ?1]`-style
brackets when its module options ask for
counts (`modified`, `staged`, `untracked`
set to counts rather than symbols, in
the module's own vocabulary described in
the configuration documentation), and
cmd_duration and jobs have their own
thresholds (`min_time`, and the jobs
module's `threshold`) deciding when the
count is worth printing. Whether counts
help is a function of your work: in a
repository you are actively cleaning,
numbers steer; in one you are passing
through, flags suffice. The lab left the
flags in place and reports the option
rather than a verdict.

## Keeping it fast

Two global settings guard the prompt's
budget, and both appear in chapter 8's
`print-config`:

- **`command_timeout`** (500 ms) — the
  longest any single external command a
  module runs may take before it is cut
  off. It is why a prompt in a huge
  repository degrades to *less
  information* instead of *no prompt*.
- **`scan_timeout`** (30 ms) — the budget
  for scanning a folder for the marker
  files of chapter 7. Raise it only if a
  module is being missed on a slow
  filesystem; lower it never.

Raising `command_timeout` makes a slow
prompt *more* accurate and *more* slow;
the better cure is chapter 8's `timings`,
which names the module, and this
chapter's `disabled`, which retires it.
A prompt is a thing you wait for ten
thousand times a year. Spend its
milliseconds like it matters, because
compounded, it does.
