# Presets

A **preset** is a complete configuration
file, written by the Starship project or
its community, that ships inside the
binary and can be printed on demand. This
chapter applies one for real and reads
two more, because presets teach the
configuration language faster than any
reference: they are worked examples with
opinions.

## The shelf

```text
$ starship preset --list
bracketed-segments
catppuccin-powerline
gruvbox-rainbow
jetpack
nerd-font-symbols
no-empty-icons
no-nerd-font
no-runtime-versions
pastel-powerline
plain-text-symbols
pure-preset
tokyo-night
```

(transcript t09.) The names sort
themselves into families. The
**restyles** — pastel-powerline,
catppuccin-powerline, tokyo-night,
gruvbox-rainbow, jetpack — rebuild the
prompt as a sequence of coloured
segments, the powerline look. The
**removals** — no-nerd-font,
plain-text-symbols, no-empty-icons,
no-runtime-versions — keep the default
shape and take something specific away.
And **pure-preset** is a port of Pure, a
beloved minimal prompt from the zsh
world (chapter 13) — two lines, almost
nothing on them.

Printing one costs nothing and changes
nothing:

```bash
starship preset pure-preset
```

writes the whole configuration to
standard output. Reading the top of it
(transcript t09) is a chapter 9 lesson
in disguise — a multi-line `format`
string naming a short parade, then
sections restyling what remains:

```toml
[character]
success_symbol = "[❯](purple)"
error_symbol = "[❯](red)"
vimcmd_symbol = "[❮](green)"
```

## One applied

The lab saved the printout whole and
pointed `STARSHIP_CONFIG` at it. In
trailnotes (transcript t09):

```text
root in trailnotes main
❯
```

Set beside chapter 4's default, the
difference is an aesthetic philosophy.
Gone are the words *on* and *via*, the
package and language segments, the
container badge; the branch stands bare;
the prompt breaks into two lines and
puts the arrow alone on the second, like
a cursor in an empty room. Nothing about
it is more *correct* than the default.
It is quieter, and it trusts the reader
to know that `main` after a directory in
a repository needs no introduction. If
that is your temperament, an entire
taste is one command away; if it is not,
the exercise still pays, because the
printed file shows *how* the quiet was
achieved — the format string is right
there to steal from.

## The font pair, again

Chapter 3 promised this chapter would
close the font question, and the preset
list is where it closes.
**nerd-font-symbols** goes one way: it
substitutes richer icons throughout —
the lab greped its git_branch section
and found `symbol = " "`, a Private Use
glyph with even more flourish than the
default. **no-nerd-font** goes the other:
it is the preset for readers who took
chapter 3's warning and decided against
installing a font, replacing the
glyph-bound symbols with ones ordinary
fonts carry. The pair of them, shipped
side by side, is the project admitting
both answers are legitimate — the font
is a preference, and the configuration
language is how the preference is
expressed.

## How to use a preset honestly

A preset is a starting point, not a
finishing one. The workflow this guide
recommends: print the preset into your
configuration file, then treat it as
chapter 9 treats any configuration —
rehearse it with `STARSHIP_CONFIG`,
live with it for a day, and edit it in
place as its opinions rub. The file is
yours from the moment it is printed;
that is the difference between a preset
and a theme in the framework sense
(chapter 13), where the look you wear is
someone else's ongoing code. When a
preset and your edits drift far enough
apart, what you have is simply your
configuration — which was the destination
all along.
