# When Commands Fail

Half of a prompt's job is reporting on
the folder. The other half is reporting
on *you* — specifically, on the command
you just ran. This chapter covers the
three witnesses to a command's fate: the
character that changes colour, the status
module that names the failure outright
(off by default, and this chapter shows
why you might switch it on), and the two
quiet recorders, duration and jobs.

## The blushing arrow

Run a command that fails — `false` will
do — and look at the next prompt. In
stripped text it is identical to the one
before. On a real screen, one thing has
changed: the `❯` is red instead of green.

Because colour is exactly the thing a
text transcript cannot show, the lab
proved it from the bytes (transcript
t04). `starship prompt` accepts the facts
a shell would hand it, including
`--status`, and `cat -v` makes the colour
codes visible:

```text
$ starship prompt --status 0 | cat -v
^[[1;32m❯^[[0m        (the character, in bold green: 1;32)

$ starship prompt --status 1 | cat -v
^[[1;31m❯^[[0m        (the same character, in bold red: 1;31)
```

(In the full transcript the codes wrap
the whole prompt; the character's pair is
the only one that changes.) Every other
exit code behaves the same way: zero is
success, everything else is the red
arrow. A command killed by a signal, a
command not found (127), a permission
refused (126) — all red. The character
module is a binary witness: it testifies
that something went wrong, never what.

That bluntness is a deliberate default.
Most failures announce themselves in
their own output; the prompt's job is the
subliminal one, catching the eye *before*
you type the next command on the
assumption that the last one worked. If
you have ever chained three commands onto
a failed `cd`, you have wanted this
arrow.

Two footnotes the lab verified rather
than assumed. First, `starship explain`
does not change under `--status 1` — the
character's line reads the same, because
explain describes *which* segments exist,
not the state that colours them. Second,
in shells that report them, Starship
accepts a whole pipeline's worth of exit
codes (`--pipestatus`), and the character
judges the pipeline, not just its last
link.

## The status module: naming it

If you want the failure *named*, the
**status** module does that — a segment
carrying the symbol ❌ and the numeric
exit code. It is disabled by default,
one of the few modules that is, on the
reasonable theory that most readers do
not want a red badge pinned to every
honest failure. Chapter 9's lab
configuration enables it, and with it,
transcript t06's prompt after a failure
(exit code 3, manufactured) reads:

```text
root in trailnotes on  main ❌3 ❯
```

The module is configurable in the usual
ways: its symbol, whether to show the
code as a signal name where one applies
(a process killed by SIGINT can read as
such), and a `pipestatus` mode that
spells out each link of a failed
pipeline. Switched on in a shell that
drives builds and scripts — where *which*
code came back steers the next command —
it earns its space. Left off everywhere
else, the blushing arrow is enough. The
choice is genuinely taste, and this guide
refuses to pretend otherwise.

## Duration: the recorder with a threshold

The **cmd_duration** module answers the
question *did that take suspiciously
long?* — and, like a good witness, speaks
only when the answer is interesting. Its
default threshold is two seconds. The
lab's evidence (transcript t04):

```text
$ starship prompt --cmd-duration 95000
root in starship-scratch/lab/plain took 1m35s
⬢ [OCI] ❯

$ starship prompt --cmd-duration 1500
root in starship-scratch/lab/plain
⬢ [OCI] ❯
```

Ninety-five seconds earns a `took 1m35s`
segment; one and a half seconds earns
silence. In the interactive session
(transcript t04's companion), the same
behaviour arrives honestly: after
`sleep 3`, the next prompt simply
includes `took 3s`, unprompted and
unmissable. The threshold and the format
are configuration (`min_time`, in
milliseconds) — build systems and backup
scripts argue for a higher floor, quick
network commands for a lower one.

## Jobs: the other thing running

The **jobs** module counts background
jobs — commands you started with `&` and
have not collected. It too is silent
until there is something to count:

```text
$ starship prompt --jobs 3
root in starship-scratch/lab/plain
✦3 ⬢ [OCI] ❯
```

Three jobs earn a `✦3`. One job shows
the symbol alone by default — the single
most forgettable object in a terminal is
a lone backgrounded command, and the
prompt's quiet `✦` is the reminder that
it is still out there, or still stuck.
