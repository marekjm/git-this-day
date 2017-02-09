# This day in Git repository

A script to extract a list of all recent commits from most recently active branches of a Git repository.


----


## Installation

Execute `make` to install all required scripts.
Add a `this-day` alias to your `~/.gitconfig`; it should look something like this after the edits:

```
[user]
    name = John Doe
    email = john.doe@example.com
[alias]
    this-day = "!f() { /usr/local/lib/git-this-day/what-have-i-done-today.sh $@; }; f"
```


#### Removal

Execute `make uninstall` to remove the script from your system.


----


## Dependencies

The script depends on:

- Git (obviously; at least in version 2.11.1)
- BASH (any version in 4.x line)
- xargs (from GNU findutils; version at least 4.6.0)

The script also depends on you having an email configured in `~/.gitconfig` as
it tracks your commits by email.


----


## Configuration

The following environment variables are used to configure the script.


### `GIT_THIS_DAY_DEPTH`

**Default**: 40

How many branches should be analysed?
Set this to a reasonable number.
A good default is the number of branches you usually update throughout the day plus 20% (to cover
especially busy days).

Special value `all` will make the script scan all branches (instead of only the N most recent ones) for
fresh commits.


### `GIT_THIS_DAY_USER_EMAIL`

**Default**: `git config --get user.email`

Email that will be used to track commits.


----

## License and copyright

Copyright (c) 2017 Marek Marecki

This code is published under GNU GPL v3 or any later version of this license.
