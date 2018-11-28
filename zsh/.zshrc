# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [ ! -e $ZSH ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    exec zsh
fi;
ZSH_THEME="powernex"

plugins=(git svn-fast-info colored-man screen rsync nyan copyfile copydir cp emoji-clock tmuxinator taskwarrior ssh-agent pass)
source $ZSH/oh-my-zsh.sh

alias et="emacsclient -t" # was "emacs -nw"
alias suet="SUDO_ASKPASS=\"/usr/lib/ssh/ssh-askpass\" SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit -A" #"sudo emacsclient -t"
alias emacs="emacsclient -c -a emacs"

alias lock="i3lock-fancy -p -t \"No hackeru pl0x\""
alias gl="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias fixD="find . -iname \"*.d\" -exec dfmt -i {} \;"

alias music1="rdmd --eval=\"import std.c.stdio; for(int i=0;;i++)putchar(((i*(i>>8|i>>9)&46&i>>8))^(i&i>>13|i>>6));\" | aplay"
alias music2="rdmd --eval=\"import std.c.stdio; for(int i=0;;i++)putchar(((i*(i>>17|i>>9)&46&i>>3))^(i&i>>10/*|i>>100*/));\" | aplay"
alias music3="rdmd --eval=\"import std.c.stdio; for(int i=0;;i++)putchar(((i*(i>>3|i>>11)&43&i>>8))^(i&i>>12|i>>4));\" | aplay"
alias music4="rdmd --eval=\"import std.c.stdio; for(int i=0;;i++)putchar(((i^(/*i>>64|*/i>>11)&70&i>>8))*(i&i>>12|i>>4));\" | aplay"

alias powernex="cd ~/OSDev/PowerNex; source env.sh"

alias mpv1080="mpv --ytdl-format='bestvideo[ext=webm][width<=1920][height<=1080]+bestaudio[ext=m4a]'"
alias mpv1440="mpv --ytdl-format='bestvideo[ext=webm][width<=2560][height<=1440]+bestaudio[ext=m4a]'"
alias yt="youtube-viewer --resolution=original --video-player=mpv"
alias cal="cal -m -w"

export PATH="$PATH:/home/wild/.local/bin/:/home/wild/bin"

export SUDO_ASKPASS="/usr/lib/ssh/ssh-askpass"
export ALTERNATE_EDITOR=""
if hash emacsclient 2>/dev/null; then
		export EDITOR="emacsclient -t"
		export VISUAL="emacsclient -c -a emacs"
else
		export EDITOR="vim"
		export VISUAL="vim"
fi
export LESS="-RSMsiI"
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

local hostname="$(hostname)"
if hash wmname  2>/dev/null && [ -n $SSH_TTY ]; then
		wmname LG3D 2>&1 > /dev/null
fi
