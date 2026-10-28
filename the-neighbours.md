# The Neighbours

Starship was not the first prompt to want
more than a dollar sign, and it is not
the only one on the shelf. This chapter
characterises the neighbours — what each
is, where it lives, and the trade it
makes differently. Characterised, not
benchmarked: prompt loyalty is a taste
war this guide declines to enlist in.

## The cross-shell rivals

**Oh My Posh** is Starship's nearest
neighbour and mirror image: also a single
binary (written in Go), also driven by
one configuration file across bash, zsh,
fish and PowerShell, also segment-based.
The differences are of emphasis. Oh My
Posh leans harder into themes — its
gallery of ready-made looks is its front
door — and its configuration is JSON
rather than TOML. A reader choosing
between them is choosing a configuration
dialect and a default aesthetic more
than a capability; both will tell you the
branch, the version and the time.

**Powerline**, the original, began as a
statusline for the Vim editor and spread
to shells, bringing the arrow-segmented
bar that the powerline-style presets of
chapter 11 imitate. Written in Python
and configured accordingly, it is the
grandparent: the glyph set it popularised
is why the Nerd Fonts of chapter 3 exist
in their current form. Its segment model
is shared ancestry, visible everywhere.

## The single-shell classics

**Pure** — the prompt chapter 11's
preset ports — is a zsh prompt of famous
restraint: directory, branch, and an
arrow that changes colour, nothing else,
executed beautifully. It is not a
program but a zsh script, and its lesson
to Starship users is portable: a prompt
can earn loyalty by *refusing* features.
The port exists because the original
cannot leave zsh.

**Spaceship** is the other zsh classic,
Pure's exuberant opposite: a rich,
sectioned prompt that was a direct
inspiration for the module-per-fact
design Starship generalised. Readers who
live entirely in zsh and want the maximal
version of the idea should know it
exists; readers who roam shells have
already chosen the generalisation.

**Liquidprompt** serves bash and zsh
with an adaptive philosophy: it shows a
fact only when the fact crosses a
threshold worth attention — load when
load is high, battery when battery is
low. Starship's silent-until-relevant
modules rhyme with this, and for the
*system-state* facts (temperature,
load, jobs) Liquidprompt's judgement
calls are the most considered in the
field.

**Powerlevel10k** is the zsh prompt for
people who want everything and want it
instantly: a configuration wizard, a
cache that makes the prompt appear
before the shell has finished starting,
and speed as a headline feature. It is
the strongest answer to chapter 14's
cost limit — inside zsh, where it
refuses to leave. Its existence is also
the fair counterweight to this guide's
bias: if your shell is settled forever,
a native prompt tuned to it can beat a
portable one on its home ground.

## The framework themes

The shell frameworks — **Oh My Zsh**,
**bash-it**, **fisher** and their kin —
bundle prompts as *themes* among many
other goods: plugins, completions,
aliases. A framework theme is a prompt
someone else maintains inside a larger
machine, swapped by name rather than by
editing a file of yours. That convenience
is real, and so is the trade: the theme
changes when the framework updates, the
configuration surface is the framework's,
and the prompt follows you only where
the framework goes. Starship's bet is
that the prompt deserves its own small
file, owned by you, independent of any
framework — chapter 11's closing argument
in other words. The bets coexist fine;
a framework can carry Starship as its
prompt, and many setups do exactly that.

## The hand-written prompt

Finally, the zero-dependency neighbour:
every shell can build a prompt from its
own language — bash's `PS1` with its
escapes for user, host and folder, plus
a command substitution running
`git branch` — and for decades that is
what everyone did. It costs nothing and
installs nothing, and a hand-written
prompt that shows the folder and the
branch is an afternoon's small script.
What it grows into, feature by creeping
feature — exit codes, durations, language
versions, a configuration file to keep
it manageable — is Starship, rewritten
privately at ten times the effort. The
hand-written prompt remains the right
answer where installing a binary is not
an option. Everywhere else, it is the
reason this tool exists.
