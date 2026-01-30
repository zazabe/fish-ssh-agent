function __ssh_agent_start -d "start a new ssh agent"
  set -l agent_opts ""
  if test -n "$SSH_AGENT_OPTS"
    set agent_opts $SSH_AGENT_OPTS
  end

  ssh-agent -c $agent_opts | sed 's/^echo/#echo/' > $SSH_ENV
  chmod 600 $SSH_ENV
  source $SSH_ENV > /dev/null

  set -gx __fish_ssh_agent_started 1
end
