if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/environment
end

function __fish_ssh_agent_init --on-event fish_prompt
    if not set -q __fish_ssh_agent_initialized
        if not __ssh_agent_is_started
            __ssh_agent_start
        end
        set -g __fish_ssh_agent_initialized 1
        functions -e __fish_ssh_agent_init
    end
end

function __on_fish_exit --on-event fish_exit
    __ssh_agent_stop
end
