# The Moving Parts

Starship has four parts, and every
confusion in later chapters is one of
them wearing another's coat. They are:
one **binary**, one line in a **shell
startup file**, one **configuration
file**, and the **modules** that the
configuration arranges.

## The binary

`starship` is a single self-contained
program. It has no daemon, no service,
no database; when the shell wants a
prompt, it runs the binary, the binary
works out what the prompt should say,
prints it, and exits. A prompt is a
fresh computation every time — which is
why the prompt can react to a file a
program created a second ago, and why
its cost (small, measurable, chapter 8)
is paid on every Enter.

The same binary carries a toolkit of
subcommands this guide uses throughout:

| Subcommand | What it does |
|---|---|
| `starship prompt` | Print the prompt for the current folder, exactly as the shell would receive it |
| `starship explain` | Print the prompt with each segment annotated: what it is and why it is there |
| `starship timings` | Print each module with the time it took and the text it produced |
| `starship module <name>` | Run one module alone, in the current folder |
| `starship print-config` | Print the configuration actually in force, with every default filled in |
| `starship preset` | List and print the ready-made configurations that ship with the tool |
| `starship init <shell>` | Print the startup script for a shell — the bridge to part two |

Because `starship prompt` can be run by
hand, nothing about the prompt is magic:
any segment in any chapter of this guide
can be summoned, timed and interrogated
outside a shell. The guide leans on this
constantly — it is how the lab kept
evidence instead of impressions.

## The line in the startup file

A shell learns about Starship from its
**startup file** — `~/.bashrc` for bash,
`~/.zshrc` for zsh, and their kin. The
whole integration is one line, evaluated
when the shell starts:

```bash
eval "$(starship init bash)"
```

`starship init bash` prints a small
script, and the shell runs it. The script
teaches the shell three things: to call
Starship before each prompt, to hand over
the facts only the shell knows (the last
command's exit code, its duration, the
number of background jobs), and to use
what Starship returns as the prompt
string. Different shells need different
scripts — chapter 12 prints four of them
side by side — but the pattern never
changes, and neither does the
housekeeping rule: **the Starship line
goes last in the startup file**, because
anything loaded after it that also sets
the prompt will win, and Starship will
look mysteriously dead (chapter 15).

The lab does not touch a real startup
file. It runs shells with throwaway
startup files of its own —
`starship-lab/rc-bash` and
`starship-lab/rc-zsh`, each containing
exactly the one line — so the sessions in
the transcripts are the tool and nothing
else.

## The configuration file

Everything else — which modules appear,
in which order, in what colours, with
what symbols — lives in one **TOML**
file: `~/.config/starship.toml` by
default, or wherever the environment
variable `STARSHIP_CONFIG` points. No
file is required: Starship has a complete
set of built-in defaults, and the prompt
in chapter 4 is what they produce.

Two sentences in the configuration do
most of the work. The top-level `format`
is a string naming the modules in order
— `"$username$directory$git_branch…"` —
and it is an exclusive list: a module not
named in a custom `format` does not
appear, a fact chapter 9 exploits and
chapter 15 files under *traps*. Below it,
a section per module (`[directory]`,
`[git_status]`, …) tunes that module: its
own `format`, its `style`, its `symbol`,
and nearly always a `disabled` switch.

The lab's configuration,
`starship-lab/starship.toml`, makes five
changes and no more, so that each one can
be seen. Two broken siblings —
`broken-starship.toml`, which is not
valid TOML, and `typo-starship.toml`,
whose format names a module that does
not exist — exist to demonstrate how
quietly Starship fails, in chapter 8 and
again in chapter 15.

## The modules

A **module** is a detector and a sentence
in one. The detector decides whether the
module has anything to say *here*: the
git modules look for a repository, the
Python module looks for the files that
mark a Python project, the status module
looks at the last exit code. The sentence
renders it: a `format` string with
variables (`$version`, `$branch`,
`$symbol`), wrapped in a style.

Modules fall into families a reader can
hold in one hand:

- **Where you are** — directory,
  hostname, username, the shell and
  container indicators.
- **The repository** — git branch, git
  status, git state, git commit, git
  metrics, and their cousins for other
  version-control systems.
- **The work** — the package version, and
  one module per language or tool:
  Python, Node, Rust, Go and dozens more,
  each watching for its own marker files.
- **The last command** — the character
  (the arrow itself), status, command
  duration, background jobs.
- **The wider world** — cloud accounts,
  Kubernetes context, battery, clock,
  and others that stay offstage in this
  guide and are named in chapter 14's
  account of what a prompt can announce.

`starship module --list` prints the full
cast — the lab counted past a hundred —
and chapter 8 shows how to interrogate
any one of them alone.

## How a prompt happens

Put the parts together for one Enter:

1. You press Enter. The shell, following
   the script the startup line installed,
   notes the last command's exit code,
   its duration and the jobs running.
2. The shell runs `starship prompt` with
   those facts and the current folder.
3. Starship loads the configuration (or
   the defaults), walks the modules named
   in `format`, and each detector runs —
   in parallel, against a deadline.
4. The surviving segments are styled,
   escaped for the shell in question, and
   printed as one string.
5. The shell displays the string as your
   prompt. The binary has already exited;
   nothing lingers.

Step 3's deadline is a real limit with a
name — `command_timeout`, 500
milliseconds by default — and it is why
a module that goes hunting through a huge
repository can be *cut off* rather than
merely slow. Chapter 8 times the modules
in a real repository, and chapter 15
treats the prompt that feels sticky.
