function foreground () {
	if [[ -n "$1" ]]; then
		PROMPT="${PROMPT}%F{$1}"
	else
		PROMPT="${PROMPT}%f"
	fi
}

function push () {
	PROMPT="${PROMPT}$1"
}

function setup () {
	PROMPT="%E"

	# Username
	foreground yellow
	push "%n"

	# Hostname
	if [[ -n "${SSH_CONNECTION}" ]]; then
		push "@%m"
	fi

	foreground

	# Current working directory
	push ":"
	foreground blue
	push "%~"
	foreground

	# Newline
	push $'\n'

	# Prompt
	foreground blue
	push "❯"
	foreground

	push " "

	push "%E"
}

setup
