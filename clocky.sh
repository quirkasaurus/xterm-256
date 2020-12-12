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
#                                                                      #
# - a sa sa - s s                                                      #
#   8 8  )                                                             #
# . • °  º  o O @                                                      #
# L M H  H  L M M                                                      #
#----------------------------------------------------------------------#
. more_funx $0
. yaps1

DEBUG=1 ; CLEAR=
CLEAR=
CLEAR=
DEBUG=  ; CLEAR=clear

#----------------------------------------------------------------------#
# click over the time precisely at X:00                                #
#----------------------------------------------------------------------#
function sleep_magic
{
tput cup 0 0
seconds=$( date +%S | sed -e 's/^0//' )
(( sleep_for = 60 - seconds )) # takes ~3 seconds to draw HH:MM

#----------------------------------------------------------------------#
# avoid flashing around 55-05 seconds                                  #
#----------------------------------------------------------------------#
if [[ $sleep_for -le 4 ]]; then
    (( sleep_for += 60 ))
fi
#----------------------------------------------------------------------#
# echo sleeping for: $sleep_for `date`                                 #
#----------------------------------------------------------------------#
}

#~.,_,.~*"`"*~.,_,.~*"`"*~.,_,.~*"`"*~.,_,.~*"`"*~.,_,.~*"`"*~.,_,.~*"`" 
#~.,_,.~*"`"*~.,_,.~*"`"*~.,_,.~*"`"*~.,_,.~*"`"*~.,_,.~*"`"*~.,_,.~*"`" 
#~.,_,.~*"`"*~.,_,.~*"`"*~.,_,.~*"`"*~.,_,.~*"`"*~.,_,.~*"`"*~.,_,.~*"`" 
#----------------------------------------------------------------------#
# print a single line of our big font characters.                      #
#----------------------------------------------------------------------#
function clocky_printc
{
#----------------------------------------------------------------------#
# echo draws things much faster                                        #
# i prefer slow. printc forks a new shell                              #
# which slows things down just enough to look nice.                    #
# however, we could always just source printc...                       #
# source-ing works fine for the short display                          #
#----------------------------------------------------------------------#
case $sleep_magic in
    (magic)
        echo -n "[38;5;${acidx[$_idx]}m${@}[m"
        ;;
    (*)
        printc -n "${acidx[$_idx]}" "${@}"
        ;;
esac
# echo -n "[7m[38;5;${acidx[$_idx]}m${@}[m"
_yap_next
}


#----------------------------------------------------------------------#
# historical first effort.                                             #
#----------------------------------------------------------------------#
function render_clock_1
{
init
init x -4
init y 3

if [[ $DEMO -eq 1 ]]; then
    numbers=( 1 2 3 4 5 : 6 7 8 9 0 )
else
    seconds=$( date +%S )
    numbers=( $(
    date -v+3S "+${date_format}" |
    sed -e 's/./& /g'
    ) )
fi

for number in ${numbers[*]} ; do
    init y 3
    incr
    incr x 7

#----------------------------------------------------------------------#
# if zero, do not print 1st number.                                    #
#----------------------------------------------------------------------#
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
                echo -n "$line"
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
                echo -n "$line"
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
                echo -n "$line"
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
                echo -n "$line"
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
                echo -n "$line"
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
                echo -n "$line"
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
                echo -n "$line"
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
                echo -n "$line"
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
                echo -n "$line"
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
                echo -n "$line"
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
                echo -n "$line"
                incr y
            done
            decr x 2
            ;;
    esac
done
tput cup 0 0
}


#----------------------------------------------------------------------#
# more dynamic font sizing character rendering.                        #
#----------------------------------------------------------------------#
function render_character
{
local x_check
(( x_check = x + width ))

(( _cols = COLUMNS + 0 ))
(( _lins = LINES + 0 ))

if [[ $x_check -gt $_cols ]]; then
    x=3
    incr _close_to_the_edge
#----------------------------------------------------------------------#
# debugging info jic.                                                  #
#----------------------------------------------------------------------#
#     tput cup 0 0
#     echo -n _close_to_the_edge=$_close_to_the_edge \
#         x=$x \
#         x_check=$x_check \
#         y=$y
#----------------------------------------------------------------------#
fi

(( y = ( _close_to_the_edge * 16 ) + _y_init ))
for line in "${lines[@]}" ; do
#----------------------------------------------------------------------#
# debugging status line                                                #
#----------------------------------------------------------------------#
    if [[ $DEBUG -ne 0 ]]; then
        tput cup 0 0 ; echo -n y=$y x=$x palette=$color_palette idx=$_idx pond=$pound_pastels
    fi
    tput cup $y $x
    clocky_printc "$line"
    incr y
done
incr x $width
}


#----------------------------------------------------------------------#
# finds the right spot to draw the clock.                              #
# keeps track of all the necessary counters.                           #
#----------------------------------------------------------------------#
function centralizationalizer
{
debug
init
init _close_to_the_edge

#----------------------------------------------------------------------#
# compute starting point for long version                              #
#----------------------------------------------------------------------#
init _x_init 3
init _y_init 3

#----------------------------------------------------------------------#
# compute middle of screen for short version.                          #
#----------------------------------------------------------------------#
case $sleep_magic in
    (magic) # on average, characters are 24 characters wide. best guess.
        _hours=$( date +%I | sed -e 's/^0//' )
        if [[ $_hours -lt 10 ]]; then
            (( _x_init = ( COLUMNS - 78 ) / 2 ))
        else
            ### for 10, 11, 12, increase by width 20, for the 1.
            (( _x_init = ( COLUMNS - 98 ) / 2 ))
        fi
        (( _y_init = ( LINES   - 14 ) / 2 ))

        # add some jitter for screen burn safety.
        (( up_and_over = RANDOM % 3 ))
        (( _x_init -= up_and_over ))
        (( _y_init -= up_and_over ))
        ;;
esac
init x $_x_init
init y $_y_init

return
}
#----------------------------------------------------------------------#
# end centering logic.                                                 #
#----------------------------------------------------------------------#


#----------------------------------------------------------------------#
# MAIN                                                                 #
#----------------------------------------------------------------------#
function render_clock_4
{
debug
centralizationalizer

#----------------------------------------------------------------------#
# for demo, print our complete set of supported characters             #
#----------------------------------------------------------------------#
if [[ $DEMO -eq 1 ]]; then
    numbers=( A B M P " " 1 2 3 4 5 : 6 7 8 9 0 )
else
#----------------------------------------------------------------------#
# otherwise, give us the time in the prescribed format.                #
# sed puts spaces between each number, enabling us to use it in the    #
# for loop.                                                            #
#----------------------------------------------------------------------#
    numbers=( $(
    date -v+3S "+${date_format}" |
    sed -e 's/^0//' \
        -e 's/./& /g'
    ) )
fi

for number in ${numbers[*]} ; do

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
            width=25
            ;;

        (0)
            lines=(
                "" \
                "           ..•••.           " \
                "        .•oO@@@@Oo•.        " \
                "     .•o@@Oo••° °•oo•.      " \
                "   .•o@@@Oo•°     °•oo•.    " \
                "  •o@@@@Oo•°       °•oo•.   " \
                " •o@@@@@Oo•         ••oo•.  " \
                " •o@@@@@Oo•         .•oo••  " \
                " •o@@@@@@o•.       ..•oOo•° " \
                " °o@@@@@@Ooo••....••oo@Oo•° " \
                "  °o@@@@@@Ooooooooooo@Oo•°  " \
                "   °o@@@@@@@@OOOO@@@Oo•°    " \
                "    °o@@@@@@@@@@@@@Oo•°     " \
                "       °o@@@@@@@Oo•°        " \
                )
            lines=(
                "" \
                "           ..•••.           " \
                "        .•oO@@@@Oo•.        " \
                "     .•o@@OOo•° °•oo•.      " \
                "   .•o@@@Oo•°     °•oo•.    " \
                "  •o@@@@Oo•°       °•oo•.   " \
                " •o@@@@@Oo•         ••oo•.  " \
                " •o@@@@@Oo•         .•oo••  " \
                " •o@@@@@@Oo.       ..•oOo•° " \
                " °o@@@@@@OOo••....••oo@Oo•° " \
                "  °o@@@@@@OOOOooooOO@@Oo•°  " \
                "   °o@@@@@@@@OOOO@@@Oo•°    " \
                "    °o@@@@@@@@@@@@@Oo•°     " \
                "       °o@@@@@@@Oo•°        " \
                )
            lines=(
                "" \
                "           ..•••.           " \
                "        .•oO@@@@Oo•.        " \
                "     .•o@@OOo•° °•oo•.      " \
                "   .•o@@@Oo•°     °•oo•.    " \
                "  •o@@@@Oo•°       °•oo•.   " \
                " •o@@@@@Oo•         ••oo•.  " \
                " •o@@@@@Oo•         .•ooo•  " \
                " •o@@@@@@Oo.        .•oOo•° " \
                " •o@@@@@@OOo••....••oo@Oo•° " \
                "  •O@@@@@@OOOOooooOO@@OO•°  " \
                "   °O@@@@@@@@OOOO@@@OOOº°   " \
                "    °O@@@@@@@@@@@@@OOº°°    " \
                "      °ºO@@@@@@@OOOº°°      " \
                )
            lines=(
                "" \
                "           ..•••.           " \
                "        .•oO@@@@Oo•.        " \
                "     .•o@@OOo•° °•oo•.      " \
                "   .•o@@@Oo•°     °•oo•.    " \
                "  •o@@@@Oo•°       °•oo•.   " \
                " •o@@@@@Oo•         ••oo•.  " \
                " •o@@@@@Oo•         .•ooo•  " \
                " •o@@@@@@Oo.        .•oOo•° " \
                " •o@@@@@@OOo••....••oo@Oo•° " \
                "  •O@@@@@@OOOOOOOOOO@@OO•°  " \
                "   °O@@@@@@@@OOOO@@@OOOº°   " \
                "    °O@@@@@@@@@@@@@OOº°°    " \
                "      °ºO@@@@@@@OOOº°°      " \
                )
            lines=(
                "" \
                "           ..•••.           " \
                "        .•oO@@@@Oo•.        " \
                "     .•o@@OOo•° °•Oo•.      " \
                "   .•o@@@Oo•°     °•Oo•.    " \
                "  •o@@@@Oo•°       °•Oo•.   " \
                " •o@@@@@Oo•         ••Oo•.  " \
                " •o@@@@@Oo•         .•oOo•. " \
                " •o@@@@@@Oo.        .•oOo•. " \
                " •o@@@@@@OOo••....••oO@Oo•  " \
                "  •O@@@@@@OOOOOOOOOO@@OOº°  " \
                "   °O@@@@@@@@OOOO@@@OOOº°   " \
                "    °O@@@@@@@@@@@@@OOº°     " \
                "      °ººO@@@@@@OOºº°       " \
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
            width=19
            ;;

        (2)
            lines=(
                "      .•oOO@@@@@o•.       " \
                "    .•oOOoooO@@@@@@o•.    " \
                "   .oO•.      .•oO@@@o•.  " \
                "  •oO•°        .•oO@@Oo•. " \
                "   o°           •oOO@@o•• " \
                "   °           .•oO@@o••  " \
                "           ..•ooO@@Oo•°   " \
                "      .•ooOO@Oooººº°°     " \
                "     .•oO@o•°             " \
                "   .•oO@o•°               " \
                "  .•oO@o•°            .   " \
                " ••ooOOoo.          .o.   " \
                " °•oooOOO@oooooooooooo•   " \
                "  °•o@@@@@OOOOO@@@@@O@°   " \
                )
            width=26
            lines=(
                "      .•oOO@@@@@o•.       " \
                "    .•oOOºº°°°•O@@@o•.    " \
                "   .oO•°       •oO@@@o•.  " \
                "  •oO•°         •oO@@Oo•. " \
                "   o°           •oOO@@o•• " \
                "   °           .•oO@@o••  " \
                "           ..•ooO@@Oo•°   " \
                "       .•ooO@OOºººº°°     " \
                "     .•oO@o•°             " \
                "   .•oO@o•°               " \
                "  .•oO@o•°            .   " \
                " ••ooOOoo.          .o•   " \
                " °•oooOOO@oooooooooooo•   " \
                "  °•o@@@@@OOOOO@@@@@O@°   " \
                )
            lines=(
                "      .•oOO@@@@@o•.       " \
                "    .•oOOºº°°°ºO@@@o•.    " \
                "   .oOº°       °oO@@@o•.  " \
                "  •oO•°         °oO@@Oo•. " \
                "   o°           •oOO@@o•• " \
                "   °           .•oO@@o••  " \
                "           ..•ooO@@Oo•°   " \
                "       .•ooO@OOºººº°°     " \
                "     .•oO@Oº°             " \
                "   .•oO@o•°               " \
                "  .•oO@o•             .   " \
                " ••ooOOOo•.........••oo   " \
                " °•oooOOO@ooooooooooooo   " \
                "  °•o@@@@@OOOOO@@@@@O@°   " \
                )
            lines=(
                "      .•oOO@@@@@o•.       " \
                "    .•oOOººººººO@@@o•.    " \
                "   .oOº°       °oO@@@o•.  " \
                "  •oO•°         °oO@@Oo•. " \
                "   o°           •oOO@@o•• " \
                "   °           .•oO@@o••  " \
                "           ..•ooO@@Oo•°   " \
                "       .•ooO@OOºº°°       " \
                "     .•oO@@@Oº°           " \
                "   .•oO@@@o•°             " \
                "  .•oO@@@o•           .   " \
                " .•oOO@@@Oo•.......••oO   " \
                " .•oOO@@@@OOOOOOOOOOOOO   " \
                "  °•o@@@@@OOOOO@@@@@O@°   " \
                )
            width=26
            ;;

        (3)
            lines=(
                "       .•••.            " \
                "    ••oOO@@@o•          " \
                "  •oOOOºººoO@@@o•       " \
                " °o•°     °•oO@@@o•     " \
                "           .•oO@@@o•    " \
                "           .•oO@@o•°    " \
                "      ...•oO@@@o••      " \
                "    ••ooOOOOO@@@@@o.    " \
                "     °°°••oOO@@@@@Ooo.  " \
                "           •oOO@@@@@Oo• " \
                "            .•oO@@@@Oo• " \
                " °ooo•.....•oO@@@@@Oo•° " \
                "  °•oOOooooO@@@@@@Oo•°  " \
                "    °•oOOO@@@@@@o•°     " \
                )
            lines=(
                "        .•••.           " \
                "    ••oOO@@@Ooo.        " \
                "  •oOOººººoO@@@Oo.      " \
                " °º°      °•oO@@@O.     " \
                " °         .•oO@@@O•    " \
                "           .•oO@@O•°    " \
                "      ...•oO@@@o••      " \
                "   ••ooOOOOOO@@@@Oo.    " \
                "      °°ºººOO@@@@@OOo.  " \
                "            °OO@@@@@Oo. " \
                " .          .•OO@@@@OO: " \
                " °Oo•......•oO@@@@@OO:° " \
                "  °ºOOOOOOOO@@@@@@Oº°°  " \
                "    °ººOOO@@@@@OOº°°    " \
                )
            lines=(
                "        .•••.           " \
                "    ••oOO@@@Ooo.        " \
                "  •oOOººººoO@@@Oo.      " \
                " °º°      °•oO@@@O.     " \
                " °         .•oO@@@O•    " \
                "           .•oO@@O•°    " \
                "        ..•oO@@@o••     " \
                "   ••oOOOOOOOO@@@@Oo.   " \
                "        °°°ºOO@@@@@OO.  " \
                "            °OO@@@@@Oo. " \
                " :.         .OO@@@@@OO: " \
                " °Oo•......ooO@@@@@OOº° " \
                "  °ºOOOOOOOO@@@@@@OOº°  " \
                "    °ººOOO@@@@@OOºº°    " \
                )
            width=24
            ;;

        (4)
            lines=(
                "               .•o°     " \
                "             .•o@o°     " \
                "            .•o@@o°     " \
                "           .•o@O@o°     " \
                "         .•oO@o•@o      " \
                "       .•oO@o:° @O      " \
                "     .•oOO@o:°  @O•     " \
                "   .•ooO@o:•....oOo•..: " \
                " .•ooOOO@@@@@OOOOOOooo• " \
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
            width=25
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
                " oO••         .•oO@@@o•° " \
                " °oO°•......••oO@@@@o•°  " \
                "  °•OOooooO@@@@@@Oo•°    " \
                "    °•oOOO@@@OO•°        " \
                )
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
                " oO••         .•oO@@@o•° " \
                " °oO°•......••oO@@@@o•°  " \
                "  °•OOooooO@@@@@@Oo•°    " \
                "    °•oOOO@@@OO•°        " \
                )
            width=25
            ;;

        (6)
            lines=(
                "           ..•••..        " \
                "        .•oO@@@@Ooo.      " \
                "     .•o@OO•°     °ºo     " \
                "    .•@OO•°         °     " \
                "   .•@OO•°                " \
                "  .•@OO•     .•••.        " \
                "  •o@OOo.  .oO@@@Oo•.     " \
                "  •o@@OoooO@@@@@@@@@@o•   " \
                " •oO@@@OO•°    °oO@@@Oo•  " \
                " °o@@@Oo•       •oO@@@oo• " \
                " °oo@Ooo•.     .oO@@@@Oo• " \
                "  °•oO@OOOoooOOO@@@@@@Oo• " \
                "   °•oO@@@@@@@@@@@@Ooo•°  " \
                "      °•oO@@@@@OOoo•°     " \
                )
            lines=(
                "           ..•••..        " \
                "        .•o@@@@@Ooo.      " \
                "     .•o@@O•°°   °°O.     " \
                "    .•@OO•°         º     " \
                "   .•@OO•°                " \
                "  .•@OOO     .••••.       " \
                "  •o@OOO.  .oO@@@Oo•.     " \
                " •oO@@OoooO@@@@@@@@@@o•   " \
                " •oO@@@@@O•°     °oO@Oo•  " \
                " °o@@@@@Oo        •oO@oo• " \
                " °oO@@@Ooo•......•oO@@Oo• " \
                "  °ºOO@@@OOOoooOOO@@@@Oo• " \
                "   °ºOO@@@@@@@@@@@@@OOº°  " \
                "      °ººO@@@@@OOOºº°     " \
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
            width=22

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
            width=22
            ;;

        (8)
            lines=(
                "         .••••.        " \
                "       •o@@@OOoo•.     " \
                "     •o@@@Ooo••oOo•.   " \
                "    •o@@@Oo•°  °•Oo•.  " \
                "   •o@@@Oo•.     •Oo•  " \
                "   °•o@@@Oo•.  .•oOo°  " \
                "     ••o@@@@oooooOo•°  " \
                "   •o@@@@@@@@@@@Oo•.   " \
                " •ooO@@@@Oo••°°°•OOo•. " \
                " •oO@@@OOo•      •OOo• " \
                " °oO@@@@@Oo.     .OOo° " \
                " ••oO@@@@@OOooooOOOo•  " \
                "  °•oO@@@@@@@@@@OOo•°  " \
                "     °•o@@@@@OOOo•°    " \
                )
            lines=(
                "         .••••.        " \
                "       •o@@@OOoo•.     " \
                "     •o@@@OOº°°ºOo•.   " \
                "    •o@@@Oº°    °Oo•.  " \
                "   •o@@@Oo•      •Oo•  " \
                "   °•o@@@Oo•.  .•oOo°  " \
                "     ••o@@@@oooooOo•°  " \
                "   •o@@@@@@@@@@@Oo•.   " \
                "  •oO@@@@OOº°°°°ºOOo•. " \
                " •oO@@@OOo•      •OOo• " \
                " •oO@@@@Oo.      .OOo° " \
                "  •oO@@@@@OOooooOOOo•  " \
                "   •oO@@@@@@@@@@OOo•°  " \
                "     °•O@@@@@OOOo•°    " \
                )
            width=23
            ;;

        (9)
            # alt-right-paren: ººººº
            lines=(
                "         .••••.          " \
                "     ..oOOO@@@Oo•.       " \
                "   .•oOOººººOOO@@Oo•.    " \
                "  .ooo•°    °•oOO@@Oo•.  " \
                " .oo••        •oOO@@@o•  " \
                " •ooo•.       .oO@@@@Oo. " \
                " •ooOO@@oooooOOOOO@@@Oo• " \
                "  °ººOO@@@@@OOOOOO@@@Oo• " \
                "              °oOO@@@Oo• " \
                "  .o.         •oOOO@@Oo° " \
                "  oOOo.      .oOOO@@Oo°  " \
                "  °oO@@OooooO@@@@@Oo•°   " \
                "   °oOO@@@@@@@@OOo•°     " \
                "      °ooOO@@Oo•°        " \
                )
            width=24

            lines=(
                "         .••••.          " \
                "     ..oOOO@@@Ooo•.      " \
                "   .•oOOOºººOOO@@Oo•.    " \
                "  .ooo•°    °•oOO@@Oo.   " \
                " .oo••        •oOO@@@o.  " \
                " •ooo••......••oO@@@@Oo. " \
                " •ooOO@ooooooOOOOO@@@Oo: " \
                "  °ºOOO@@@@@OOOOOO@@@Oo: " \
                "      °°°°°°°  oOO@@@Oo• " \
                "  .o          •oOOO@@Oº° " \
                "  oO°.       .oOOO@@Oº°  " \
                "  °oO@o....ooOOO@@@Oº°   " \
                "   °oOO@@@@@@@@@OOº°     " \
                "      °ººO@@@Oº°         " \
                )
            width=24
            ;;

        (:)
            lines=(
                "" \
                "" \
                "   .•ooo•.  " \
                "  .•oO@Oo•. " \
                "  °•o@@@o•° " \
                "   °ºO@O•°  " \
                "            " \
                "  .•o@o•.   " \
                " •oO@@@Oo•  " \
                " •oO@@@Oo°  " \
                " °ºo@Ooº°   " \
                "" \
                "" \
                "" \
                )
            lines=(
                "" \
                "" \
                "   .•oo•.   " \
                "  •oO@@Oo•  " \
                "  •oO@@Oo°  " \
                "  °ºO@Oº°   " \
                "            " \
                "  .•o@o•.   " \
                " •oO@@@Oo•  " \
                " •oO@@@Oo°  " \
                " °ºo@@oº°   " \
                "" \
                "" \
                "" \
                )
            width=12
            ;;
    esac
    render_character
done

#----------------------------------------------------------------------#
# if we reach the edge, start on the next line, leaving a blank line.  #
#----------------------------------------------------------------------#
incr _close_to_the_edge
(( y = ( _close_to_the_edge * 16 ) + _y_init ))
(( yy = y + 2 ))
tput cup $yy 0

### echo -n yy=$yy y=$y x=$x
}


#----------------------------------------------------------------------#
# printing a dot across the bottom of the display every 10 seconds.    #
#----------------------------------------------------------------------#
function pulse
{
lines=(
    "" \
    "" \
    "" \
    "" \
    "   .•o@o•.   " \
    "  •oO@@@Oo•  " \
    "  •oO@@@Oo°  " \
    "  °ºo@@oº°   " \
    "" \
    "" \
    "" \
    )
lines=(
    "   .•o@o•.   " \
    "  •oO@@@Oo•  " \
    "  •oO@@@Oo°  " \
    "  °ºo@@oº°   " \
    )
width=12

render_character
tput cup 0 0
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
        (-d|--debug) DEBUG=1 ;;
        (-n|--no-sleep|--noSleep) start_sleep=0 ;;
        (random) yap_random_colors ;;
        (-l|--long) date_format='%I:%M:%S:%p' ; sleep_magic= ;;
        (-s|--short) sleep_magic=magic ; date_format='%I:%M' ;;
        (-h|--help)
            $CLEAR
            echo
            echo usage:
            echo $zero '[-s|--short|-l|--long]' '[clock-version] [color-palette]'
            echo $zero '[--acidx=42,46,206...]'
            echo defaults: $clocky $color_palette short
            # roger
            yap_purples
            yap_show_colors
            echo the --acidx option allows for customized color-palettes
            echo colors would be comma or space delimited
            echo using the ANSI color indexes. '(see: frogs)'
            echo --short date format: HH:MM, default ${date_format}
            print_sep '- '

            for palette in `
                echo barb roger roger2 bloop blook
                grep '(.*).*yap.*;;' $0 |
                    grep -v grep |
                    fields 2
                `; do
                eval $palette
                printf "%-22s => " ${palette#yap_}
                init
                while [[ $num -lt $pound_pastels ]]; do
                    # echo -n "[48;5;${acidx[$num]}m  "
                    printf "[48;5;${acidx[$num]}m[30m%3d " ${acidx[$num]}
                    incr
                done
                echo "[m"
                echo
            done
            exit
            ;;
    
#----------------------------------------------------------------------#
# will actually work with: --acidx=1,2,3 or "--acidx=1 2 3"            #
# just needs to be a single parameter.                                 #
#----------------------------------------------------------------------#
        (--acidx=*)
            acidx=( $(
                echo $arg | sed -e 's/[^0-9]/ /g' | trr
            ) )
            _yap_pound
            yap_show_colors
            sleep 2
            : # nop the palette
            color_palette=:
            ;;

        (once) run_once=True ;;
        (1|render_clock_1|render_1) clocky=render_clock_1 ;;
        (4|render_clock_4|render_4) clocky=render_clock_4 ;;
        (demo) DEMO=1 ; sleep_magic=demo ;;

        #===================
        #----- COLORS ------
        #===================
        (bloop)    bloop ;;
        (blook)    blook ;;
        (cream)    yap_cream ;;
        (cream2)   yap_cream2 ;;

        (pastels1) yap_pastels1 ;;
        (pastels2) yap_pastels2 ;;
        (pastels3) yap_pastels3 ;;
        (pastels4) yap_pastels4 ;;

        (roger)    roger ;; ##( Dean, that is.)
        (roger2)   roger2 ;; ##( Dean, that is.)
        (greens3)  yap_greens3 ;;
        (greens)   yap_greens ;;
        (purple*)  yap_purples ;;
        (yellow*)  yap_yellow ;;
        (blue*)    yap_blue ;;

        (rainbow)                       yap_rainbow ;;
        (rainbow_bright|bright_rainbow) yap_rainbow_bright ;;
        (rainbow_spiral|spiral_rainbow) yap_spiral_rainbow ;;
        (rainbow_full|full_rainbow)     yap_full_rainbow ;;
        (barb) barb ;; # pinks and pinkish reds
    esac
done
return
}


#----------------------------------------------------------------------#
# MAIN                                                                 #
# defaults.                                                            #
#----------------------------------------------------------------------#
title clocky $*
sleep_for=7
sleep_magic=magic
date_format='%I:%M:%S:%p'
date_format='%I:%M'
yap_purples
clocky=render_clock_4
start_sleep=3

set_args ${@}

if [[ $DEMO -eq 1 ]]; then
    $CLEAR
    $clocky
    exit
fi

if [[ -n $start_sleep ]]; then
    echo
    echo sleeping a bit. please maximize the screen.
    echo
    sleep ${start_sleep}
fi

#----------------------------------------------------------------------#
# hesitate to give time to maximize the screen.                        #
#----------------------------------------------------------------------#
declare -a orig_acidx
orig_acidx=( $( echo ${acidx[*]} ) )

$CLEAR
while : ; do
#----------------------------------------------------------------------#
# explicitly set color-palette                                         #
#----------------------------------------------------------------------#
    acidx=( $( echo ${orig_acidx[*]} ) )
    _yap_pound
    _idx=0

    $CLEAR
    $clocky
    case $sleep_magic in
        (magic) sleep_magic ;;
        (*) ;; # for --long format. we refresh every 7 seconds.
    esac
    init x $_x_init
#----------------------------------------------------------------------#
# kinda of like a typewriter carriage return;                          #
# print our 10 second dots below the time.                             #
#----------------------------------------------------------------------#
    (( y = _y_init + 16 ))
    yap_rainbow_bright
    (( _idx = RANDOM % pound_pastels ))
    sleep_for=55
#----------------------------------------------------------------------#
# For testing the pulse; uncomment to 'continue':                      #
#----------------------------------------------------------------------#
#----------------------------------------------------------------------#
# pulse ; sleep 1                                                      #
# pulse ; sleep 1                                                      #
# pulse ; sleep 1                                                      #
# pulse ; sleep 1                                                      #
# pulse ; sleep 1                                                      #
# sleep 3                                                              #
# continue                                                             #
#----------------------------------------------------------------------#
    while [[ $sleep_for -gt 10 ]]; do
        (( sleep_for -= 10 ))
        sleep 10
        pulse
    done
    sleep $sleep_for
done

