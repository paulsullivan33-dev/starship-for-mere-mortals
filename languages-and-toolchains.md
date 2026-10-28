# Languages and Toolchains

The most magical-feeling segments in the
default prompt are the language versions
that appear as you walk between folders:
`via 🐍 v3.12.3` in a Python project,
`via  v24.22.1` in a Node one. This
chapter removes the magic, which turns
out to be more useful than the magic was:
the modules run on **detection** — marker
files a project already has — and what
they print is the version of the tool
they find, which is not always the
version the project asked for.

## Detection: the folder declares itself

Each language module watches the current
folder (and its parents) for the files
of its trade. The Python module wakes
for, among others, `requirements.txt`,
`pyproject.toml`, `setup.py`, `Pipfile`
or a `.python-version` file. The Node
module wakes for `package.json` or a
`.nvmrc`. Rust wants a `Cargo.toml`, Go a
`go.mod`, and so on down the hundred.

The lab's two project folders demonstrate
the halves (transcript t05). The
web-widget folder holds `package.json`,
`.nvmrc` and a small `widget.js`, and its
prompt is:

```text
root in starship-scratch/lab/web-widget is 📦 v0.2.0 via  v24.22.1
⬢ [OCI] ❯
```

while trailnotes — `pyproject.toml`,
`.python-version`, `notes.py` — answers:

```text
root in trailnotes on  main is 📦 v0.1.0 via 🐍 v3.12.3
⬢ [OCI] ❯
```

No configuration told Starship any of
this. The folders declared themselves,
each in its own dialect, and two
different modules answered. Notice that
detection looks *upward* as well: stand
in a subfolder of a project and the
project's segments still appear, which
is why a deep `cd` inside a repository
keeps its context — and why the directory
segment, not the language segments, is
the one that changes as you descend.

## Which version is that, exactly?

Read the Python segment precisely: it
says the version of the **Python
interpreter Starship found** — on the lab
machine, 3.12.3. The `.python-version`
file in trailnotes says 3.12.3 too,
because the lab wrote it to match, but
do not let the agreement fool you into
thinking the file was read aloud. The
file is a *trigger*. The number comes
from running the interpreter. On a
machine with several Pythons and a
version manager doing silent switching,
the segment reports the interpreter that
would actually run — which is the more
useful fact, and occasionally a
rude surprise: a project pinned to an old
version, served by a new interpreter,
shows the new one, and the prompt has
just told you something your version
manager did not.

The same honesty applies to Node: the
`.nvmrc` triggers, `node --version`
answers. Detection is not installation,
and a version file is not a version. If
the toolchain is missing entirely, its
module shows nothing — a folder can
declare itself a Rust project on a
machine with no Rust, and the prompt
will simply have nothing to say about
Rust. Chapter 14 files this under
limits; here it is enough to know which
end of the telescope you are looking
through.

## The package segment, and its private rule

Both folders also show `is 📦 v…`: the
**package** module, which reads the
version from the project's own manifest —
`pyproject.toml` in trailnotes,
`package.json` in web-widget. It is one
module for many ecosystems, and it is
not a language module at all: it reports
the artefact's version, not the tool's.

It also has a rule the lab discovered by
accident and then verified on purpose
(transcript t05b). Add `"private": true`
to web-widget's `package.json` — the
standard marker for an npm package that
will never be published — and the package
segment **vanishes**, though the version
is still right there in the file. Remove
the line, and the segment returns. The
logic is defensible once seen: a private
package's version is bookkeeping, not a
release, and Starship declines to
announce it. But a reader who did not
know would file it as a bug, and it is
exactly the species of behaviour this
guide exists to surface: when a segment
disappears, suspect a *rule* before a
failure — and chapter 8's tools will
usually tell you which rule, since
`starship module package` run in that
folder prints the segment or, as here,
pointedly prints nothing.

## The long tail

Beyond Python and Node, the pattern
repeats more than fifty times: Rust,
Go, Java, Ruby, PHP, Elixir, Haskell,
Zig, and tools that are not languages at
all — Terraform, Docker contexts,
Kubernetes, the cloud CLIs. Each has its
own marker files, its own symbol, its
own configuration section, and most
readers will meet perhaps five. The way
to learn one is the way this chapter
learned two: make a folder that declares
itself, stand in it, and ask
`starship explain` who answered.
