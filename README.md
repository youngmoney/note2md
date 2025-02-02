# note2md

A very simple Apple Notes export and covert to markdown tool.

It requires pandoc to be installed if converting to markdown.

## Usage

Go to a clean directory and run `note2md`. Two subdirectories will be created: `output` contains all of the standalone HTML of the notes (including attachments). `converted` contains the markdown conversion, with a `*.includes` directory of each note that has attachements.

## Opinionated

It is opinionated!

It names HTML notes `<account>.<folder>.<simple name>.html`. Where simple name is defined as no special characters, lower cased, and with underscores.

It names output markdown files as `apple.notes.<folder>.<simple name>.md` and puts attachments in `apple.notes.<folder>.<simple name>.includes`.
