# less config
# 
# source code highlighting
# $ apt-get install source-highlight
# see http://linux-tips.org/article/78/syntax-highlighting-in-less
HILITE_SH=$(command -v src-hilite-lesspipe.sh)
if [ -n "$HILITE_SH" ] 
then
    # fedora
    export LESSOPEN="| $HILITE_SH %s"
else
    # debian/ubuntu
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
fi

# -rR option is tell less to interpret those color codes and escape sequences
# see http://unix.stackexchange.com/questions/19317/can-less-retain-colored-output
export LESS="-iMSx4 -rRFX"
