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

declare -a numbers

CLEAR=
CLEAR=
DEBUG=1 ; CLEAR=clear
DEBUG=  ; CLEAR=clear

#----------------------------------------------------------------------#
# glyph. here is a playground for messing with the dots.               #
#----------------------------------------------------------------------#
function glyphs
{
for a in @ O o . • º ° @ O o . • º ° @ O o . • º ° @ O o . • º ° ; do echo -n "$a"
for b in @ O o . • º ° @ O o . • º ° @ O o . • º ° @ O o . • º ° ; do echo -n "$b"
for f in @ O o . • º ° @ O o . • º ° @ O o . • º ° @ O o . • º ° ; do echo -n "$f"
done
done
done
return

cat << EOF

@Oo•.•º°@Oo•.•º°@Oo•.•º°@Oo•.•º°@Oo•.•º°
@Oo•.•º°@Oo•.•º°@Oo•.•º°@Oo•.•º°@Oo•.•º°
@Oo•.•º°@Oo•.•º°@Oo•.•º°@Oo•.•º°@Oo•.•º°
@Oo•.•º°@Oo•.•º°@Oo•.•º°@Oo•.•º°@Oo•.•º°

@Oo.

.•º°

@@@@@@@
@@@@@@@
@@@@@@@
@@@@@@@
@@@@@@@
@@@@@@@
OOOOOOO
OOOOOOO
OOOOOOO
OOOOOOO
OOOOOOO
OOOOOOO
ooooooo
ooooooo
ooooooo
ooooooo
ooooooo
ooooooo
ººººººº
ººººººº
ººººººº
ººººººº
ººººººº
ººººººº
•••••••
•••••••
•••••••
•••••••
•••••••
•••••••
°°°°°°°
°°°°°°°
°°°°°°°
°°°°°°°
°°°°°°°
°°°°°°°
.......
.......
.......
.......
.......
.......


. • °  º  o O @                                                      #
. • °  º  o O @                                                      #
. • °  º  o O @                                                      #
. • °  º  o O @                                                      #


EOF

return
}


#----------------------------------------------------------------------#
# click over the time precisely at X:00                                #
#----------------------------------------------------------------------#
function sleep_magic
{
tput cup 0 0
seconds=$( date -v+3S +%S | sed -e 's/^0//' )
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
    if [[ ${#numbers[*]} -eq 0 ]]; then
        numbers=( 1 2 3 4 5 : 6 7 8 9 0 )
    fi
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
# randomize the demo letters.                                          #
#----------------------------------------------------------------------#
if [[ $DEMO -eq 1 ]]; then
    if [[ ${#numbers[*]} -eq 0 ]]; then
#----------------------------------------------------------------------#
# for demo, print our complete set of supported characters             #
#----------------------------------------------------------------------#
        numbers=( 1 2 3 4 5 : 6 7 8 9 0 . )
        numbers=( A B M P " " 1 2 3 4 5 : 6 7 8 9 0 . )
        numbers=(
            $( 
            for x in \
                " " : \
                A B M P \
                1 2 3 4 5 \
                6 7 8 9 0 . \
                ; do
                echo $RANDOM $x
            done | sort -rn | fields 2
            )
        )
    fi
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
        (.) 
            lines=(
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                "      "
                "   .•o@o•.   "
                "  •o@@O.Oo•  "
                "  •o@@OOOo°  "
                "   ºo@@oº°   "
                "      "
                )
            width=13
            ;;

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
                "    .•oOO@@@ºººO@OOO•.   " \
                "   .•oO@Oo•    •oOO@Oo.  " \
                "  .•oO@Oo•      •oO@Oo•. " \
                "  .•oO@@Oo•....•oOO@OOo• " \
                " .•oOO@@@OOOOOOOOO@@@OO• " \
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
                "       .°O.      " \
                "      .•O@•      " \
                "    .•oO@@•      " \
                "  .•ooO@@@•      " \
                "     °•o@o.      " \
                "     °•o@o       " \
                "     °•o@•       " \
                "     °•o@•       " \
                "     °•@@•       " \
                "     °•@o•       " \
                "     °•o@•       " \
                "     °•o@o•      " \
                "    .•o@@Oo•.    " \
                " .•ooO@@Ooooo•.. " \
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
            lines=(
                "      .•oOO@@@@@o•.       " \
                "    .•O@OºººººO0@@@O•.    " \
                "   •O@º°       °oO@@@o•.  " \
                "  •O0º          •oO@@@o•. " \
                "  °0º           :oO@@@o•• " \
                "   °           .•oO@@O••  " \
                "           ..•oO@@@0o•°   " \
                "       .•oO0@@@0º°°       " \
                "     .•oO0@@0º°           " \
                "   .•oO0@@0º              " \
                "  .•oO0@@0:           .   " \
                " .•oO0@@@0O•.......••oO   " \
                " .•oO0@@@@OOOOOOOOO0@@O   " \
                "  °•oO0@@@OOOOO@@@@@O@º   " \
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
                "    .•oOO@@@Ooo.        " \
                "  •oOOººººoO@@@Oo.      " \
                " °º°      °•oO@@@O.     " \
                " °         .•oO@@@O•    " \
                "           .•oO@@O•°    " \
                "         .•oO@@@o••     " \
                "   ••oooOOOOOO@@@@Oo.   " \
                "         °°ºOO@@@@@OO.  " \
                "            °OO@@@@@Oo. " \
                " :.         .OO@@@@@OO: " \
                " °Oo•......ooO@@@@@OOº° " \
                "  °ºOOOOOOOO@@@@@@OOº°  " \
                "    °ººOOO@@@@@OOºº°    " \
                )
            lines=(
                "        .•••.           " \
                "    .•oOO@@@Ooo.        " \
                "   oOOººººoO@@@Oo.      " \
                "  Oº      °•oO@@@O.     " \
                " °         .•oO@@@O•    " \
                "           .•oO@@O•°    " \
                "         .•oO@@@o••     " \
                "   ••oooOOOO@@@@@@Oo.   " \
                "         °°ºOO@@@@@OO.  " \
                "            °OO@@@@@Oo. " \
                " .          .OO@@@@@OO: " \
                " °Oo•......ooO@@@@@OOO° " \
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
            lines=(
                "  °•@@OOoooooooooooO@•°  " \
                "  °•oooOOO@@@@@@@OOOo•   " \
                "   °•O@•°          °º•   " \
                "   •OO@•.            °   " \
                "   °ºOO@@@OOooo.         " \
                "      °ºººOOOO@@@o•.     " \
                "             °•oO@@o•.   " \
                "    .o.        •oO@@o••  " \
                "  .•Oo•         •oO@@@o• " \
                " •oO°           •oO@@@o• " \
                " oO•           •oO@@@o•° " \
                " °oO°•.......•oO@@@@o•°  " \
                "  °•OOooooO@@@@@@Oo•°    " \
                "    °ººOOO@@@OOºº        " \
                )
            width=25
            ;;

        (C)
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
            width=24
        ;;
        (D)
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
            width=24
        ;;
        (E)
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
            width=24
        ;;
        (F)
            lines=(
                "                        " \
                "            ...         " \
                "        .ooO@@@Oo.      " \
                "     .oO@@@OºººººOO     " \
                "   .oO@@OO°             " \
                "  .oO@@O°               " \
                "  oO@@O•      ...       " \
                " .O@@@O.   .oOO@@Ooo.   " \
                " :O@@@@OoO@@@@@@@@@@Oo  " \
                " :O@@@@@OOº°°°°°ºO@@@@O " \
                " °O@@@@@O.        O@@@O " \
                "  ºO@@@@@Oo.....oO@@@Oº " \
                "   °OO@@@@OOO@O@@@@Oº°  " \
                "     °ººO@@@@@OOOº°     " \
                )
            width=24
        ;;
        (G)
            lines=(
                "                        " \
                "           ...          " \
                "        .oO@@@Oo.       " \
                "     .oO@@@OººººO•      " \
                "   .oO@@OO°             " \
                "  .oO@@O°               " \
                "  oO@@O•     ....       " \
                " .O@@OOo.oOO@@@@@@Oo.   " \
                " .O@@@@@@OOº°°°°°ºO@Oo  " \
                " oO@@@@OOo•       •O@O• " \
                " oOO@@@@Oo..     ..O@O° " \
                " °ºOO@@@@@OOooooO@@OO°  " \
                "  °ºOO@@@@@@@@@@@OOº°   " \
                "    °ººOO@@@@@@Oºº      " \
                )
            width=24
        ;;
        (H|6)
            lines=(
                "                        " \
                "            ...         " \
                "        .oO@@@@Oo.      " \
                "     .o@@@0º°°°°º0o     " \
                "   .o0@@O°              " \
                "  .o0@@o                " \
                " .O0@@0•     ....       " \
                " o0@@@0•..o0@@@@@0Oo.   " \
                " O0@#@@0@@ºº°°°°°ºO0Oo. " \
                " 0@@##@00°         O0O• " \
                " º0@#@@00.        .O0O° " \
                " °00@@@@OOo......oO0O°  " \
                "  °OO0@@@@@@@@@@@00º°   " \
                "    °ººO0@@@@@@0ºº°     " \
                )
            width=24
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
                "         .••••.          " \
                "       •oO@@OOOo•.       " \
                "     •oO@@OOº°°ºOO•.     " \
                "    •oO@@Oº     °OO•.    " \
                "   •oO@@Oo•      •OO•    " \
                "   °•oO@@Oo•.  .•oOO°    " \
                "     ••oO@@OOOOOOO•      " \
                "   .oOO@@@@@@@@@@@Oo.    " \
                " .oOO@@@@OOº°°°°°ºO@Oo   " \
                " oOO@@@OOo•       •O@O•  " \
                " oOO@@@@Oo..     ..O@O•  " \
                " °ºOO@@@@@OOooooO@@OO°   " \
                "  °ºOO@@@@@@@@@@@OOº°    " \
                "    °ººOO@@@@@@Oºº       " \
                )
            width=24
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
            lines=(
                "        .•••.           " \
                "     .oO@@@OOoo•.       " \
                "   .•o@Oº°°°ºO@@O•.     " \
                "  .o@@O°      °OO@Oo.   " \
                " .o@@O         oO@@@o   " \
                " •o@@OO•.....•OOO@@@Oo  " \
                " •ooO@@@@@@@@@@O@@@@Oo. " \
                "  °ºOOO@@@@@@OOºOO@@Oo. " \
                "      °°°°°°°  °OO@@Oo  " \
                "               •O@@OO•  " \
                "              .OO@@Oº   " \
                "             .OO@@Oº    " \
                "            .OO@@Oº     " \
                "           .O@@Oº       " \
                )
            lines=(
                "     .•oO@@@@Oo•.       " \
                "   .•o@Oº°°°ºO@@@O•.    " \
                "  .o@@O°      °OO@Oo.   " \
                "  o@@O         oO@@@o.  " \
                " .o@@O         oO@@@Oo  " \
                " •o@@OO•.....•OOO@@@Oo° " \
                " °ooO@@@@@@@@@@O@@@@Oo• " \
                "  °ºOOO@@@@@@@OºOO@@Oo. " \
                "      °°°°°°°  °OO@@Oo  " \
                "               •O@@OO•  " \
                "              .OO@@Oº   " \
                "             .OO@@Oº    " \
                "            .OO@@Oº     " \
                "           .O@@Oº       " \
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
            lines=(
                "" \
                "" \
                "" \
                "   .•oo•.   " \
                "  •oO@@Oo•  " \
                "  •oO@@Oo°  " \
                "   ºO@Oº°   " \
                "            " \
                "  .•o@o•.   " \
                " •o@@@OOo•  " \
                " •O@@@OOO°  " \
                "  ºO@@Oº°   " \
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
    "   .•o@o•.  " \
    "  •oO@@@Oo• " \
    "  •oO@@@Oo° " \
    "  °ºo@@oº°  " \
    "" \
    "" \
    "" \
    )
lines=(
    "    .o@o.   " \
    "   oO#@@Oo  " \
    "  •OO#@@Oo° " \
    "   ºO@@Oº°  " \
    )
lines=(
    "   .o@@o.   " \
    "  oOo@@OOo. " \
    " °OoO@@@OO. " \
    "  °ºo@@Oº°  " \
    )
lines=(
    "   .o@@o.   " \
    "  oOO@@OOo. " \
    " °oOO@@@OO. " \
    "  °ºO@@Oº°  " \
    )
lines=(
    "  .•o@o•.   " \
    " •o@@@OOo•  " \
    " •O@@@OOO°  " \
    "  ºO@@Oº°   " \
    )
lines=(
    "   .•o@o•.  " \
    "  •o@@OOOo• " \
    "  •o@@OOOo° " \
    "   ºo@@oº°  " \
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
for arg in "${@}" ; do
    case "$arg" in
        (*pulse) PULSE_TEST=1 ;;
        (-g|--glyphs) glyphs ; exit ;;
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
            echo $zero '[--demo=HH:MM] [demo]'
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
            sling ${arg##*=}
            # acidx=( $(
                # echo $arg | sed -e 's/[^0-9]/ /g' | trr
            # ) )
            # _yap_pound
            # yap_show_colors
            sleep 2
            : # nop the palette
            color_palette=:
            ;;

        (once) run_once=True ;;
        (1|render_clock_1|render_1) clocky=render_clock_1 ;;
        (4|render_clock_4|render_4) clocky=render_clock_4 ;;

        (demo) DEMO=1 ; sleep_magic=demo ;;

        # allow user to specify what HH:MM to display
        (--demo=*)
            DEMO=1 ; sleep_magic=demo ; 
            numbers=( $(
                echo "${arg#--demo}" |
                    sed -e 's/./& /g'
                ) )
            ;;
    
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
        (yap*) eval $arg ;;
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
PULSE_TEST=0

#----------------------------------------------------------------------#
# yap_purples                                                          #
#----------------------------------------------------------------------#
roger
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

#----------------------------------------------------------------------#
# auto-refresh running clocky.sh                                       #
#----------------------------------------------------------------------#
FEXEC=$( which $0 )
CLOCKSUM=$( sum $FEXEC )

$CLEAR
while : ; do

#----------------------------------------------------------------------#
# auto-refresh running clocky.sh                                       #
#----------------------------------------------------------------------#
    NEW_CLOCKSUM=$( sum $FEXEC )
    if [[ $CLOCKSUM != $NEW_CLOCKSUM ]]; then
        exec $zero $*
    fi

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
#----------------------------------------------------------------------#
# kinda of like a typewriter carriage return;                          #
# print our 10 second dots below the time.                             #
#----------------------------------------------------------------------#
    init x $_x_init
    (( y = _y_init + 16 ))

#----------------------------------------------------------------------#
# effort to parameterize the pulse dot colors aborted.                 #
# TOO MUCH GOING ON................ ABORT MISSION                      #
# this also will not work with the way we grep for palettes in help.   #
# because of the default case syntax.                                  #
#----------------------------------------------------------------------#

#----------------------------------------------------------------------#
#     yap_burple                                                       #
#----------------------------------------------------------------------#
    yap_rainbow_bright

    (( _idx = RANDOM % pound_pastels ))

#----------------------------------------------------------------------#
# For testing the pulse; uncomment to 'continue':                      #
#----------------------------------------------------------------------#
    if [[ $PULSE_TEST -eq 1 ]]; then
        pulse ; sleep 1
        pulse ; sleep 1
        pulse ; sleep 1
        pulse ; sleep 1
        pulse ; sleep 1
        sleep 44
        continue
    fi

#----------------------------------------------------------------------#
# occasionally, i will see a time repeated annoyingly.                 #
# i have not yet worked out a solution; although a PREV_TIME != NOW    #
# solution would probably work, sleeping for 10 seconds per.           #
#----------------------------------------------------------------------#
    while [[ $sleep_for -gt 10 ]]; do
        (( sleep_for -= 10 ))
        sleep 10
        pulse
    done
    sleep $sleep_for
done

