
#----------------------------------------------------------------------#
# FILE:    ansi.sh                                                     #
# AUTHOR:  Douglas Roberts -- droberts                                 #
# CREATED: Thu Feb 25 09:31:08 EST 2010                                #
# PURPOSE: test for ansi control characters.                           #
#                                                                      #
#----------------------------------------------------------------------#


# effects
num=0
while [[ $num -le 16 ]]; do
    echo "[${num}mFROGS[10m--${num}[m"
    (( num += 1 ))
done

# colors
num=0
while [[ $num -lt 8 ]]; do
    echo -n "[4${num}m $num [m"
    echo -n "[3${num}m $num [m"
    echo
    (( num += 1 ))
done

#----------------------------------------------------------------------#
# interesting to me, is that they simply counted in binary up the      #
# RGB scale to get the initial colors:                                 #
#                                                                      #
# BLUE GREEN RED             binary                                    #
#    0    0    0   black        0                                      #
#    0    0    1   red          1                                      #
#    0    1    0   green        2                                      #
#    0    1    1   yellow       3                                      #
#    1    0    0   blue         4                                      #
#    1    0    1   magenta      5                                      #
#    1    1    0   cyan         6                                      #
#    1    1    1   white        7                                      #
#                                                                      #
# this makes it easy now to remember which number for which color. :)  #
#                                                                      #
#----------------------------------------------------------------------#
