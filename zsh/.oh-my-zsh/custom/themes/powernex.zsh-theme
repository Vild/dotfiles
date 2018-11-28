local lc="$reset_color$FX[bold]$FG[006]"    # labels
local nc="$reset_color$FX[bold]$FG[006]"    # user and hostname
local ic="$reset_color$FX[bold]$FG[007]"    # info
local fc="$reset_color$FX[bold]$FG[011]"                            # first color
local mc="$reset_color$FX[bold]$FG[011]$BG[002]" # mixer color
local sc="$reset_color$FG[002]"                   # second color
local tc1="$reset_color$FX[bold]$FG[011]"                     # second color
local tc2="$reset_color$FX[bold]$FG[002]"                     # second color

local hostname="$(hostname)"
local os="$(grep 'PRETTY_NAME=' /etc/os-release | cut -d'"' -f2)"
local kernel="$(uname -sr)"
#git describe --long | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e "
local uptime="$(uptime -p | sed 's/up //')"
local packages="0xDEAD"
local shell="$(basename $SHELL)"
local WM="Hopefully, DWin"

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

# git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}✓"

ZSH_PROMPT_BASE_COLOR="%{$fg_bold[blue]%}"
ZSH_THEME_REPO_NAME_COLOR="%{$fg_bold[red]%}"

ZSH_THEME_SVN_PROMPT_PREFIX="%{$fg_bold[blue]%}svn:(%{$fg[red]%}"
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_SVN_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}✓"

PROMPT='${g_status}${g_changes} $(git_prompt_info)$(svn_prompt_info)%{$reset_color%}'