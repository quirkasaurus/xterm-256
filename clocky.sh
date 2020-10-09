#!/bin/bash
#----------------------------------------------------------------------#
# FILE:    clocky.sh                                                   #
# AUTHOR:  Douglas Roberts -- droberts                                 #
# CREATED: Fri Sep 11 22:59:53 EDT 2020                                #
# PURPOSE: replace my digital clock with a bash one. :)                #
# TODO:    • add all color pallettes                                   #
#          • center the text, keep the y axis as is.                   #
# NOTES:   the weird date command adjusts for the 3 seconds or so      #
#          it takes to actually print the time, so that,               #
#          when the time is done printing, it is closer to accurate.   #
# NOTES:   height of all characters is 14.                             #
#----------------------------------------------------------------------#

. more_funx $0
. yaps1


function _yap_next
{
(( _idx += 1 ))
if [[ $_idx -ge $pound_pastels ]]; then
    _idx=0
fi
}


function clocky_printc
{
_yap_next

# echo draws things much faster
# i prefer slow

# echo -n "[38;5;${acidx[$_idx]}m${@}[m"
printc -n "${acidx[$_idx]}" "${@}"
}


function render_clock_1
{
init
init x -4
init y 3

if [[ $DEMO -eq 1 ]]; then
    numbers=( 1 2 3 4 5 : 6 7 8 9 0 )
else
    numbers=( $(
    date -v+3S +%I:%M:%S |
    sed -e 's/./& /g'
    ) )
fi

for number in ${numbers[*]} ; do
    init y 3
    incr
    incr x 7

    # if zero, do not print 1st number.
    if [[ $num -eq 1 ]]; then
        if [[ $number == "0" ]]; then
            continue
        fi
    fi

    case $number in
        (1)
            for line in \
                "    #" \
                "    #" \
                "    #" \
                "    #" \
                "    #" \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            ;;

        (2)
            for line in \
                "#####" \
                "    #" \
                "#####" \
                "#    " \
                "#####" \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            ;;

        (3)
            for line in \
                "#####" \
                "    #" \
                "#####" \
                "    #" \
                "#####" \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            ;;

        (4)
            for line in \
                "  ###" \
                " #  #" \
                "#   #" \
                "#####" \
                "    #" \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            ;;

        (5)
            for line in \
                "#####" \
                "#    " \
                "#####" \
                "    #" \
                "#####" \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            ;;

        (6)
            for line in \
                "#####" \
                "#    " \
                "#####" \
                "#   #" \
                "#####" \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            ;;

        (7)
            for line in \
                "#####" \
                "   # " \
                "  #  " \
                " #   " \
                "#    " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            ;;

        (8)
            for line in \
                "#####" \
                "#   #" \
                "#####" \
                "#   #" \
                "#####" \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            ;;

        (9)
            for line in \
                "#####" \
                "#   #" \
                "#####" \
                "    #" \
                "    #" \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            ;;

        (0)
            for line in \
                "#####" \
                "#   #" \
                "#   #" \
                "#   #" \
                "#####" \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            ;;

        (:)
            for line in \
                "   " \
                " # " \
                "   " \
                " # " \
                "   " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            decr x 2
            ;;
    esac
done
tput cup 0 0
}


function render_clock_2
{
init
init x
init y 3

if [[ $DEMO -eq 1 ]]; then
    numbers=( 1 2 3 4 5 : 6 7 8 9 0 )
else
    numbers=( $(
    date -v+3S +%I:%M:%S |
    sed -e 's/./& /g'
    ) )
fi

for number in ${numbers[*]} ; do
    init y 3
    incr

    # if zero, do not print 1st number.
    if [[ $num -eq 1 ]]; then
        if [[ $number -eq 0 ]]; then
            continue
        fi
    fi

    case $number in
        (0)
            for line in \
                "" \
                "           ..•••.           " \
                "        .•oO@@@@Oo•..       " \
                "     .•o@@Oo•°  °.oo•.      " \
                "   .•o@@@Oo•°     °.oo•.    " \
                "  •o@@@@Oo••       °•oo•.   " \
                " •o@@@@@Oo••        ••oo•.  " \
                " •o@@@@@Oo••        .•oo••  " \
                " •o@@@@@@o••        .•oOo•° " \
                " °o@@@@@@Oo•.      .•o@Oo•° " \
                "  °o@@@@@@Oo•.    .•o@Oo•°  " \
                "   °o@@@@@@Oo•..•oO@Oo•°    " \
                "    °o@@@@@@@@@@@@@Oo•°     " \
                "       °o@@@@@@@Oo•°        " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 28
            ;;

        (1)
            for line in \
                "      .•o@o•.  " \
                "     .•o@@o•°  " \
                "    .•o@@@o:°  " \
                "   .•oO@@Oo:°  " \
                "     °•o@Oo•°  " \
                "     °•o@Oo•°  " \
                "     °•o@Oo•°  " \
                "     °•o@Oo•°  " \
                "     °•@@o•°   " \
                "    °•o@Oo•°   " \
                "    °•o@Oo•°   " \
                "   °•o@@Oo•°   " \
                "  ••oO@@Ooo•°  " \
                " .••oO@@Oooo•° " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 15
            ;;

        (2)
            for line in \
                "      °•oOO@@@@@o•°       " \
                "    °•oOOoooO@@@@@@o•°    " \
                "   °oO•.      .•oO@@@o•°  " \
                "  •oO•°        .•oO@@Oo•° " \
                "   o°           •oOO@@o•• " \
                "               .•oO@@o••  " \
                "           ...•oO@@Oo•.   " \
                "      °•ooOO@Ooo••°°°     " \
                "     °•oO@o•°             " \
                "   °•oO@o•°               " \
                "  °•oO@o•°                " \
                "  •ooOOoo.          .o.   " \
                " °•oooOOO@oooooooooooo•   " \
                "  °•o@@@@@OOOOO@@@@@O@°   " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 26
            ;;

        (3)
            for line in \
                "       .•••.            " \
                "    ••oOO@@@o•          " \
                "  •oOOO•••oO@@@o•       " \
                " °o•°     •.oO@@@o•     " \
                "           .•oO@@@o•    " \
                "           .•oO@@o•°    " \
                "      ...•oO@@@o••      " \
                "    ••ooOOOOO@@@@@o•    " \
                "     °°°••oOO@@@@@Ooo•  " \
                "           •oOO@@@@@Oo• " \
                "            .•oO@@@@Oo• " \
                " °ooo•.....•oO@@@@@Oo•° " \
                "  °•oOOooooO@@@@@@Oo•°  " \
                "    °•oOOO@@@@@@o•°     " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 24
            ;;

        (4)
            for line in \
                "               ...      " \
                "            .•o@Oo•.    " \
                "          .•oO@@Oo•     " \
                "         .•oO@@•Oo•     " \
                "       .•oO@@Oo•@o•     " \
                "     .•oO@@Oo:° @O:     " \
                "   .•oO@@Oo:°   @O:     " \
                "  •oO@@Oo:•.....oOo•..  " \
                " °•ooOOO@@@@@OOOOOoooo. " \
                "              °oOOo°    " \
                "              •o@Oo•    " \
                "              •o@Oo•    " \
                "            ••oO@@Oo•.  " \
                "          .••oO@@@Oo••. " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 24
            ;;

        (5)
            for line in \
                "    .•ooooooooooooooo•.    " \
                "   °•oooOOO@@@@@@@OOOo•    " \
                "   °•oO@o•°          °°    " \
                "   °•oO@o•°                " \
                "    °•ooOO@@OOoo.          " \
                "      °•oooOOO@@@@o•.      " \
                "             °•oO@@o•.     " \
                "     .•.      .•oOO@@@o••  " \
                "   .•oo•.      .•oOO@@@o•• " \
                "  •oO••°       •oOO@@@@o•• " \
                " °oO•°        .•oO@@@@o•°  " \
                "  °oO•.      .•oO@@@@o•°   " \
                "   °•oOOooooO@@@@@@o•°     " \
                "     °•oOOO@@@@@o•°        " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 27
            ;;

        (6)
            for line in \
                "           ..•••..        " \
                "        .•oO@@@@Ooo•.     " \
                "     .•o@Oo•°             " \
                "   .•o@@Oo•°              " \
                "  .•o@@Oo•°               " \
                " ••o@@@Oo•                " \
                " ••o@@@@OOo•.•ooOOOoo•.   " \
                " ••o@@@@@OOooo•°°°°•ooo•  " \
                " °•o@@@@@Oo•.       °°oo• " \
                " °•o@@@@@Oo•.       °°oo• " \
                "  °•o@@@@@Oo•.      °•oo° " \
                "   °•o@@@@@Oo•.    .•oo°  " \
                "    °•o@@@@@@OooooOOo•°   " \
                "       °•o@@@@@@OOOo•°    " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 26
            ;;

        (7)
            for line in \
                " .@OoooooOOO@@@OOOoo•• " \
                " .ooOOO@@@@@@@OOOooo•° " \
                " °°        °•o@@Oo•°   " \
                "          °•o@@Oo•°    " \
                "         °•o@@Oo•°     " \
                "        °•o@Oo•°       " \
                "        °•o@Oo•°       " \
                "       °•o@Oo•°        " \
                "       °•o@Oo•°        " \
                "       °•o@Oo•°        " \
                "       •o@@Oo•         " \
                "       •o@@Oo•.        " \
                "      .•oO@Oo•.        " \
                "     .•oO@@@Oo•.       " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 23
            ;;

        (8)
            for line in \
                "         .•••..        " \
                "       •o@@@OOoo•.     " \
                "     •o@@Ooo•••oOo•.   " \
                "    •o@@Oo.•   °•oo•.  " \
                "   •o@@Oo•.      °oo•  " \
                "   °•o@@Oo•.    .•oo°  " \
                "     ••o@@@Oo•..•oo•°  " \
                "   •o@@@OOOooooOOo•.   " \
                " •ooO@@@Oo••°°°°•oo•   " \
                " •oO@@@OOo•     °•oo•  " \
                " •oO@@@Oo•.      .•oo° " \
                " °•oO@@@@Oo•.....•ooo° " \
                "  °•oO@@@@@OooooOOo•°  " \
                "     °•o@@@@@OOOo•°    " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 23
            ;;

        (9)
            for line in \
                "        .•••..           " \
                "    .•°oOOO@@@@o•.       " \
                "   .•oOOooooO@@@@@o•.    " \
                "  .ooo•°   °••oO@@@o•.   " \
                " .oo••      .•oO@@@@o•.  " \
                " •ooo•.    ..•ooO@@@Oo•. " \
                "  •ooooooooooooOO@@@Oo•• " \
                "   °•ooOOOoo• •oOO@@Oo•• " \
                "      °°°°°    •oO@@o••  " \
                "               .•oO@o•°  " \
                "              .•oO@o•°   " \
                "   .         .•oO@o•°    " \
                "   °oooo....•ooO@o•°     " \
                "    °ooooO@@@Oo•°        " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 24
            ;;

        (:)
            for line in \
                "x" \
                "x" \
                "   .•ooo•.  " \
                "  .•oO@Oo•° " \
                "  °•o@@@o•° " \
                "   °•o@o•°  " \
                "            " \
                "  .•o@o•.   " \
                " •oO@@@Oo•  " \
                " •oO@@@Oo°  " \
                " °•o@Oo•°   " \
                "x" \
                "x" \
                "x" \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 12
            ;;
    esac
done
tput cup 0 0
}


function render_clock_3
{
init
local _x_init=3
init x $_x_init

local _y_init=3
init y $_y_init

if [[ $DEMO -eq 1 ]]; then
    numbers=(
        $(
        for number in B A M P 1 2 3 4 5 : 6 7 8 9 0 : ; do
            echo $RANDOM $number
        done |
        fields 2
        )
    )
else
    numbers=(
        $(
        date -v+3S +%I:%M:%S:%p |
        sed -e 's/./& /g'
        ) )
fi

for number in ${numbers[*]} ; do
    init y $_y_init
    incr

    # if zero, do not print 1st number.
    if [[ $num == 1 ]]; then
        if [[ $number == 0 ]]; then
            continue
        fi
    fi

    case $number in
        (A|a)
            for line in \
                "              ...           " \
                "            .oO@Oo•         " \
                "          .•oO@@@Oo•.       " \
                "        .•oO@@@@OO@Oo•.     " \
                "      .•oO@Oo.°  °.oOOo.    " \
                "     .•oO@Oo•     .•oOo•.   " \
                "   .•oO@@Ooo••....•oOOOo•.  " \
                "  .•oOO@@@OOOoooooO@@@OOo•  " \
                " .•oOO@@@@@@@@@@@@@@@@@Oo•. " \
                " .•oOO@@@Oo•°°°°••oO@@@Oo•. " \
                " .•oOO@@@Oo      °•oO@@Oo•. " \
                "  .•oOO@@Oo       •oO@@oo•. " \
                "  .•oOO@@Oo•     .°oO@Oo•.  " \
                "   .•oO@@Oo•.    •oO@Oo•°   " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 28
            ;;

        (B|b)
            for line in \
                "          ....            " \
                "       .oOO@@OOo•         " \
                "     .•oOOO@@@@OOo•.      " \
                "   .•oOO@OO•°°°•oOOo•.    " \
                "  .•oO@Oo.°     •oOOo•.   " \
                "  .•oO@Oo•      •oO@Oo•   " \
                " .•ooO@Ooo••...°oO@Oo•°   " \
                " .•oOO@@@OOOooooO@@Oo•    " \
                " .•oOO@@@@@@@@@@@@Oo•.    " \
                " .•oO@@OO•°°°°•oO@@@Oo•.  " \
                " .•oO@@O•      °•oO@@Oo•. " \
                "  .•OO@O•       •oO@@oo•. " \
                "  .•oO@OOo....•oOO@@Oo•.  " \
                "  .•oO@@@OOoooooO@OOo•    " \
                " ..•OO@@@@@@@@@@Oo•.      " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 26
            ;;

        (M|m)
            for line in \
                "              .                         " \
                "            .oOo•           .o•         " \
                "          .•oO@Oo•.       .•OOo•.       " \
                "        .•oO@@OO@Oo•.   .•oO@O@Oo•.     " \
                "      .•oO@Oo.°°.oOOo• •oO@O•°•oOOo.    " \
                "     .•oO@Oo•   •oO@O°OO@o•    •oO@o.   " \
                "   .•oO@@Ooo•     •OO@@@Oo•     •oO@o.  " \
                "  .•oOO@@@Oo       oOO@Oo•      °oO@Oo. " \
                " .•oOO@@@@Oo       °•O@O•°      •oO@@O. " \
                " .•oOO@@@Ooo         °o°        •oOO@@. " \
                " .•oOO@@@Ooo•         °         oO@@Oo. " \
                "  .•oOO@@Ooo•                  •oO@@Oo• " \
                "  .•oOO@@OOoo•                •oO@@Oo•  " \
                "   .•oO@@OOoo•.             .•oO@@Oo•.  " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 40
            ;;

        (P|p)
            for line in \
                "          .....          " \
                "       .oO@O@@OOo•.      " \
                "     .•oOO@@@@@OOOo•.    " \
                "    .•oOO@@@••O@@OOO•.   " \
                "   .•oO@Oo.°  °.oOO@Oo.  " \
                "  .•oO@Oo•     .•oO@Oo•. " \
                "  .•oO@@Oo••...•oOO@OOo• " \
                " .•oOO@@@OOOoooooO@@@OO• " \
                " .•oOO@@@@@@@@@@@@@@OO°  " \
                " .•oOO@@@Oo•°°°°°°       " \
                " .•oOO@@@Oo              " \
                "  .•oOO@@Oo              " \
                "  .•oOO@@Oo•             " \
                "   .•oO@@Oo•.            " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 28
            ;;

        (0)
            for line in \
                "                            " \
                "           ..•••.           " \
                "        .•oO@@@@Oo•.        " \
                "     .•o@@OOo•° °•Oo°•      " \
                "   .•o@@@Oo•°     °•Oo°.    " \
                "  •o@@@@Oo•°       °•Oo•.   " \
                " •o@@@@@Oo•         ••Oo•.  " \
                " •o@@@@@Oo•         .•oO••  " \
                " •o@@@@@@Oo•        .•oOo•° " \
                " °o@@@@@@@Oo••....•°oo@Oo•° " \
                "  °o@@@@@@@OOOOOOOOOO@Oo•°  " \
                "   °o@@@@@@@@OOOO@@@Oo•°    " \
                "    °o@@@@@@@@@@@@@Oo•°     " \
                "       °o@@@@@@@Oo•°        " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 28
            ;;

        (1)
            for line in \
                "       .°O.        " \
                "      .•O@•        " \
                "    .•oO@@•        " \
                "  .•ooO@@@•        " \
                "     °•o@o.        " \
                "     °•o@o         " \
                "     °•o@•         " \
                "     °•o@•         " \
                "     °•@@•         " \
                "     °•@o•         " \
                "     °•o@•         " \
                "     °•o@o•        " \
                "    .•o@@Oo•.      " \
                " .•ooO@@Ooooo•..   " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 15
            ;;

        (2)
            for line in \
                "      °•oOO@@@@@o•°       " \
                "    °•oOOoooO@@@@@@o•°    " \
                "   °oO•.      .•oO@@@o•°  " \
                "  •oO•°        .•oO@@Oo•° " \
                "   o°           •oOO@@o•• " \
                "               .•oO@@o••  " \
                "           ...•oO@@Oo•.   " \
                "      .•ooOO@Ooo••°°°     " \
                "     .•oO@o•°             " \
                "   .•oO@o•°               " \
                "  .•oO@o•°                " \
                " .•ooOOoo.          .o.   " \
                " °•oooOOO@oooooooooooo•   " \
                "  °•o@@@@@OOOOO@@@@@O@°   " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 26
            ;;

        (3)
            for line in \
                "       .•••.            " \
                "    ••oOO@@@o•          " \
                "  •oOO•°°°•O@@@o•       " \
                " °o•°      •oO@@@o•     " \
                "           .•oO@@@o•    " \
                "           .•oO@@o•°    " \
                "      ...•oO@@@o••      " \
                "    ••ooOOOOO@@@@@o•    " \
                "     °°°••oOO@@@@@Ooo•  " \
                "           •oOO@@@@@Oo• " \
                "            •oOO@@@@Oo• " \
                " °ooo•.....•oOO@@@@Oo•° " \
                "  °•oOOooooOO@@@@@Oo•°  " \
                "    °•oOOO@@@@@@o•°     " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 24
            ;;

        (4)
            for line in \
                "               .•o°     " \
                "             .•o@o•     " \
                "            .•o@@o•     " \
                "           .•o@O@o•     " \
                "         .•oO@o•@o•     " \
                "       .•oO@o:° @O      " \
                "     .•oOO@o:°  @O      " \
                "   .•ooO@o:•....oOo•..• " \
                " °•ooOOO@@@@@OOOOOoooo. " \
                "              °oOOo°    " \
                "              •o@Oo•    " \
                "              •o@Oo•    " \
                "            ••oO@@Oo•.  " \
                "         .••ooO@@@Ooo•. " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 24
            ;;

        (5)
            for line in \
                "  °•@@OOoooooooooooO@•°  " \
                "  °•oooOOO@@@@@@@OOOo•   " \
                "   °•o@•°          °••   " \
                "   •oO@•°            °   " \
                "   °•ooOO@@OOoo.         " \
                "      °•oooOOO@@@o•.     " \
                "             °•oO@@o•.   " \
                "    .o.        •oO@@o••  " \
                "  .•Oo•.        •oO@@@o• " \
                " •oO••°         •oO@@@o• " \
                " oO•°         .•oO@@@o•° " \
                " °oO•.      .•oO@@@@o•°  " \
                "  °•OOooooO@@@@@@Oo•°    " \
                "    °•oOOO@@@OO•°        " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 26
            ;;

        (6)
            for line in \
                "           ..•••..        " \
                "        .•oO@@@@Ooo.      " \
                "     .•o@Oo•°     °••     " \
                "    .•@Oo•°         °     " \
                "   .•@Oo•°                " \
                "  .•@Oo•.                 " \
                " .•o@OOo. .ooO@@@Ooo•.    " \
                " .•o@@Oo•oO@@@@@@@@@@o•   " \
                " •oO@@@@Oo•°    °oO@@Oo•  " \
                " °o@@@@Oo•      °•oO@@oo• " \
                " °oo@@Ooo•.    ••oO@@@Oo• " \
                "  °•oO@@OOOoooOOO@@@@Oo•  " \
                "   °•oO@@@@@@@@@@@@Ooo•°  " \
                "      °•oO@@@@@OOoo•°     " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 26
            ;;

        (7)
            for line in \
                "•@@OOooooooooooOO@@@• " \
                ".@@OOO@@@@@@@OOOooo•° " \
                "°°        °•o@@Oo•°   " \
                "         °•o@Oo•°     " \
                "        °•o@o•°       " \
                "       °•o@o•°        " \
                "       °•o@o•         " \
                "      °•o@oo          " \
                "      °•o@oo          " \
                "      °•o@oo          " \
                "      •o@@oo•         " \
                "      •o@@Oo•.        " \
                "     .•o@@Oo•.        " \
                "   .•ooO@@@Ooo•.      " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 23
            ;;

                # " °•oO@@@@Oo•.....•ooo° " \ # line  12
        (8)
            for line in \
                "         .••••.        " \
                "       •o@@@OOoo•.     " \
                "     •o@@Ooo•••oOo•.   " \
                "    •o@@Oo•°   °•Oo•.  " \
                "   •o@@Oo•.      •Oo•  " \
                "   °•o@@Oo•.   .•oOo°  " \
                "     ••o@@@oooooOo•°   " \
                "   •o@@@@@@@@@@@Oo•.   " \
                " •ooO@@@Oo••°°°°•OOo•. " \
                " •oO@@OOo•       •OOo• " \
                " °oO@@@@Oo.      .OOo° " \
                " ••oO@@@@@OOooooOOOo•  " \
                "  °•oO@@@@@@@@@@OOo•°  " \
                "     °•o@@@@@OOOo•°    " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 23
            ;;

        (9)
            for line in \
                "         .••••.          " \
                "     ..oOOO@@@Oo•.       " \
                "   .•oOOOOOOO@@@@Oo.     " \
                "  .oOo•°    °•oO@@Oo.    " \
                " .oOo••       .•oO@@Oo.  " \
                " •oOo°•......•°oO@@@@Oo• " \
                " •oOOO@@@@OOOOOOO@@@@Oo• " \
                "  °•oOOO@@@@OOOO@@@@@OO• " \
                "             °•oOO@@@OO• " \
                "  .•.         •oO@@@OOo° " \
                " •oOO°.      .•oO@@@Oo°  " \
                " °•oO@o°•...•oO@@@@Oo°   " \
                "   °•oOO@@@@@@@@OOo•°    " \
                "      °•OO@@@@OO•°       " \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 24
            ;;

        (:)
            for line in \
                "" \
                "" \
                "   .•ooo•.  " \
                "  .•oO@Oo•° " \
                "  °•o@@@o•° " \
                "   °•o@o•°  " \
                "            " \
                "  .•o@o•.   " \
                " •oO@@@Oo•  " \
                " •oO@@@Oo°  " \
                " °•o@Oo•°   " \
                "" \
                "" \
                "" \
                ; do
                tput cup $y $x
                clocky_printc "$line"
                incr y
            done
            incr x 12
            ;;
    esac
    if [[ $x -gt $COLUMNS ]]; then
        x=3
        (( _y_init += 16 ))
    fi
done
}


function render_character
{
local x_check
(( x_check = x + width ))

(( _cols = COLUMNS + 0 ))
(( _lins = LINES + 0 ))

if [[ $x_check -gt $_cols ]]; then
    x=3
    incr _close_to_the_edge
#     tput cup 0 0
#     echo -n _close_to_the_edge=$_close_to_the_edge \
#         _xy_init=$_xy_init \
#         x=$x \
#         x_check=$x_check \
#         y=$y
fi
(( y = ( _close_to_the_edge * 16 ) + _xy_init ))
for line in "${lines[@]}" ; do
    # tput cup 0 0 ; echo -n y=$y x=$x
    tput cup $y $x
    clocky_printc "$line"
    incr y
done
incr x $width
}


### CURRENT MAIN
function render_clock_4
{
init
init _close_to_the_edge
init _xy_init 3
init x $_xy_init
init y $_xy_init

if [[ $DEMO -eq 1 ]]; then
    numbers=( A B M P " " 1 2 3 4 5 : 6 7 8 9 0 )
else
    numbers=( $(
    date -v+3S '+%I:%M:%S:%p' |
    sed -e 's/^0//' \
        -e 's/./& /g'
    ) )
fi

for number in ${numbers[*]} ; do
    # randomize starting color_idx
    # to avoid repeated color patters per letter
#----------------------------------------------------------------------#
#     echo $_idx $pound_pastels                                        #
#----------------------------------------------------------------------#
    # (( _idx = RANDOM % pound_pastels ))
#----------------------------------------------------------------------#
#     echo $_idx $pound_pastels                                        #
#----------------------------------------------------------------------#
#----------------------------------------------------------------------#
#     print_sep                                                        #
#----------------------------------------------------------------------#
    incr

    # if first character . . .
    if [[ $num -eq 1 ]]; then

        # if it is a zero . . .
        if [[ $number -eq 0 ]]; then

            # skip it.
            continue
        fi
    fi

    case $number in
        (" ") lines=(
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                )
            width=6
            ;;

        (A|a)
            lines=(
                "              ...           " \
                "            .oO@Oo•         " \
                "          .•oO@@@Oo•.       " \
                "        .•oO@@@@OO@Oo•.     " \
                "      .•oO@Oo.°  °.oOOo.    " \
                "     .•oO@Oo•     .•oOo•.   " \
                "   .•oO@@Ooo••....•oOOOo•.  " \
                "  .•oOO@@@OOOoooooO@@@OOo•  " \
                " .•oOO@@@@@@@@@@@@@@@@@Oo•. " \
                " .•oOO@@@Oo•°°°°••oO@@@Oo•. " \
                " .•oOO@@@Oo      °•oO@@Oo•. " \
                "  .•oOO@@Oo       •oO@@oo•. " \
                "  .•oOO@@Oo•     .°oO@Oo•.  " \
                "   .•oO@@Oo•.    •oO@Oo•°   " \
                )
            width=28
            ;;

        (B|b)
            lines=(
                "          ....            " \
                "       .oOO@@OOo•         " \
                "     .•oOOO@@@@OOo•.      " \
                "   .•oOO@OO•°°°•oOOo•.    " \
                "  .•oO@Oo.°     •oOOo•.   " \
                "  .•oO@Oo•      •oO@Oo•   " \
                " .•ooO@Oo•.....•oO@Oo•°   " \
                " .•oOO@@@OOOOOO@@@Oo•     " \
                " .•oO@@OO•°°°°•oO@@@Oo•.  " \
                " .•oO@@O•       oO@@Oo•.  " \
                "  .•OO@O•       oO@@oo•.  " \
                "  .•oO@Oo.....•OO@@Oo•.   " \
                "  .•oO@@@OOoooooO@OOo•    " \
                " ..•OO@@@@@@@@@@Oo•.      " \
                )
            width=26
            ;;

        (M|m)
            lines=(
                "              .                         " \
                "            .oOo•           .o•         " \
                "          .•oO@Oo•.       .•OOo•.       " \
                "        .•oO@@OO@Oo•.   .•oO@O@Oo•.     " \
                "      .•oO@Oo.°°.oOOo• •oO@O•°•oOOo.    " \
                "     .•oO@Oo•   •oO@O°OO@o•    •oO@o.   " \
                "   .•oO@@Ooo•     •OO@@@Oo•     •oO@o.  " \
                "  .•oOO@@@Oo       oOO@Oo•      °oO@Oo. " \
                " .•oOO@@@@Oo       °•O@O•°      •oO@@O. " \
                " .•oOO@@@Ooo         °o°        •oOO@@. " \
                " .•oOO@@@Ooo•         °         oO@@Oo. " \
                "  .•oOO@@Ooo•                  •oO@@Oo• " \
                "  .•oOO@@OOoo•                •oO@@Oo•  " \
                "   .•oO@@OOoo•.             .•oO@@Oo•.  " \
                )
            width=40
            ;;

        (P|p)
            lines=(
                "          .....          " \
                "       .oO@O@@OOo•.      " \
                "     .•oOO@@@@@OOOo•.    " \
                "    .•oOO@@@••O@@OOO•.   " \
                "   .•oO@Oo.°  °.oOO@Oo.  " \
                "  .•oO@Oo•     .•oO@Oo•. " \
                "  .•oO@@Oo••...•oOO@OOo• " \
                " .•oOO@@@OOOoooooO@@@OO• " \
                " .•oOO@@@@@@@@@@@@@@OO°  " \
                " .•oOO@@@Oo•°°°°°°       " \
                " .•oOO@@@Oo              " \
                "  .•oOO@@Oo              " \
                "  .•oOO@@Oo•             " \
                "   .•oO@@Oo•.            " \
                )
            width=28
            ;;

        (0)
            lines=(
                "" \
                "           ..•••.           " \
                "        .•oO@@@@Oo•..       " \
                "     .•o@@Oo••° °•oo•.      " \
                "   .•o@@@Oo•°     °•oo•.    " \
                "  •o@@@@Oo•°       °•oo•.   " \
                " •o@@@@@Oo•         ••oo•.  " \
                " •o@@@@@Oo•         .•oo••  " \
                " •o@@@@@@o••.      ..•oOo•° " \
                " °o@@@@@@Ooo••....••oo@Oo•° " \
                "  °o@@@@@@Ooooooooooo@Oo•°  " \
                "   °o@@@@@@@@OOOO@@@Oo•°    " \
                "    °o@@@@@@@@@@@@@Oo•°     " \
                "       °o@@@@@@@Oo•°        " \
                )
            width=28
            ;;

        (1)
            lines=(
                "       .°O.        " \
                "      .•O@•        " \
                "    .•oO@@•        " \
                "  .•ooO@@@•        " \
                "     °•o@o.        " \
                "     °•o@o         " \
                "     °•o@•         " \
                "     °•o@•         " \
                "     °•@@•         " \
                "     °•@o•         " \
                "     °•o@•         " \
                "     °•o@o•        " \
                "    .•o@@Oo•.      " \
                " .•ooO@@Ooooo•..   " \
                )
            width=20
            ;;

        (2)
            lines=(
                "      °•oOO@@@@@o•°       " \
                "    °•oOOoooO@@@@@@o•°    " \
                "   °oO•.      .•oO@@@o•°  " \
                "  •oO•°        .•oO@@Oo•° " \
                "   o°           •oOO@@o•• " \
                "               .•oO@@o••  " \
                "           ...•oO@@Oo•.   " \
                "      .•ooOO@Ooo••°°°     " \
                "     .•oO@o•°             " \
                "   .•oO@o•°               " \
                "  .•oO@o•°                " \
                " .•ooOOoo.          .o.   " \
                " °•oooOOO@oooooooooooo•   " \
                "  °•o@@@@@OOOOO@@@@@O@°   " \
                )
            width=26
            ;;

        (3)
            lines=(
                "       .•••.            " \
                "    ••oOO@@@o•          " \
                "  •oOOO•••oO@@@o•       " \
                " °o•°     °•oO@@@o•     " \
                "           .•oO@@@o•    " \
                "           .•oO@@o•°    " \
                "      ...•oO@@@o••      " \
                "    ••ooOOOOO@@@@@o•    " \
                "     °°°••oOO@@@@@Ooo•  " \
                "           •oOO@@@@@Oo• " \
                "            .•oO@@@@Oo• " \
                " °ooo•.....•oO@@@@@Oo•° " \
                "  °•oOOooooO@@@@@@Oo•°  " \
                "    °•oOOO@@@@@@o•°     " \
                )
            width=24
            ;;

        (4)
            lines=(
                "               .•o°     " \
                "             .•o@o•     " \
                "            .•o@@o•     " \
                "           .•o@O@o•     " \
                "         .•oO@o•@o•     " \
                "       .•oO@o:° @O      " \
                "     .•oOO@o:°  @O      " \
                "   .•ooO@o:•....oOo•..• " \
                " °•ooOOO@@@@@OOOOOoooo. " \
                "              °oOOo°    " \
                "              •o@Oo•    " \
                "              •o@Oo•    " \
                "            ••oO@@Oo•.  " \
                "         °••ooO@@@Ooo•. " \
                )
            width=24
            ;;

        (5)
            lines=(
                "  °•@@Oo••.         .•   " \
                "  °•oO@@@O@@@@@OOooooO   " \
                "   °oO@•°        °•OOo   " \
                "   •oO@•°            °   " \
                "   °•ooOO@@OOoo.         " \
                "      °•oooOOO@@@o•.     " \
                "             °•oO@@o•.   " \
                "    .o.        •oO@@o••  " \
                "  .•Oo•.        •oO@@@o• " \
                " •oO••°         •oO@@@o• " \
                " oO•°         .•oO@@@o•° " \
                " °oO•.      .•oO@@@@o•°  " \
                "  °•OOooooO@@@@@@Oo•°    " \
                "    °•oOOO@@@OO•°        " \
                )
            width=26
            lines=(
                "  °•@@OOoooooooooooO@•°  " \
                "  °•oooOOO@@@@@@@OOOo•   " \
                "   °•o@•°          °••   " \
                "   •oO@•°            °   " \
                "   °•ooOO@@OOoo.         " \
                "      °•oooOOO@@@o•.     " \
                "             °•oO@@o•.   " \
                "    .o.        •oO@@o••  " \
                "  .•Oo•.        •oO@@@o• " \
                " •oO••°         •oO@@@o• " \
                " oO•°         .•oO@@@o•° " \
                " °oO•.      .•oO@@@@o•°  " \
                "  °•OOooooO@@@@@@Oo•°    " \
                "    °•oOOO@@@OO•°        " \
                )
            width=26
            ;;

        (6)
            lines=(
                "           ..•••..        " \
                "        .•oO@@@@Ooo.      " \
                "     .•o@Oo•°     °••     " \
                "    .•@Oo•°         °     " \
                "   .•@Oo•°                " \
                "  .•@Oo•                  " \
                "  •o@OOo•. .oO@@@Oo•.     " \
                "  •o@@Oo•oO@@@@@@@@@@o•   " \
                " •oO@@@@Oo•°    °oO@@Oo•  " \
                " °o@@@@Oo•      °•oO@@oo• " \
                " °oo@@Ooo•.    ••oO@@@Oo• " \
                "  °•oO@@OOOoooOOO@@@@Oo•  " \
                "   °•oO@@@@@@@@@@@@Ooo•°  " \
                "      °•oO@@@@@OOoo•°     " \
                )
            width=26
            ;;

        (7)
            lines=(
                "•@•..      ..••ooOO@• " \
                ".@@OOO@@@@@@@OOOooo•° " \
                ".oO•°°°  °°•o@@Oo•°   " \
                "°o        °•o@Oo•°    " \
                "         °•o@o•°      " \
                "        .•o@o•°       " \
                "        ••o@o•        " \
                "       .oO@o•         " \
                "       •o@o•          " \
                "      •o@oo           " \
                "      •o@@o           " \
                "       o@@O.          " \
                "     .•o@@Oo•.        " \
                "   .•ooO@@@Ooo•.      " \
                )
            width=23

            lines=(
                "•@@OOooooooooooOO@@@• " \
                ".@@OOO@@@@@@@OOOooo•° " \
                "°°        °•o@@Oo•°   " \
                "         °•o@Oo•°     " \
                "        °•o@o•°       " \
                "       °•o@o•°        " \
                "       °•o@o•         " \
                "      °•o@oo          " \
                "      °•o@oo          " \
                "      °•o@oo          " \
                "      •o@@oo•         " \
                "      •o@@Oo•.        " \
                "     .•o@@Oo•.        " \
                "   .•ooO@@@Ooo•.      " \
                )
            width=23
            ;;

        (8)
            lines=(
                "         .••••.        " \
                "       •o@@@OOoo•.     " \
                "     •o@@Ooo•••oOo•.   " \
                "    •o@@Oo•°   °•Oo•.  " \
                "   •o@@Oo•.      •Oo•  " \
                "   °•o@@Oo•.   .•oOo°  " \
                "     ••o@@@oooooOo•°   " \
                "   •o@@@@@@@@@@@Oo•.   " \
                " •ooO@@@Oo••°°°°•OOo•. " \
                " •oO@@OOo•       •OOo• " \
                " °oO@@@@Oo.      .OOo° " \
                " ••oO@@@@@OOooooOOOo•  " \
                "  °•oO@@@@@@@@@@OOo•°  " \
                "     °•o@@@@@OOOo•°    " \
                )
            width=23
            ;;

        (9)
            lines=(
                "         .••••.          " \
                "     ..oOOO@@@Oo•.       " \
                "   .•oOOooooO@@@@Oo•.    " \
                "  .ooo•°    °•oO@@@o•.   " \
                " .oo••       .•oO@@@o•.  " \
                " •ooo•.      .•oO@@@Oo•. " \
                " •ooOO@@oooOOooOO@@@@Oo• " \
                "  °•oOO@@@@OoooOOO@@@Oo• " \
                "             °•oOO@@@Oo• " \
                "  .•         ••oO@@@Oo•° " \
                "  oO°.      .•oO@@@@Oo°  " \
                "  °oO@o••••oOO@@@@Oo•°   " \
                "   °oOO@@@@@@@@OOo•°     " \
                "      °ooOO@@Oo•°        " \
                )
            width=24
            ;;

        (:)
            lines=(
                "" \
                "" \
                "   .•ooo•.  " \
                "  .•oO@Oo•° " \
                "  °•o@@@o•° " \
                "   °•o@o•°  " \
                "            " \
                "  .•o@o•.   " \
                " •oO@@@Oo•  " \
                " •oO@@@Oo°  " \
                " °•o@Oo•°   " \
                "" \
                "" \
                "" \
                )
            width=12
            ;;
    esac
    render_character
done
incr _close_to_the_edge
(( y = ( _close_to_the_edge * 16 ) + _xy_init ))
(( yy = y + 2 ))
tput cup $yy 0
# echo -n yy=$yy y=$y x=$x
}


#####
#   #  ##
#####  
#   #  ##
#####

function set_args
{
for arg in $* ; do
    case $arg in
        (-h|--help)
            clear
            echo
            echo usage:
            echo $zero '[clock-version] [color-palette]'
            echo $zero '[clock-version] [--acidx=42,46,206...]'
            echo defaults: $clocky $color_palette
            echo the --acidx option allows for customized color-palettes
            echo using the ANSI color codes
            echo

            for palette in `
                echo roger;
                grep '(.*).*yap.*;;' $0 |
                    grep -v grep |
                    cut -d= -f2 |
                    fields 1
                `; do
                eval $palette
                printf "%-22s => " ${palette#yap_}
                init
                while [[ $num -lt $pound_pastels ]]; do
                    echo -n "[48;5;${acidx[$num]}m  "
                    incr
                done
                echo "[m"
                echo
            done
            exit
            ;;
    
        (--acidx=*)
            colors=${arg##--acidx=}
            colors=${colors//,/ }
            acidx=( ${colors} )
            _yap_pound
            color_palette=: # nop the palette
            ;;

        (once) run_once=True ;;
        (1|render_clock_1|render_1) clocky=render_clock_1 ;;
        (2|render_clock_2|render_2) clocky=render_clock_2 ;;
        (3|render_clock_3|render_3) clocky=render_clock_3 ;;
        (4|render_clock_4|render_4) clocky=render_clock_4 ;;
        (demo) DEMO=1 ;;

        #====================
        #----- COLORS  ------
        #====================
        (cream) color_palette=yap_cream ;;

        (cream2) color_palette=yap_cream2 ;;

        (pastels1) color_palette=yap_pastels1 ;;
        (pastels2) color_palette=yap_pastels2 ;;
        (pastels3) color_palette=yap_pastels3 ;;
        (pastels4) color_palette=yap_pastels4 ;;

        (roger) color_palette=roger ;; ##( Dean, that is.)
        (green*) color_palette=yap_greens3 ;;
        (purple*) color_palette=yap_purples ;;
        (yellow*) color_palette=yap_yellow ;;
        (blue*) color_palette=yap_blue ;;

        (rainbow) color_palette=yap_rainbow ;;
        (rainbow_bright|bright_rainbow) color_palette=yap_rainbow_bright ;;
        (rainbow_spiral|spiral_rainbow) color_palette=yap_spiral_rainbow ;;
        (rainbow_full|full_rainbow) color_palette=yap_full_rainbow ;;
    esac
done
return
}


# MAIN
# defaults. last one wins.
clocky=render_clock_3
clocky=render_clock_4

color_palette=yap_rainbow_bright
color_palette=yap_full_rainbow

set_args "${@}"

# initialize the color palette
$color_palette

while : ; do
    tput clear
    $clocky
    if [[ $DEMO == 1 ]]; then
        exit
    fi
    sleep_for=7
    sleep $sleep_for
done

