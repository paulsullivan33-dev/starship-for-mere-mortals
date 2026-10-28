# Limits

Starship is a modest tool with an immodest
surface, and a reader is owed the plain
account of where it stops. This chapter
names the limits the lab met, in the
order a user usually meets them.

## It renders. It changes nothing.

Starship's entire power is to compose a
string. It does not cd for you, complete
for you, correct your commands, manage
your versions or clean your repository.
The `[!]` in the prompt will watch you
commit the wrong change to the wrong
branch with perfect serenity. Every
module is a witness, none is a guardrail.
Tools that *act* — version managers that
switch interpreters, direnv loading a
folder's environment — are complements,
not competitors, and the prompt will
often be how you notice they acted (or
didn't: chapter 7's version segment
reporting the interpreter that would
actually run).

## The glyphs are only as real as the font

Chapter 3's measurement stands as a
limit, not an install note: the default
branch glyph is a Private Use codepoint,
and on a machine without a Nerd Font it
cannot render — the prompt is not broken,
one character of it is simply not in any
font you own. A prompt carried across
many machines (an SSH-heavy life) meets
this repeatedly, because the font that
matters is the one in the *terminal you
are looking at*, which may belong to a
different machine than the one running
the shell. Chapter 10's substitutions
and chapter 11's `no-nerd-font` preset
are the standing mitigations; there is
no detection Starship can do — from its
seat, the glyph was emitted correctly.

## Its failures are silent

The two failures of chapter 8 generalise
into the tool's deepest limit: Starship
errs toward a working prompt, always. A
configuration it cannot parse falls back
to defaults with one line to the error
stream. An unknown name in a format
string is skipped without comment. A
module whose command exceeds its timeout
contributes nothing. A detector whose
marker files are not found says nothing.
In every case the prompt appears, is
plausible, and may be quietly *less*
than you configured or than the folder
deserves. There is no mode in which
Starship complains at length. The
interrogation tools of chapter 8 are
therefore not optional equipment: they
are the error messages, available on
request.

## Detection is not truth

Chapter 7's lesson, filed as a limit:
the prompt displays what detectors find,
and detectors work from surfaces. A
`.python-version` file triggers a segment
whose number comes from the interpreter,
not the file. A `package.json` marked
private suppresses a true version. A
branch without an upstream is ahead of
nothing and shows it. A folder can be a
project in every way that matters and
wear none of the marker files a module
watches for — a Makefile and a dream —
and the prompt will show a directory and
an arrow. The prompt is a very good
summary of the evidence available to it,
and evidence is all it is.

## The bill arrives on every Enter

A prompt that runs git, interrogates
interpreters and scans folders pays for
it per prompt, in parallel and against
deadlines, but pays. Chapter 8's timings
— about fifteen milliseconds in a small
repository, git_status the largest item —
scale with the repository and the disk:
a huge working tree, a network
filesystem, a cold cache, and the prompt
becomes a pause you can feel. The
deadlines mean the failure mode is
omission rather than freezing, which is
the right choice and still a limit: on
exactly the repositories where status
matters most, the prompt is most likely
to arrive without it. Powerlevel10k's
existence (chapter 13) is the market's
commentary on this limit.

## It introduces you, every time

And the limit from chapter 1, restated
where limits live: a Starship prompt
*will* publish your username, your
paths and your projects to anyone who
sees your screen, because that is what
it is for. Modules exist for cloud
accounts, Kubernetes contexts and more —
segments that are genuinely useful at
the keyboard and genuinely revealing in
a screenshot, a recording, a shared
terminal session at a conference. The
tool has no sense of audience. Yours
has to serve for both of you: choose the
segments as if the prompt were a poster,
because several times a year, it is one.
