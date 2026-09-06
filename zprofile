eval "$(/opt/homebrew/bin/brew shellenv zsh)"
eval "$(zoxide init zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

export PATH="/opt/homebrew/bin/brew:/opt/homebrew/opt/imagemagick-full/bin:/opt/homebrew/opt/ffmpeg-full/bin:/opt/homebrew/opt/rustup/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:/Users/noname/.local/bin:$PATH"

alias z2j='trans -4 -s zh -t ja'
alias z2e='trans -4 -s zh -t en'
alias e2z='trans -4 -s en -t zh'
alias e2j='trans -4 -s en -t ja'
alias j2z='trans -4 -s ja -t zh'
alias j2e='trans -4 -s ja -t en'
alias d='jj diff'
alias c='jj commit'
alias s='jj squash'
alias p='jj git push'
alias pm='jj b s main -r @- && jj git push -r @-'
alias pd='jj b s dev -r @- && jj git push -r @-'
alias j='jj'

function jjj() {
	target_dir="${1:-.}"
	for dir in "$target_dir"/*; do
		if [ -d "$dir" ] && [ -d "$dir/.jj" ]; then
			if [[ -n $(cd "$dir" && jj log -r '(@ ~ empty()) | (@- ~ remote_bookmarks())' --no-graph 2>/dev/null) ]]; then
				clean_name=$(basename "$dir")
				echo -e "\n\033[1;33m=== $clean_name ===\033[0m"
				(cd "$dir" && jj st)
			fi
		fi
	done
	echo ""
}

export PI_OFFLINE=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# pnpm
export PNPM_HOME="/Users/noname/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# fnm
eval "$(fnm env)"
