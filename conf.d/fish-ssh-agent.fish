if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/environment
end

if not __ssh_agent_is_started
    __ssh_agent_start
end

function __on_fish_exit --on-event fish_exit
    __ssh_agent_stop
end
