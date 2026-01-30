function __ssh_agent_stop -d "stop ssh agent if it was started by this plugin"
	if test -n "$__fish_ssh_agent_started" -a -n "$SSH_AGENT_PID"
		if kill -0 $SSH_AGENT_PID 2>/dev/null
			kill $SSH_AGENT_PID
		end
		set -e __fish_ssh_agent_started
		set -e SSH_AGENT_PID
		set -e SSH_AUTH_SOCK
	end
end
