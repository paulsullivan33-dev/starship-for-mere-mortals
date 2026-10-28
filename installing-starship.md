# Installing Starship

Starship is one binary, and it is
installed the ways single binaries are:
from your operating system's packages,
from the project's own release download,
or by the project's installer script.
This guide's lab used the **official
release binary**, verified against the
checksum the project publishes beside it
— the route taught first here, because it
works the same on every Linux and shows
exactly what a checksum is for. The
alternatives end at the same command.

## The release binary, with its checksum

Starship publishes each release on its
GitHub releases page as an archive per
platform, with a matching `.sha256` file.
On a 64-bit Intel or AMD Linux machine,
the lab's route (transcript t00) was:

```bash
curl -LO https://github.com/starship/starship/releases/download/v1.27.0/starship-x86_64-unknown-linux-gnu.tar.gz
curl -LO https://github.com/starship/starship/releases/download/v1.27.0/starship-x86_64-unknown-linux-gnu.tar.gz.sha256
cat starship-x86_64-unknown-linux-gnu.tar.gz.sha256
sha256sum starship-x86_64-unknown-linux-gnu.tar.gz
tar xzf starship-x86_64-unknown-linux-gnu.tar.gz
./starship --version
```

The two hashes — the one in the file you
downloaded and the one your machine
computes — must match character for
character. In the lab they did:
`3b94758850901717eb36aa1b53f8492c13…`,
the same string from both. That is the
whole ceremony, and it is worth the ten
seconds: the prompt will run inside every
shell you open, with your permissions,
for years. Chapter 1's small discipline —
know where your prompt comes from — is
this chapter's first command.

Check: the version printout reads —

```text
$ starship --version
starship 1.27.0
branch:main
commit_hash:f8e4e21
```

— and 1.27.0 is the version behind every
transcript in this guide. Prompts are a
fast-moving surface: symbols and defaults
shift between releases, so when another
person's screenshot disagrees with yours,
compare this line before anything else.

From there, put the binary somewhere on
your `PATH` — `~/.local/bin` for a
personal install, `/usr/local/bin` for
the machine — and the install is done.
There is nothing to enable and nothing
to start: until a shell is told about
Starship (chapter 4), the binary is an
inert file.

## The other routes

**Package managers** are the comfortable
route on most systems: Starship is in the
Debian, Ubuntu, Fedora and Arch
repositories, in Homebrew on macOS and
Linux, in winget and Scoop and Chocolatey
on Windows, and in most other collections
a reader is likely to use. The trade is
freshness: a distribution's Starship may
lag the releases by a version or two,
which matters only when a chapter of
advice names a new module.

**The installer script** on the project's
site (`curl -sS https://starship.rs/install.sh | sh`)
automates the release-binary route. It is
the project's own script and widely used;
this guide still teaches the manual route
first, because a reader who has placed
one binary by hand and checked one
checksum understands what the script is
doing on their behalf — and prompt
software, of all software, deserves the
ten seconds.

## The font question, answered early

Starship's default prompt uses a handful
of symbols, and one of them — the little
branch glyph in front of a git branch
name — is not an ordinary character. It
lives in the **Private Use Area** of
Unicode, the codepoints (this one is
U+E0A0) that fonts may fill with whatever
they like and most fill with nothing.
The fonts that fill it deliberately are
the **Nerd Fonts**: ordinary programming
fonts patched with a library of icons,
free to download, installed like any
font.

The lab measured this rather than
asserting it (transcript t08). Of the
five non-ASCII characters in the
trailnotes prompt — the branch glyph, the
package 📦, the snake 🐍, the hexagon ⬢
and the arrow ❯ — four are ordinary
Unicode that any modern font carries.
Only the branch glyph is Private Use.
And the lab machine, with 2,051 fonts
installed, has not one Nerd Font among
them — so on the lab machine, that one
glyph can only appear as a placeholder
box or blank, exactly as chapter 15's
first troubleshooting entry describes.

The practical upshot, stated plainly:
**install a Nerd Font on any machine
where you will actually look at the
prompt**, set your terminal to use it,
and the problem class disappears. Any of
the popular patched fonts will do; the
choice among them is taste. If you would
rather not, chapter 10 shows how to
replace the glyph-bound symbols, and
chapter 11 has a whole preset —
`no-nerd-font` — that does exactly that.
What you cannot do is argue with the
codepoint: without the font, the glyph
is not ugly, it is absent.

## Where the binary looks for orders

An installed Starship with no
configuration file uses its defaults and
looks for orders in
`~/.config/starship.toml`. The lab keeps
the binary on its `PATH` and steers it
with the `STARSHIP_CONFIG` environment
variable instead, so that several
configurations — the default, the lab's
own, a preset, two deliberately broken
ones — can be compared in one sitting
without touching a real config file:

```bash
STARSHIP_CONFIG=starship-lab/starship.toml starship prompt
```

That one habit is behind most of the
transcripts, and chapter 9 starts there.
