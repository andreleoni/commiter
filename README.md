# Commiter

* Clone the project to a fixed place that should not be changed.
* Run `./setup.sh`
* Reload terminal`
* Follow the usage instructions

# Usage

## Setting a global commit context

### Why use global context

Global context should be used when you are working on a specific project for a long time. Does it will avoid to using the specific context on commit command.

### Real usage

To set a global commit context, can be used the ./commit_setctx.sh script like the example:

`. commit_setctx.sh globalctx`

After the global context set, all commits will use this context except that commits that have the prefix `CTX=anothectx` on commit execution. If this extra param be set in the command, this will be the execution context.

## Using the commiter script

```
    Usage

    CTX=test ruby commiter.rb INTENTION FULL MESSAGE

    Permitted intentions
    -b --Bug fix (bugfix)
    -s --Start project
    -f --Finish project
    -d --Documentation or anyone comment on code only
    -c --Work in progress
    -r --Code review suggestion changes
    -p --Performance related changes
    -m --Maintenance changes: linter, config updates, etc.
    -rem --Code removing only
```

If CTX env not present, will bet the global ENV setted by the commit context script.

#### Example 1

```
# Set the next PR contexts based on Jira task
commit-setctx PR-123

# Start the PR execution
commit -s create the bone of project

# Wip the project
commit -c implement cron class
commit -c iojasoijdaios

# Final commit of dev changes
commit -f fix final specs

# When have some code review adjustments
commit -r code review adjustments

# When have some bugs or another changes to fix some problem that ocurrend in project
commit -b hahahha
```

#### Example 2

```
CTX=randomspec commit -m fix commit specs related with controller X
```

# Easy setup method

To easy setup this repository on `~/.bashrc`.

This is the command that will easily add the following code to this bashrc.

```
#### Alias to the commiter script https://github.com/andreleoni/commiter
alias commit-ctx=". /home/techuser/Documents/commiter/commit_setctx.sh"
alias commit="ruby /home/techuser/Documents/commiter/commiter.rb"
####
```

# Greetings!

Have fun!
