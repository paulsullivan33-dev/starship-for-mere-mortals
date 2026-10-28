# Starship in Other Shells

Everything so far happened in bash. This
chapter keeps the guide's central promise
— one configuration, every shell — and
sorts its evidence carefully: zsh is
**verified live**, on the same lab bench
as bash. The rest are presented from
their initialisation scripts, which the
lab generated and read, and from the
project's documentation; the text says
so wherever it matters.

## zsh, for real

The lab's second shell session
(transcript t11) starts zsh with the
same one-line startup file
(`starship-lab/rc-zsh`, worn as `.zshrc`
in a folder that `ZDOTDIR` points at —
zsh's way of being handed a startup
file). The session:

```text
root in starship-scratch/lab/plain
⬢ [OCI] ❯ pwd

/home/hatch/workspace/build-check/starship-scratch/lab/plain

root in trailnotes on  main is 📦 v0.1.0 via 🐍 v3.12.3
⬢ [OCI] ❯ git status --short
```

It is chapter 4's prompt, segment for
segment, in a different shell, from the
default configuration, with no
translation. That identity is the entire
sales pitch of a cross-shell prompt,
demonstrated rather than asserted: the
git knowledge, the language detection,
the container badge — none of it is
bash's or zsh's doing; both shells are
just asking the same binary the same
question.

One honest oddity rides along in the
transcript: the lone `#` standing before
each prompt. That is zsh itself, not
Starship: zsh prints an end-of-line
marker when the previous output did not
end with a newline — `%` for ordinary
users, `#` for root — and a prompt string
never ends with a newline. It can be
silenced from zsh's own settings
(`PROMPT_EOL_MARK=""`), but the lab left
it in the transcript, named here, because
a reader who meets it should know whose
voice it is.

## The bridges, printed

For every other shell, the lab can at
least show the bridge being built.
`starship init <shell>` prints the
startup script; transcript t10 keeps the
heads of four:

- **bash** and **fish** print a one-line
  bridge that hands over to the full
  script on demand (`starship init bash
  --print-full-init`) — the shell sources
  the real machinery from the binary
  itself, so there is no script to
  install, copy or keep in step.
- **zsh** prints its script in full, and
  its head carries a comment worth
  reading: a note about how zsh runs its
  pre-command hook only when a command
  actually runs, and the workaround
  Starship builds for the timings of
  chapter 6. Even the bridges are honest
  about their shells' quirks.
- **PowerShell** prints one line of
  `Invoke-Expression` that does the same
  hand-over in PowerShell's grammar. The
  line a PowerShell user adds to their
  profile is the eval-shaped twin of
  chapter 4's:

  ```powershell
  Invoke-Expression (&starship init powershell)
  ```

## What the documentation adds

From the project's documentation, and
labelled as read-not-run:

- The supported cast is wide: bash, zsh,
  fish, PowerShell, and also Elvish,
  Nushell, xonsh, Ion, tcsh and the
  Windows cmd shell via Clink. Each gets
  the same prompt from the same
  configuration.
- Features vary at the edges, because
  shells differ in what they can hand
  over. A **right-hand prompt** — a
  second, right-aligned string, good for
  a clock — is available in zsh, fish
  and several others, configured with
  the top-level `right_format`; bash and
  PowerShell do not offer the hook it
  needs, and the lab's shells therefore
  never showed one. **Transient prompt** —
  collapsing past prompts to something
  shorter so scrollback stays readable —
  is a fish and PowerShell feature in the
  same sense: real, documented, and
  unrun here.
- Vim users of zsh and fish get a small
  courtesy: the character module can
  change shape in vi command mode (the
  pure preset of chapter 11 configures a
  `❮` for it), which is the kind of
  detail a single-shell prompt would
  never need to know.

The standing advice is the chapter in
one line: pick your shell for the shell's
own reasons, and let the prompt be the
thing that does not change when you do.
