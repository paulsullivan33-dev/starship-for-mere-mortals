"""trailnotes - keep short notes about walks, in a plain text file."""

import sys

NOTES = "notes.txt"


def main():
    if len(sys.argv) > 1:
        with open(NOTES, "a", encoding="utf-8") as fh:
            fh.write(" ".join(sys.argv[1:]) + "\n")
        print("noted.")
    else:
        try:
            print(open(NOTES, encoding="utf-8").read(), end="")
        except FileNotFoundError:
            print("(no notes yet)")


if __name__ == "__main__":
    main()

# a line added while walking

# a line added while walking
