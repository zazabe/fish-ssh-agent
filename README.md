# fish-ssh-agent

Utility functions to start your ssh agent when using fish shell.
You will only need to run `ssh-add` and type your password once,
after the running ssh_agent should do the work for you.

## Installation

### Using [fundle](https://github.com/danhper/fundle)

Add

```
fundle plugin 'danhper/fish-ssh-agent'
```

to your `config.fish`, reload your shell and run `fundle install`.

### Using [Fisher](https://github.com/jorgebucaran/fisher)

```
fisher install danhper/fish-ssh-agent
```

### Manually

Copy `functions` and `conf.d` to your `$__fish_config_dir` directory. That's all.

## Configuration

### Additional ssh-agent Parameters

You can pass additional parameters to `ssh-agent` by setting the `SSH_AGENT_OPTS` environment variable. For example, to set a custom timeout:

```fish
set -gx SSH_AGENT_OPTS "-t 3600"
```

This will be passed to `ssh-agent` when it starts. The plugin will automatically use these options when starting a new agent.

### Automatic Cleanup

The plugin automatically stops the ssh-agent when you exit fish, but only if the agent was started by this plugin. If you're using an SSH forwarded agent (e.g., when SSHing into a remote machine), it will not be stopped on exit.
