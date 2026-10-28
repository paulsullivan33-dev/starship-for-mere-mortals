# Git in the Prompt

Inside a repository, the default prompt
grows a git report. This chapter builds
the report state by state — clean, dirty,
staged, untracked, stashed, unpushed —
and reads each one off the prompt, so
that the symbols become a language you
read at a glance instead of a code you
look up.

## The practice repository

The lab's project is **trailnotes**, a
twenty-line Python program that appends
notes about walks to a text file. It
lives in a git repository whose remote is
another folder on the same machine (a
**bare** repository, `trailnotes-remote.git`),
so pushes and pulls are real but nothing
leaves the computer. `starship-lab/make-fixtures.sh`
builds the whole arrangement from the
sources in `starship-lab/fixtures/`:

```bash
./make-fixtures.sh ~/starship-lab
cd ~/starship-lab/trailnotes
```

Two modules speak for the repository.
**git_branch** names the branch, preceded
by the branch glyph of chapter 3.
**git_status** follows it with a bracket
of symbols summarising the working tree —
and, crucially, says nothing at all when
there is nothing to say.

## Seven states, one repository

Transcript t03 walks the repository
through its life, running
`starship explain` after each step and
watching the git_status line. The states,
in the order life usually presents them:

**Clean.** As committed, in step with the
remote, the explain table has a branch
line and *no* status line:

```text
on  main       -  The active branch of the current Git repo
```

An absent segment is information: git has
nothing to report. Most of a healthy
repository's life is spent in exactly
this prompt.

**Modified — `[!]`.** Append a line to a
tracked file and stage nothing:

```text
[!]   -  Symbols representing the state of the current Git repo
```

The exclamation mark means *tracked files
have unstaged changes*. It does not say
which file or how many — the prompt is a
summary, and `git status` remains the
detail. Chapter 10 shows the module's
option to count the changes instead of
merely flagging them.

**Staged — `[+]`.** `git add` the same
change and the symbol changes character:

```text
[+]
```

A plus means *there are staged changes,
ready to commit*. Modified and staged are
different facts and get different marks;
a file edited again after staging earns
both, `[!+]` in some order — the bracket
is a set, not a sentence.

**Untracked joins in — `[+?]`.** Create a
brand-new file the repository has never
seen:

```text
[+?]
```

The question mark is the untracked flag.
This is the state chapter 4's session
stumbled into live, when `notes.py`
created `notes.txt`: the prompt noticed
before the human did.

**Stashed — `[$]`.** `git stash -u` puts
everything away, tracked and untracked
alike, and the bracket empties to a
single dollar sign:

```text
[$]
```

The work is not gone, and the prompt
refuses to let the clean-looking tree
pretend otherwise: there is a stash, and
it is yours. A plain `git stash` (without
`-u`) leaves the untracked file behind,
and the prompt shows both truths at once
— try it.

**Unpushed — `[⇡]`.** Pop the stash,
commit, and deliberately do *not* push:

```text
[⇡]
```

The up arrow means *ahead of the remote*:
commits exist here that the remote does
not have. (Behind shows `⇣`, both at
once — diverged — shows `⇕`, and the
module can be configured to count them,
`⇡3`.) A push returns the prompt to its
clean state, which is where transcript
t03 leaves the repository.

**The trap the lab set for itself.** The
first version of this transcript had no
`[⇡]` in it, though the commit was duly
unpushed — because the branch had been
pushed the first time *without* setting
it to track the remote, and a branch that
tracks nothing has nothing to be ahead
of. Git could not say it either
(`git status` reported no upstream), so
Starship faithfully reported the silence.
The lesson generalises beyond this
module: **the prompt can only display
what the underlying tools know.** When a
segment is missing, interrogate the tool
beneath it — here, `git branch -vv` —
before blaming the prompt. The fixture
script now pushes with `-u`, and the
arrow appears.

## What the branch line can also say

The branch module has quieter talents the
lab did not need to stage: on a detached
HEAD it names the commit instead of a
branch; the **git_state** module speaks
up during a merge, rebase or cherry-pick
in progress (`MERGING`, `REBASING`, and
friends) — the moments when knowing the
repository is mid-operation matters most;
and **git_commit** can show the current
commit hash or tag when asked. They are
all silent in a calm repository, which is
the design principle of the whole git
family: the prompt is longest exactly
when the repository is in the most
trouble, and shortest when there is
nothing to forgive.
