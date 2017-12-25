lc="$reset_color$FX[bold]$FG[006]"    # labels
nc="$reset_color$FX[bold]$FG[006]"    # user and hostname
ic="$reset_color$FX[bold]$FG[007]"    # info
fc="$reset_color$FX[bold]$FG[003]"                            # first color
mc="$reset_color$FX[bold]$FG[003]$BG[002]" # mixer color
sc="$reset_color$FG[002]"                   # second color
tc1="$reset_color$FX[bold]$FG[003]"                     # second color
tc2="$reset_color$FX[bold]$FG[002]"                     # second color

hostname="$(hostname)"
os='ArchLinux'
kernel="$(uname -sr)"
#git describe --long | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e "
uptime="$(uptime -p | sed 's/up //')"
packages="0xDEAD"
shell="$(basename $SHELL)"
WM="Hopefully, DWin"

# logo
logo='${fc}    ▟█▛         ${nc}${USER}${ic}@${nc}%m$reset_color
${fc}   ▟█▛      ${sc}▄   ${lc}OS:        ${ic}${os}$reset_color
${fc}  ▟█▛ ${tc1}Power${fc} ${sc}█▙  ${lc}KERNEL:    ${ic}${kernel}$reset_color
${fc} ▟████${mc}▛${sc}███████▙ ${lc}UPTIME:    ${ic}${uptime}$reset_color
${fc}   ▟█${mc}▛${sc}████████▛ ${lc}PACKAGES:  ${ic}${packages}$reset_color
${fc}  ▟█▀  ${tc2}Nex${fc}  ${sc}█▛  ${lc}SHELL:     ${ic}${shell}$reset_color
${fc} ▟▀         ${sc}▀   ${lc}WM:        ${ic}${WM}$reset_color'

# date time
g_date="\n$FG[038]Today is `date`"

# print
print -P $logo
print -P  $g_date

local g_status="%(?:%{$fg_bold[white]%}#%m➤ :%{$fg_bold[red]%}#%m➤ )"
# show staged changes in the repository
local g_changes="$FG[038][%~]%{$reset_color%}"
# Define prompts
#
PROMPT='${g_status}${g_changes} $(git_prompt_info)'

# git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
