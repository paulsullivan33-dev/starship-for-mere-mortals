# Configuring Starship

Everything so far was the default
stranger's prompt. This chapter writes a
configuration file — five changes, each
small enough to see — and reads the
result with the tools from chapter 8.
The file the lab writes ships as
`starship-lab/starship.toml`; the
method matters more than its taste.

## Where the file lives, and how to rehearse

By default Starship reads
`~/.config/starship.toml`. If the file
does not exist, the defaults rule, and
the fastest way to start is to create it
empty and add one change at a time.

The lab rehearses instead of committing:
it keeps candidate files anywhere and
points the environment variable
`STARSHIP_CONFIG` at one for a single
command:

```bash
STARSHIP_CONFIG=starship-lab/starship.toml starship prompt
```

Set the same variable in a shell and
every prompt in that shell obeys it,
which is how chapters 10 and 11 try on
styles and presets. When a configuration
earns its place, copy it to
`~/.config/starship.toml` and unset the
variable. The rehearsal habit is worth
adopting permanently: a prompt you cannot
afford to break deserves a spare.

## The lab's five changes

Here is the whole file (transcript t06
keeps it verbatim):

```toml
# 1. The whole prompt is rebuilt from a format string: only these
#    segments, in this order. Everything not named stays home.
format = "$username$directory$git_branch$git_status$status$character"

# 2. No blank line before the prompt.
add_newline = false

[directory]
# 3. Show more of the path, and paint it yellow.
truncation_length = 5
style = "bold yellow"

[git_branch]
style = "bold purple"

[status]
# 4. The status segment, which is off by default, switched on.
disabled = false

[python]
# 5. The Python segment, switched off entirely.
disabled = true
```

Five changes, five different mechanisms
— together they are most of what
configuration ever does:

1. **`format`** — the master string.
   Every module the prompt may show is a
   `$name` in this string, in order.
   Naming a subset is the strongest
   statement a configuration can make:
   in the lab's prompt the container
   badge, the package version, the clock
   and a hundred other modules are absent
   *because they are not named*, not
   because they were individually
   dismissed.
2. **`add_newline`** — a top-level switch
   (not a module): whether a blank line
   precedes the prompt.
3. **A module's own knobs** — the
   directory module's `truncation_length`
   and `style`, set in its `[directory]`
   section. Every module keeps its tuning
   in a section named after it; the full
   inventory of knobs lives in the
   project's configuration documentation,
   and `starship print-config` (chapter 8)
   shows the ones in force.
4. **Enabling** — `disabled = false` in
   `[status]`. A handful of modules ship
   disabled (status is one; the clock is
   another); the switch is the whole
   ceremony.
5. **Disabling** — `disabled = true` in
   `[python]`. The module's detector never
   runs; the segment cannot appear.

## The result, read back

In a plain folder, with a manufactured
failure to give the new status segment
something to say (transcript t06):

```text
$ STARSHIP_CONFIG=starship-lab/starship.toml starship prompt --status 3
root in workspace/build-check/starship-scratch/lab/plain ❌3 ❯
```

Compare chapter 4's default: the blank
line is gone, the path is five components
deep instead of three, the container
badge has vanished with everything else
the format did not name, and `❌3` stands
where only the arrow used to blush. In
trailnotes the same file produces:

```text
root in trailnotes on  main ❌3 ❯
```

The Python segment — present in every
trailnotes prompt until now — is absent,
dismissed by change 5; the package
segment is absent too, unnamed by change
1. Two different mechanisms, one
silhouette. When one of your own segments
goes missing someday, chapter 8's
`print-config` and `explain` will tell
you which mechanism took it.

A warning about the measuring instrument,
earned by the lab: with a custom format
in force, `starship explain` listed the
segments *out of prompt order* (the
character first, the username last) —
sorted, apparently, by rendered width.
The segments and their reasons were all
correct; only the parade order changed.
Trust explain for membership and meaning.
For order, trust the prompt itself, or
the format string you wrote.

## The grammar, briefly

Three format-string habits cover most
editing you will ever do. **Grouping:**
`[$branch]($style)` renders the bracketed
part only if the variable inside it has
a value — that is how optional segments
avoid leaving empty brackets behind.
**Styles:** the text in the second pair
of parentheses is either `$style` (the
module's configured style) or words of
your own — `bold yellow`, `underline`,
a colour by name or number. **Literals:**
anything outside brackets is printed as
written, which is where the words `in`,
`on` and `via` in the default prompt come
from — they are part of the modules'
format strings, not Starship's grammar.
Chapter 10 puts all three to work.
