function __ssh_agent_start -d "start a new ssh agent"
  if test -n "$SSH_AGENT_OPTS"
    set -l opts
    if test (count $SSH_AGENT_OPTS) -eq 1
      set opts (string split " " -- $SSH_AGENT_OPTS)
    else
      set opts $SSH_AGENT_OPTS
    end
    ssh-agent -c $opts | sed 's/^echo/#echo/' > $SSH_ENV
  else
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
  end
  chmod 600 $SSH_ENV
  source $SSH_ENV > /dev/null

  set -gx __fish_ssh_agent_started 1
end
