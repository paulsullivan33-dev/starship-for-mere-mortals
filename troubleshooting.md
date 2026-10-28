# Troubleshooting

The failures of a prompt are small,
recurring and — chapter 8's warning —
quiet. These are the ones the lab either
met or manufactured, each with the check
that names it.

## The prompt did not change at all

**Symptom:** Starship installed, the line
added, a new shell opened — and the old
prompt is still there.

**Likely causes, in order.** The
`eval "$(starship init …)"` line is not
the *last* prompt-affecting line in the
startup file: something loaded after it —
a framework, a theme, a distribution's
own prompt package — set the prompt and
won. The line is in the wrong file for
the shell you opened (`.bashrc` read by
interactive bash; zsh reads `.zshrc`; a
login shell may read a different file
again). Or the shell you opened is not
the shell you configured.

**Check:** start the shell the way the
lab does, with nothing but the one line —
`bash --rcfile starship-lab/rc-bash -i`.
If the prompt appears, Starship and the
binary are innocent, and the culprit is
in your startup files, between the line
and the end. Chapter 12 shows the same
test for zsh with `ZDOTDIR`.

## Boxes and blanks where symbols should be

**Symptom:** the branch name appears
without its glyph, or with a hollow
rectangle in its place; some segments
look fine.

**Cause:** chapter 3's font limit. The
branch glyph is a Private Use codepoint
and the font in your terminal has nothing
to draw there. Other glyphs — the emoji
class — survive, which is why the damage
looks partial.

**Check:** you cannot grep your way to a
font, but you can confirm the diagnosis:
`starship prompt` piped through the
codepoint listing of transcript t08
shows U+E0A0 in the output, and your
font list (`fc-list` on Linux) shows no
Nerd Font. **Fix:** install one and set
the *terminal* to it — or take chapter
11's `no-nerd-font` preset, or replace
the symbol in chapter 10's way. Changing
anything in Starship's own configuration
cannot add a glyph to a font.

## The prompt feels slow

**Symptom:** a beat between Enter and
the prompt arriving, worst in big
repositories.

**Check:** `starship timings` in the
folder where it hurts (chapter 8). The
table names the module and its cost;
the usual suspects are git_status in a
repository with a vast working tree and
language modules running slow
interpreters. **Fixes, in order of
preference:** disable the module you do
not need (`disabled = true`); reduce
what it scans (the git modules respect
the repository, but a home folder that
is itself a repository is a classic
self-inflicted wound — every prompt on
the machine is then "in a repo"); and
only as a last resort raise
`command_timeout`, which buys accuracy
at the price of the pause. Do not accept
a slow prompt as weather; it is a named
module with a number beside it.

## My configuration is being ignored

**Symptom:** you edited the file; the
prompt is unmoved — or has reverted to
looking entirely default.

**Likely causes.** The file is not where
Starship is looking: defaults read
`~/.config/starship.toml`, and an
exported `STARSHIP_CONFIG` from an old
experiment (the lab sets it *per
command* for a reason) silently outranks
the real file. The file fails to parse —
chapter 8's first silent failure — in
which case the default prompt's
appearance is the tell. Or the change
you made is in a section the prompt does
not reach: a module restyled but absent
from a custom `format` string will not
appear no matter how beautifully it is
styled.

**Check:** `starship print-config` and
read the merged result for your key; run
`starship prompt` by hand once and watch
the error stream for the parse error's
one line; and diff your `format`, if you
have one, against the modules you expect
to see.

## A segment vanished

**Symptom:** one segment that used to
appear is gone, though its folder and
circumstances look the same.

**Check:** `starship module <name>` in
the folder (chapter 8). Nothing printed
means the *detector* declined, and the
list of reasons is short and concrete:
the marker files changed (chapter 7); a
rule you forgot you met fired — the
`private` package.json of chapter 7 is
the type specimen; the module was
disabled by a configuration you are
sharing with another shell or machine;
or the state it reports is genuinely
absent, like the clean repository's
missing bracket, which was never a
fault. Something printed, but the prompt
disagrees, points back at the previous
entry: the format string, not the
module, decides who reaches the line.

## The arrow is always red (or never)

**Symptom:** the character claims failure
after commands that plainly succeeded —
or never claims it at all.

**Cause:** the shell hands Starship the
exit code; something between the command
and the prompt is eating or inventing
it. The usual suspects are other startup
file machinery running its own command
in between (a framework hook, a
title-setting snippet) and wrapper
functions that return their own status.
**Check:** the manufactured evidence of
transcript t04 — `starship prompt
--status 0` and `--status 1` through
`cat -v`, watching the character's code
flip between `1;32` and `1;31`. If the
codes flip, Starship is a faithful
witness and the code it receives in your
shell is the problem; `echo $?` as the
literal first thing at a fresh prompt
will show you what your shell thinks the
last command did, before Starship's
opinion is even consulted.

## The `#` before every prompt (zsh)

Not a symptom — chapter 12 names it:
zsh's end-of-line marker for root,
printed because prompt text ends without
a newline. Set `PROMPT_EOL_MARK=""` in
`.zshrc` if it bothers you; leave it if
you enjoy knowing the machinery is
visible somewhere.
