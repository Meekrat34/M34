# My alias collection
#
# General command line aliases
#
  alias ls='ls --color=auto'            ## ls with color
  alias ll='ls -alF'                    ## a(all) l(long listing) F(adds / to dir's)
  alias la='ls -A'                      ## A(all, but hidden)
  alias l='ls -CF'                      ## C(list by columns) F(adds / to dir's)
  alias grep='grep --color=auto'        ## search text for matching expression
  alias fgrep='fgrep --color=auto'      ## search for exact match expression    ??
  alias egrep='egrep --color=auto'      ## search for almost exact match        ??
#  
# Useful pacman aliases
#
  alias pacup='pacman -Syu'             ## Synchronizes the repository databases AND updates the system's packages
  alias pacinst='pacman -Sy'            ## Install and Sync the repo database
  alias pacrm='pacman -Rn'              ## Remove a package and prevent backup of config files
  alias paca='pacman -A'                ## For use with makepkg
  alias pacfind='pacman -Ss'            ## Search repository for something
  alias pacseek='pacman -Sl | grep'     ## List files owned by package ( with grep filtering )
#
# In case of a brain fart
#
  alias dir='ls --color=auto'           ## I sometimes work with DOS. And get that darn "dir" stuck in my head
