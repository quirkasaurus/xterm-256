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
# how to type the characters:                                          #
#                                                                      #
# - a sa sa - s s                                                      #
#   8 8  )                                                             #
# . • °  º  o O @                                                      #
# L M H  H  L M M                                                      #
#                                                                      #
#----------------------------------------------------------------------#

. more_funx $0
. yaps1

declare -a numbers

CLEAR=
DEBUG=1 ; CLEAR=clear
DEBUG=  ; CLEAR=clear

function set_lines_gothic
{
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
#----------------------------------------------------------------------#
#             "     .•o@@OOo•° °•Oo•.      " \               #
#             " •o@@@@@@OOo••....••oO@Oo•  " \             #
#----------------------------------------------------------------------#
        lines=(
            "           ..•••.           " \
            "        .•oO@@@@Oo•.        " \
            "     .•o@@OOo•°°°•Oo•.      " \
            "   .•o@@@Oo•°     °•Oo•.    " \
            "  •o@@@@Oo•°       °•Oo•.   " \
            " •o@@@@@Oo•         ••Oo•.  " \
            " •o@@@@@Oo•         .•oOo•. " \
            " •o@@@@@@Oo.        .•oOo•. " \
            " •o@@@@@@OOo°•....•°oO@Oo•  " \
            "  •O@@@@@@OOOOOOOOOO@@OOº°  " \
            "   °O@@@@@@@@OOOO@@@OOOº°   " \
            "    °O@@@@@@@@@@@@@OOº°     " \
            "      °ººO@@@@@@OOºº°       " \
            "" \
            )
        lines=(
            " ¸         ¸.....¸        " \
            " ¸°•.¸¸¸.•ooOººººoo.      " \
            "  °•.¸•o@OOº   || ºO.     " \
            "   ¸•o@@@Oº    ||  ºO¸    " \
            "  .o@@@@Oº     ||   ºO.   " \
            " •o@@@@Oº   ∆  ||....OO.  " \
            " •o@@@@OO  <+> ||°°°°OO•  " \
            " •o@@@@Oo   V  ||   .OO   " \
            " •o@@@@Oo.     ||   .OO   " \
            "  •O@@@@Oo.    ||  .OOº   " \
            "   °O@@@@Oo.   ||oOOOº°   " \
            "    °O@@@@@@@@@@@@OOº°    " \
            "      °ººO@@@@@@OOºº°     " \
            "" \
            )
        width=26
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
        lines=(
            "       .°O.      " \
            "      .•O@•      " \
            "    .•oO@@•      " \
            "  .•ooO@@@•      " \
            "     °•o@0.      " \
            "     °•o@•       " \
            "     °•@o•       " \
            "     °•@o•       " \
            "     °•@o•       " \
            "     °•o@•       " \
            "     °•o@o•      " \
            "    .•oOO@o•.    " \
            " .•ooOOOOo@@o•.. " \
            "                 " \
            )
        lines=(
            "         :       " \
            "       .°O•      " \
            "      .•O@•      " \
            "    .•oO@@•      " \
            "  .•ooO@@@•      " \
            "     °•o@º°      " \
            "     °•o@•       " \
            "     °•@o•       " \
            "     °•@o•       " \
            "     °•o@•       " \
            "     °•o@•       " \
            "     °•o@o•      " \
            "    .•oOO@o•.    " \
            " .•ooOOOOo@@o•.. " \
            )
        lines=(
            "         :       " \
            "        ¸O       " \
            "      ¸•O@•      " \
            "    ¸•oO@@•      " \
            "  .•oOO@@@•      " \
            "     °:O@º°      " \
            "     °:O@•       " \
            "     °:@O•       " \
            "     .:@O•       " \
            "     .:O@•       " \
            "     .:O@•       " \
            "     .:O@o•      " \
            "    ¸•oOO@o•¸    " \
            " .•ooOOOOo@@o•.¸ " \
            )
        lines=(
            "         :       " \
            "        ¸O       " \
            "      ¸•O@ •     " \
            "    ¸•oO@@ •     " \
            "  .•oOO@@@ •     " \
            "     °:|Hº °     " \
            "     °:|Hº •     " \
            "     °:|Hº •     " \
            "     .:|Hº •     " \
            "     .:|Hº •     " \
            "     .:|Hº •     " \
            "     .:|Ho •     " \
            "    ¸•:|H@o•¸    " \
            " .•ooOOOOo@@o•.¸ " \
            )
        width=17
        ;;

    (2)
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
#----------------------------------------------------------------------#
#             " °•ooOO@Oo,,¸¸¸¸¸,oOOO•   " \                 #
#----------------------------------------------------------------------#
        lines=(
            "      .•oOO@@@@@o•.       " \
            "    .•oOOºº°°°ºO@@@o•.    " \
            "   .oOº°        °O@@@o•   " \
            "  •oOº           •O@@OO•  " \
            "   oº           .oOO@@O•  " \
            "   °           .•oO@@Oº   " \
            "            ¸,ooO@@Oº°    " \
            "       .•ooO@OOºº°°       " \
            "     .•oO@Oºº°            " \
            "   .•oO@Oº                " \
            "  .•oO@O°             •   " \
            " ••ooOOo.           .O•   " \
            " °•ooOO@Oo..¸¸¸¸..oOOO•   " \
            "  °ºoOOO@@O@@@@OOO@@@º°   " \
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
        lines=(
            "       ¸.....¸          " \
            "    .•oOO@@@Ooo.        " \
            "   oOOººººoO@@@Oo.      " \
            "  Oº      °•oO@@@O.     " \
            " °         .•oO@@@O•    " \
            "           .•oO@@O•°    " \
            "         .•oO@@@o••     " \
            "     ••oOOOO@@@@@@Oo.   " \
            "         °°ºOO@@@@@OO.  " \
            "            °OO@@@@@Oo. " \
            " .          .OO@@@@@OO: " \
            " °Oo•.¸¸¸¸.ooO@@@@@OOO° " \
            "  °ºOOOOOOOO@@@@@@OOº°  " \
            "    °ººOOO@@@@@OOºº°    " \
            )
        lines=(
            "       ¸..¸          " \
            "    .•oO@@Ooo.       " \
            "   oOOººººOO@Oo.     " \
            "  Oº       °OO@O.    " \
            " °          •OO@O•   " \
            "            .oO@O•   " \
            "         .•oO@@o•    " \
            "     ••oOOOO@@@Oo.   " \
            "          °°ºOO@OO.  " \
            "             °OO@Oo. " \
            " .           .OO@OO: " \
            " °Oo•.¸¸¸¸¸.ooO@OOO° " \
            "  °ºOOOOOOOOO@@OOº°  " \
            "    °ººOOO@@OOºº°    " \
            )
        width=21
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
        lines=(
            "               ¸oO      " \
            "              •o@O°     " \
            "             •O@@O°     " \
            "           ¸•O@O@O°     " \
            "         ¸•oO@O°@O      " \
            "       ¸•oO@Oº°:@O      " \
            "     ¸•oOO@Oº •:@O•     " \
            "   ¸•ooO@Oº   .:oOo.¸¸. " \
            " .•ooOOO@@@@@OOOOOOOOO: " \
            "              °:OOo°    " \
            "              •:@Oo•    " \
            "              •:@Oo•    " \
            "            ¸.oO@@Oo•   " \
            "         ¸.:oOO@@@Ooo•. " \
            )
        lines=(
            "                ¸O:     " \
            "               ¸oO:     " \
            "              .O@O;°    " \
            "            ¸o@O@O:•    " \
            "          ¸oO@º:@O:•    " \
            "        ¸oO@O° :@O:.    " \
            "      ¸oOO@O°  :@O:.    " \
            "    ¸ooO@Oº   .;@O;.¸¸. " \
            "  .ooOOO@@@@@OOO@OOOO@º " \
            "              °:@O:°    " \
            "              •;@O:•    " \
            "              •:@O:•    " \
            "            ¸.oO@@Oo•   " \
            "         ¸.:oOO@@@Ooo•. " \
            )
        lines=(
            "                .0¸     " \
            "               .OO:     " \
            "              .O@O;°    " \
            "            ¸o@O@O:•    " \
            "          ¸oO@º:@O:•    " \
            "        ¸oO@O° :@O:.    " \
            "      .oOO@O°  :@O:.    " \
            "    .oOO@Oº    ;@O;.¸¸. " \
            " .oOOOOO@@@@@OOO@OOOO@º " \
            "              °:@O:°    " \
            "              •;@O:•    " \
            "              •:@O:•    " \
            "            ¸.oO@@Oo.   " \
            "         ¸.:oOO@@@Ooo•. " \
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
        lines=(
            "  °•@@OOoooooooooooO@•°  " \
            "  °•oooOOO@@@@@@@OOOo•   " \
            "   °:O@º°          °º•   " \
            "   •OO@o.            °   " \
            "   °ºOO@@@OOooo.         " \
            "      °ºººOOOO@@@o•.     " \
            "              °ºO@@Oo.   " \
            "    .o.         ºO@@Oo•  " \
            "  .oOO•         •oO@@@o• " \
            " •oO°           •oO@@@o• " \
            " :O(           ¸oO@@@Oº° " \
            " °OOo•.¸¸¸¸..•oO@@@@Oº°  " \
            "  °ºOOOoooo@@@@@@OOº°    " \
            "    °ººOOO@@@OOºº°       " \
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
    (6)
        lines=(
            "           ¸...¸        " \
            "        .oO@@@@Oo.      " \
            "     .o@@@0º°°°°º0o     " \
            "   .o0@@O°              " \
            "  .o0@@o                " \
            " .O0@@0•    ¸....¸      " \
            " o0@@@0•¸¸o0@@@@@0Oo.   " \
            " O0@#@@0@@@º°°°°°ºO0Oo¸ " \
            " 0@@##@00°        °O0O• " \
            " º0@#@@00.        .O0O° " \
            " °00@@@@OOo.¸¸¸¸.oO0O°  " \
            "  °OO0@@@@@@@@@@@00º°   " \
            "    °ººO0@@@@@@0ºº°     " \
            "                        " \
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
        lines=(
            " @O*º°°°°°°°°°°º*O@@º° " \
            " *º°           .O@*°   " \
            " °           .o@°      " \
            "           .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O               " \
            "  .o@@@Oo.             " \
            "    º@O°               " \
            "     °)                " \
            "      °                " \
            )
        width=23
        lines=(
            " @o.¸¸¸¸¸¸¸¸¸¸¸..oO@@@ " \
            " OOOºººº***ºº****O@@*° " \
            " Oº            .O@º°   " \
            " º           .o@°      " \
            " °         .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O¸              " \
            "  .o@@@Oo.             " \
            "    º@Oº               " \
            "     °(                " \
            )
        lines=(
            " oOOOOO@@@@@@@@OOO@@Oo " \
            " OOOºººº***ºº****O@@O° " \
            " Oº            .O@º°   " \
            " º           .o@°      " \
            "           .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O¸              " \
            "  .o@@@Oo.             " \
            "  .O@@@OOo.            " \
            "   ºO@@@OOº            " \
            )
        width=23
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
        lines=(
            "         ¸....¸          " \
            "       •oO@@OOOo•.       " \
            "     •oO@@OOº°°ºOO•.     " \
            "    •oO@@Oº     °OO•.    " \
            "   °oO@@Oo•      •OO•    " \
            "   °•oO@@Oo.¸  ¸.oOO°    " \
            "     ••oO@@OOOOOOO•      " \
            "   .oOO@@@@@@@@@@@Oo.    " \
            " .oOO@@@@OOº°°°°°ºO@Oo   " \
            " oOO@@@OOo•       •O@O•  " \
            " oOO@@@@Oo.¸     ¸.O@O•  " \
            " °ºOO@@@@@OOooooO@@OO°   " \
            "  °ºOO@@@@@@@@@@@OOº°    " \
            "    °ººOO@@@@@@Oºº       " \
            )
        lines=(
            "          ¸¸¸¸¸          " \
            "       •oO@@OOOOo.       " \
            "     •oO@@OOº°°ºOOo.     " \
            "    •oO@@Oº     °OOo.    " \
            "   °oO@@Oo•      •OO•    " \
            "   °•OO@@Oo.¸  ¸.oOº     " \
            "     ••oO@@OOOOOOO•      " \
            "   .oOO@@@@@@@@@@@Oo.    " \
            " .oOO@@@@OOº°°°°°ºO@Oo   " \
            " oOO@@@OOo•       •O@O•  " \
            " oOO@@@@Oo.¸     ¸.O@O•  " \
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

return
}



function set_lines_oOo
{
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
            "           ¸.....¸          " \
            "        .•ooO@@@Ooo.        " \
            "     ¸•o@@OOOº°°°ºOo°.      " \
            "   ¸•o@@@OOº       ºOo•¸    " \
            "  .o@@@@OO°         ºOo•.   " \
            " •o@@@@@OO•          ºOo•.  " \
            " •o@@@@@OO•          •OOo•. " \
            " •o@@@@@@Oo.        .oOOo•. " \
            " •o@@@@@@OOo°.¸¸¸.•°oO@Oo•  " \
            "  •O@@@@@@OOOOOOOOOO@@OOº°  " \
            "   °O@@@@@@@@OOOO@@@OOOº°   " \
            "    °O@@@@@@@@@@@@@OOº°     " \
            "      °ººO@@@@@@OOºº°       " \
            "" \
            )
        lines=(
            "                           " \
            "        .•ooO@@@Oo.¸       " \
            "     ¸•o@@OOOº°°°ºOo.      " \
            "    •o@@@OOº       ºOo¸    " \
            "   o@@@@OO°         ºOo.   " \
            "  .O@@@@OO           ºOo.  " \
            "  o@@@@@OO            OOo  " \
            " •o@@@@@OO.          .OOo. " \
            " •o@@@@@@Oo¸        .oOOo. " \
            "  o@@@@@@OOoo.¸¸¸.•ooO@Oo• " \
            "  °O@@@@@@OOOOOOOOOO@@OOº  " \
            "   °O@@@@@@@@OOOO@@@OOOº   " \
            "    °O@@@@@@@@@@@@@OOº°    " \
            "      °ººO@@@@@@OOºº°      " \
            )
        lines=(
            "                           " \
            "         .ooO@@Ooo¸        " \
            "      .o@@OOOº°°°ºOo.      " \
            "    ¸o@@@OO°       ºOo¸    " \
            "   .O@@@OO°         °Oo.   " \
            "  ¸O@@@@OO           °Oo.  " \
            "  oO@@@OOo            OOo  " \
            " •OO@@@OOO¸          ¸OOo. " \
            " •oO@@@@OOo¸        ¸oOOo. " \
            "  oO@@@@@OOOo.¸¸¸¸.oOO@Oo• " \
            "  °OO@@@@@OOOOOOOOOO@@OOº  " \
            "   °OO@@@@@@OOOOO@@@OOOº   " \
            "    °OO@@@@@@@@@@@@OOº°    " \
            "      °ººOO@@@@@OOºº°      " \
            )
        width=27
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
        lines=(
            "       .°O.      " \
            "      .•O@•      " \
            "    .•oO@@•      " \
            "  .•ooO@@@•      " \
            "     °•o@0.      " \
            "     °•o@•       " \
            "     °•@o•       " \
            "     °•@o•       " \
            "     °•@o•       " \
            "     °•o@•       " \
            "     °•o@o•      " \
            "    .•oOO@o•.    " \
            " .•ooOOOOo@@o•.. " \
            "                 " \
            )
        lines=(
            "         :       " \
            "       .°O•      " \
            "      .•O@•      " \
            "    .•oO@@•      " \
            "  .•ooO@@@•      " \
            "     °•o@º°      " \
            "     °•o@•       " \
            "     °•@o•       " \
            "     °•@o•       " \
            "     °•o@•       " \
            "     °•o@•       " \
            "     °•o@o•      " \
            "    .•oOO@o•.    " \
            " .•ooOOOOo@@o•.. " \
            )
        lines=(
            "      ¸@    " \
            "    ¸oO@•   " \
            "  ¸ooO@@@   " \
            "  OOO@@@º   " \
            "  °ºOO@@°   " \
            "   °O@@O    " \
            "   •O@@O    " \
            "   •OO@@    " \
            "   .OO@@•   " \
            "   .O@@@•   " \
            "  ¸oOO@@o¸  " \
            "  oOOOO@@o  " \
            "  oO@@@O@o  " \
            "  ºOOO@@º°  " \
            )
        lines=(
            "      ¸oO   " \
            "    ¸oO@O   " \
            "   ¸oO@@o   " \
            "   oO@@Oº   " \
            "   °ºO@O    " \
            "    °O@O    " \
            "    °o@O    " \
            "    •o@O    " \
            "    •o@O    " \
            "    .O@O    " \
            "    .O@O    " \
            "   ¸oO@Oo   " \
            "  .oOO@@OO  " \
            "  °ºOOOOOº  " \
            )
        width=12
        ;;

    (2)
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
        lines=(
            "      ¸.oO@@@@@o.¸      " \
            "    .oOOº°°°°ºO@@@o.    " \
            "  ¸oO@(        ºO@@@o¸  " \
            "  oO@@Oo.       OO@@Oo  " \
            "  O@@@OOO      ¸OOO@@O• " \
            "  °ººººº°     .oOO@@OO  " \
            "           ¸.oOO@@OOº°  " \
            "       ¸.oO@OOºº°°      " \
            "     .oO@Oºº°           " \
            "   .oO@Oº°              " \
            "  .oO@O°                " \
            " •oO@Oo.¸       ¸.oOO¸  " \
            " •oOO@@OOOoooooOOOOOO•  " \
            "  °ºOOOO@@O@@@@OO@@@º°  " \
            )
        width=24
        ;;

    (3)
        lines=(
            "       ¸.....¸          " \
            "    .•oOO@@@Ooo.        " \
            "   oOOººººoO@@@Oo.      " \
            "  Oº      °•oO@@@O.     " \
            " °         .•oO@@@O•    " \
            "           .•oO@@O•°    " \
            "         .•oO@@@o••     " \
            "     ••oOOOO@@@@@@Oo.   " \
            "         °°ºOO@@@@@OO.  " \
            "            °OO@@@@@Oo. " \
            " .          .OO@@@@@OO: " \
            " °Oo•.¸¸¸¸.ooO@@@@@OOO° " \
            "  °ºOOOOOOOO@@@@@@OOº°  " \
            "    °ººOOO@@@@@OOºº°    " \
            )
        lines=(
            "    ¸.oOOOO@OOo.¸    " \
            "   oOOOººººOOO@OO.   " \
            "  O@@o      ºOOO@O.  " \
            "  O@@O.      OOO@O•  " \
            "   °ºº°    ¸oOO@O•   " \
            "         .ooO@@o•    " \
            "        OOOO@@@Oo.   " \
            "          °°ºOO@OO.  " \
            "             °OO@Oo  " \
            "              •O@OO. " \
            "  ¸o@@o¸     ¸OO@OO• " \
            "  OO@OOo¸¸¸.ooO@@OO  " \
            "  °ºOOOOOOOOO@@OOº°  " \
            "    °ººOOO@@OOºº°    " \
            )
        lines=(
            "     ¸.oOOO@OOo.        " \
            "   .OOO*º°°°º*O@Oo.     " \
            "   @@º        °O@Oo.    " \
            "  °@°         ¸O@OO°    " \
            "   °         ¸o@Oº°     " \
            "           ¸o@@Oº       " \
            "         •oO@@@Oo.      " \
            "           °ººO@OOOo.   " \
            "               °OO@OO.  " \
            "  ¸            .OO@OOO  " \
            "  @o¸        ¸.oO@@OOº  " \
            "  :@@OooooooOOO@@@OOº   " \
            "  °ºOOOOOOOOO@@OOOº°    " \
            "    °ººOOO@@OOºº°       " \
            )
        lines=(
            "       ¸.....¸        " \
            "    .•oOO@@@Ooo.      " \
            "   oOOººººOO@@@Oo.    " \
            "  Oº       °OO@@@O.   " \
            " °          °OO@@@O   " \
            "            ¸OO@@Oº   " \
            "         ¸.oO@@@O•    " \
            "     ••oOOOO@@@@Oo.   " \
            "         °°ºOO@@@OO.  " \
            "            °O@@@@OO¸ " \
            " .          ¸OO@@@OO: " \
            " °@o•.¸¸¸¸.oOO@@@OOO° " \
            "  °º@@OOOOOO@@@@OOº°  " \
            "    °ººOOO@@@OOºº°    " \
            )
        width=22
        ;;

    (4)
        lines=(
            "                ¸o:     " \
            "               ¸oO:     " \
            "              .O@O;°    " \
            "            ¸o@O@O:•    " \
            "          ¸oO@º:@O:•    " \
            "        ¸oO@O° :@O:.    " \
            "      ¸oOO@O°  :@O:.    " \
            "    ¸ooO@Oº   .;@O;.¸¸. " \
            "  .ooOOO@@@@@OOO@OOOO@º " \
            "              °:@O:°    " \
            "              •;@O:•    " \
            "              •:@O:•    " \
            "            ¸.oO@@Oo•   " \
            "         ¸.:oOO@@@Ooo•. " \
            )
        lines=(
            "                .o:    " \
            "               .OO:    " \
            "              .O@O;    " \
            "            ¸o@O@O:    " \
            "          ¸oO@º:@O:    " \
            "        ¸oO@O° :@O:    " \
            "      .oOO@O°  :@O:    " \
            "    .oOO@Oº    ;@O;... " \
            " .oOOOOO@@@@@OOO@OOOOO " \
            "               :@O:    " \
            "               ;@O:    " \
            "               :@O:    " \
            "             .oO@@Oo.  " \
            "           .oOO@@@Ooo. " \
            )
        lines=(
            "                .O:    " \
            "               .OO:    " \
            "              .O@O;    " \
            "            ¸o@O@O:    " \
            "          ¸oO@º:@O:    " \
            "        ¸oO@O° :@O:    " \
            "      .oOO@O°  :@O:    " \
            "    .oOO@Oº    ;@O;... " \
            " .oOOOOO@@@@@OOO@OOOOO " \
            "               :@O:    " \
            "               ;@O:    " \
            "               :@O:    " \
            "             .oO@@Oo.  " \
            "           .oOO@@@Ooo. " \
            )
        lines=(
            "                .O@     " \
            "               .O@@     " \
            "              .O@O@     " \
            "            ¸o@O@O@     " \
            "          ¸oO@º:@O@     " \
            "        ¸oO@O° :@O@     " \
            "      .oOO@O°  :@O@     " \
            "    .oOO@Oº    ;@O@...  " \
            " .oOOOOO@@@@@OOO@OOOOO  " \
            "               :@O@     " \
            "               ;@O@     " \
            "               :@O@     " \
            "             .oO@@@Oo.  " \
            "           .oOO@@@@Ooo. " \
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
        lines=(
            "  °•@@OOoooooooooooO@•°  " \
            "  °•oooOOO@@@@@@@OOOo•   " \
            "   °:O@º°          °º•   " \
            "   •OO@o.            °   " \
            "   °ºOO@@@OOooo.         " \
            "      °ºººOOOO@@@o•.     " \
            "              °ºO@@Oo.   " \
            "    .o.         ºO@@Oo•  " \
            "  .oOº          •oO@@@o• " \
            " .oO°           •oO@@@o• " \
            " :O(           ¸oO@@@Oº° " \
            " °OOo•.¸¸¸¸¸.•oO@@@@Oº°  " \
            "  °ºOOOoooo@@@@@@OOº°    " \
            "    °ººOOO@@@OOºº°       " \
            )
        lines=(
            "    o@OOoooooooooooO@o   " \
            "    OO@OOººººººººOOOOO   " \
            "    :O@º         ºO@Oº   " \
            "    OO@o                 " \
            "    ºOO@@@OOooo.         " \
            "      °ºººOOOO@@@o•.     " \
            "              °ºO@@Oo.   " \
            "    .o.         ºO@@Oo•  " \
            "  .oOº          •oO@@@o• " \
            " .oO°           •oO@@@o• " \
            " :O(           ¸oO@@@Oº° " \
            " °OOo•.¸¸¸¸¸.•oO@@@@Oº°  " \
            "  °ºOOOoooo@@@@@@OOº°    " \
            "    °ººOOO@@@OOºº°       " \
            )
        lines=(
            "    o@OOoooooooooooO@o   " \
            "    @@@OOººº****ºOOOOO   " \
            "    OO@          ºO@Oº   " \
            "    @O@.                 " \
            "    ºO@@Oo.¸             " \
            "      °ºººº@@@@Ooo.¸     " \
            "              °ºO@@Oo¸   " \
            "    .o.         ºO@@Oo•  " \
            "  .oOº          •oO@@@o• " \
            " .oO°           •oO@@@o• " \
            " :O(           ¸oO@@@Oº° " \
            " °OOo•.¸¸¸¸¸.•oO@@@@Oº°  " \
            "  °ºOOOoooo@@@@@@OOº°    " \
            "    °ººOOO@@@OOºº°       " \
            )
        lines=(
            "    oO@OooooooooooO@Oo   " \
            "    @@@O****ºººººOOOOO   " \
            "    OO@          ºO@Oº   " \
            "    O@@.                 " \
            "    °ºO@o.¸              " \
            "      °ºO@@Ooo.¸         " \
            "         °ºOO@@@Oo.¸     " \
            "    .o)      °ºOO@OOo.   " \
            "  .o@º          ºOO@@@o  " \
            " .O@°           •OO@@@O• " \
            " (@(           ¸oO@@@Oº° " \
            " °O@o.       .oO@@@@Oº°  " \
            "  °ºO@Ooooo@@@@@@OOº°    " \
            "    °ººOOO@@@OOºº°       " \
            )
        lines=(
            "    oO@OooooooooooO@Oo   " \
            "    @@@O****ºººººººO@O   " \
            "    OO@             º@   " \
            "    O@@.                 " \
            "    °ºO@o.¸              " \
            "      °ºO@@Ooo.¸         " \
            "         °ºOO@@@Oo.¸     " \
            "    .o)      °ºOO@@Oo.   " \
            "  .o@º          ºOO@@@o  " \
            " .O@°           •OO@@@O• " \
            " (@(           ¸oO@@@OO° " \
            " °O@o.       .oO@@@@OO°  " \
            "  °ºO@Ooooo@@@@@@OOº°    " \
            "    °ººOOO@@@OOºº°       " \
            )
        width=25
        ;;
    (6)
        lines=(
            "           ¸...¸        " \
            "        .oO@@@@Oo.      " \
            "     .o@@@0º°°°°º0o     " \
            "   .o0@@O°              " \
            "  .o0@@o                " \
            " .O0@@0•    ¸....¸      " \
            " o0@@@0•..o0@@@@@0Oo.   " \
            " O0@#@@0@@Oº°°°°°ºO0Oo¸ " \
            " 0@@##@00°        °O0O• " \
            " º0@#@@00.        .O0O° " \
            " °00@@@@OOo.¸¸¸¸.oO0O°  " \
            "  °OO0@@@@@@@@@@@00º°   " \
            "    °ººO0@@@@@@0ºº°     " \
            "                        " \
            )
        lines=(
            "           ¸...¸        " \
            "        .oO@@@@Oo.      " \
            "     .o@@@0º°°°°º0o     " \
            "   .o0@@O°      oOOO.   " \
            "  .o0@@o        ºO@Oº   " \
            " .o0@@O                 " \
            " oO0@@0•    ¸....¸      " \
            " o0@@@0•..o0@@@@@0Oo.   " \
            " O0@#@@0@@Oº°°°°°ºO0Oo¸ " \
            " 0@@##@00°        °O0O• " \
            " º0@#@@00.        .O0O° " \
            " °00@@@@OOo.¸¸¸¸.oO0O°  " \
            "  °OO0@@@@@@@@@@@00º°   " \
            "    °ººO0@@@@@@0ºº°     " \
            )
        lines=(
            "           ¸...¸        " \
            "        .oO@@@@Oo.      " \
            "     .o@@@0º°°°°º0o     " \
            "   .o0@@O°              " \
            "  .o0@@o                " \
            " .O0@@0•    ¸....¸      " \
            " o0@@@0•¸¸o0@@@@@0Oo.   " \
            " O0@#@@0@@@º°°°°°ºO0Oo¸ " \
            " 0@@##@00°        °O0O• " \
            " º0@#@@00.        .O0O° " \
            " °00@@@@OOo.¸¸¸¸.oO0O°  " \
            "  °OO0@@@@@@@@@@@00º°   " \
            "    °ººO0@@@@@@0ºº°     " \
            "                        " \
            )
        lines=(
            "           ¸...¸        " \
            "        .oO@@@@Oo.      " \
            "     .o@@@0º°°°°º0o     " \
            "   .o0@@O°              " \
            "  .o0@@o                " \
            " .O0@@0•    ¸....¸      " \
            " o0@@@0•¸¸o0@@@@@0Oo.   " \
            " O0@#@@0@@@º°°°°°ºO0Oo¸ " \
            " 0@@##@00°        °O0O• " \
            " º0@#@@00.        .O0O° " \
            " °00@@@@OOo.¸¸¸¸.oO0O°  " \
            "  °OO0@@@@@@@@@@@00º°   " \
            "    °ººO0@@@@@@0ºº°     " \
            "                        " \
            )
        width=24
    ;;

    (7)
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
        lines=(
            " @O*º°°°°°°°°°°º*O@@º° " \
            " *º°           .O@*°   " \
            " °           .o@°      " \
            "           .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O               " \
            "  .o@@@Oo.             " \
            "    º@O°               " \
            "     °)                " \
            "      °                " \
            )
        width=23
        lines=(
            " @Oo...¸¸¸¸¸¸..o*O@@º° " \
            " @O*º°°°°°°°°°°º*O@@º° " \
            " Oº°           .O@*°   " \
            " °           .o@°      " \
            "           .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O               " \
            "  .o@@@Oo.             " \
            "    º@O°               " \
            "     °{                " \
            )
        lines=(
            " @o.¸¸¸¸¸¸¸¸¸¸¸.oO@@*° " \
            " OOOºººº*****ºº**O@@º° " \
            " Oº            .O@*°   " \
            " º           .o@°      " \
            " °         .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O               " \
            "  .o@@@Oo.             " \
            "    º@O°               " \
            "     °{                " \
            )
        lines=(
            " @o.¸¸¸¸¸¸¸¸¸¸¸..oO@@@ " \
            " OOOºººº***ºº****O@@*° " \
            " Oº            .O@º°   " \
            " º           .o@°      " \
            " °         .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O¸              " \
            "  .o@@@Oo.             " \
            "    º@Oº               " \
            "     °(                " \
            )
        lines=(
            " oOOOOO@@@@@@@@OOO@@Oo " \
            " OOOºººº***ºº****O@@O° " \
            " Oº            .O@º°   " \
            " º           .o@°      " \
            "           .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O¸              " \
            "  .O@@@Oo.             " \
            "  .O@@@OOo.            " \
            "   ºO@@@OOº            " \
            )
        width=23
        ;;

    (8)
        lines=(
            "         ¸....¸          " \
            "       •oO@@OOOo•.       " \
            "     •oO@@OOº°°ºOO•.     " \
            "    •oO@@Oº     °OO•.    " \
            "   °oO@@Oo•      •OO•    " \
            "   °•oO@@Oo.¸  ¸.oOO°    " \
            "     ••oO@@OOOOOOO•      " \
            "   .oOO@@@@@@@@@@@Oo.    " \
            " .oOO@@@@OOº°°°°°ºO@Oo   " \
            " oOO@@@OOo•       •O@O•  " \
            " oOO@@@@Oo.¸     ¸.O@O•  " \
            " °ºOO@@@@@OOooooO@@OO°   " \
            "  °ºOO@@@@@@@@@@@OOº°    " \
            "    °ººOO@@@@@@Oºº       " \
            )
        lines=(
            "          ¸...¸         " \
            "       ¸oO@@OOOOo.      " \
            "     ¸oO@@OOº°°ºOOO.    " \
            "    ¸oO@@Oº     °OOO.   " \
            "    oO@@Oo        OO•   " \
            "    °OO@@Oo.¸  ¸.oOº    " \
            "      .oO@@OOOOOOO¸     " \
            "   .oOO@@@@@@@@@@@Oo¸   " \
            "  .OO@@@@OOº°°°°°ºO@Oo  " \
            "  OO@@@OOO°       °O@O• " \
            "  OO@@@@OO.       ¸O@O• " \
            "  ºOO@@@@@OOooooO@@OO°  " \
            "   ºOO@@@@@@@@@@@OOO°   " \
            "     ººOO@@@@@@OOº°     " \
            )
        width=24
        ;;

    (9)
        # alt-right-paren: ººººº
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
            "   .•o@OO****@@@@O•.    " \
            "  .o@@O°      °OO@Oo.   " \
            "  o@@O         oO@@@o.  " \
            " .o@@O        ¸oO@@@oo  " \
            " •o@@Oo.¸   ¸.oOOO@@Oo° " \
            "  °oO@@@@@@@@@@O@@@@OO• " \
            "    °ºOO@@@@OOººOO@@OO. " \
            "                OO@@Oo  " \
            "               ¸O@@OO°  " \
            "              ¸OO@@Oº   " \
            "             ¸OO@@Oº    " \
            "            ¸OO@@O°     " \
            "           .O@@Oº       " \
            )
        lines=(
            "      .oO@@@@Oo.¸       " \
            "    .o@OO****@@@@O.¸    " \
            "  ¸O@@O°      °OO@Oo¸   " \
            " .O@@O         oO@@@O.  " \
            " •O@@O        ¸oO@@@OO  " \
            " •O@@Oo.¸   ¸.oOOO@@OO° " \
            "  °OO@@@@@@@@@@O@@@@OO• " \
            "    °ºOO@@@@OOººOO@@OO. " \
            "                OO@@OO  " \
            "               ¸O@@OO°  " \
            "              ¸OO@@Oº   " \
            "             ¸OO@@Oº    " \
            "            ¸OO@@O°     " \
            "           .O@@Oº       " \
            )
        width=24
        ;;

    (:)
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

return
}



#----------------------------------------------------------------------#
# HANDS OFF!                                                           #
#----------------------------------------------------------------------#
function set_lines
{
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
            "           ..•••.           " \
            "        .•oO@@@@Oo•.        " \
            "     .•o@@OOo•°°°•Oo•.      " \
            "   .•o@@@Oo•°     °•Oo•.    " \
            "  •o@@@@Oo•°       °•Oo•.   " \
            " •o@@@@@Oo•         ••Oo•.  " \
            " •o@@@@@Oo•         .•oOo•. " \
            " •o@@@@@@Oo.        .•oOo•. " \
            " •o@@@@@@OOo°•....•°oO@Oo•  " \
            "  •O@@@@@@OOOOOOOOOO@@OOº°  " \
            "   °O@@@@@@@@OOOO@@@OOOº°   " \
            "    °O@@@@@@@@@@@@@OOº°     " \
            "      °ººO@@@@@@OOºº°       " \
            "" \
            )
        lines=(
            "           ¸.....¸          " \
            "        .•ooO@@@Ooo.        " \
            "     ¸•o@@OOOº°°°ºOo°.      " \
            "   ¸•o@@@OOº       ºOo•¸    " \
            "  .o@@@@OO°         ºOo•.   " \
            "  o@@@@@OO•          ºOo•.  " \
            " •o@@@@@OO•          •OOo•. " \
            " •o@@@@@@Oo.        .oOOo•. " \
            " •o@@@@@@OOo°.¸¸¸.•°oO@Oo•  " \
            "  •O@@@@@@OOOOOOOOOO@@OOº°  " \
            "   °O@@@@@@@@OOOO@@@OOOº°   " \
            "    °O@@@@@@@@@@@@@OOº°     " \
            "      °ººO@@@@@@OOºº°       " \
            "" \
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
        lines=(
            "       .°O.      " \
            "      .•O@•      " \
            "    .•oO@@•      " \
            "  .•ooO@@@•      " \
            "     °•o@0.      " \
            "     °•o@•       " \
            "     °•@o•       " \
            "     °•@o•       " \
            "     °•@o•       " \
            "     °•o@•       " \
            "     °•o@o•      " \
            "    .•oOO@o•.    " \
            " .•ooOOOOo@@o•.. " \
            "                 " \
            )
        lines=(
            "         :       " \
            "       .°O•      " \
            "      .•O@•      " \
            "    .•oO@@•      " \
            "  .•ooO@@@•      " \
            "     °•o@º°      " \
            "     °•o@•       " \
            "     °•@o•       " \
            "     °•@o•       " \
            "     °•o@•       " \
            "     °•o@•       " \
            "     °•o@o•      " \
            "    .•oOO@o•.    " \
            " .•ooOOOOo@@o•.. " \
            )
        lines=(
            "         :       " \
            "        ¸O       " \
            "      ¸•O@•      " \
            "    ¸•oO@@•      " \
            "  .•oOO@@@•      " \
            "     °:O@º°      " \
            "     °:O@•       " \
            "     °:@O•       " \
            "     .:@O•       " \
            "     .:O@•       " \
            "     .:O@•       " \
            "     .:O@o•      " \
            "    ¸•oOO@o•¸    " \
            " .•ooOOOOo@@o•.¸ " \
            )
        width=17
        ;;

    (2)
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
        lines=(
            "      .•oOO@@@@@o•.       " \
            "    .•oOOºº°°°ºO@@@o•.    " \
            "   .oOº°        °O@@@o•   " \
            "  •oOº           •O@@OO•  " \
            "   oº           .oOO@@O•  " \
            "   °           .•oO@@Oº   " \
            "            ¸,ooO@@Oº°    " \
            "       .•ooO@OOºº°°       " \
            "     .•oO@Oºº°            " \
            "   .•oO@Oº                " \
            "  .•oO@O°             •   " \
            " ••ooOOo.           .O•   " \
            " °•ooOO@Oo..¸¸¸¸..oOOO•   " \
            "  °ºoOOO@@O@@@@OOO@@@º°   " \
            )
        width=26
        ;;

    (3)
        lines=(
            "       ¸..¸          " \
            "    .•oO@@Ooo.       " \
            "   oOOººººOO@Oo.     " \
            "  Oº       °OO@O.    " \
            " °          •OO@O•   " \
            "            .oO@O•   " \
            "         .•oO@@o•    " \
            "     ••oOOOO@@@Oo.   " \
            "          °°ºOO@OO.  " \
            "             °OO@Oo. " \
            " .           .OO@OO: " \
            " °Oo•.¸¸¸¸¸.ooO@OOO° " \
            "  °ºOOOOOOOOO@@OOº°  " \
            "    °ººOOO@@OOºº°    " \
            )
        width=21
        lines=(
            "       ¸.....¸          " \
            "    .•oOO@@@Ooo.        " \
            "   oOOººººoO@@@Oo.      " \
            "  Oº      °•oO@@@O.     " \
            " °         .•oO@@@O•    " \
            "           .•oO@@O•°    " \
            "         .•oO@@@o••     " \
            "     ••oOOOO@@@@@@Oo.   " \
            "         °°ºOO@@@@@OO.  " \
            "            °OO@@@@@Oo. " \
            " .          .OO@@@@@OO: " \
            " °Oo•.¸¸¸¸.ooO@@@@@OOO° " \
            "  °ºOOOOOOOO@@@@@@OOº°  " \
            "    °ººOOO@@@@@OOºº°    " \
            )
        width=24
        ;;

    (4)
        lines=(
            "                ¸O:     " \
            "               ¸oO:     " \
            "              .O@O;°    " \
            "            ¸o@O@O:•    " \
            "          ¸oO@º:@O:•    " \
            "        ¸oO@O° :@O:.    " \
            "      ¸oOO@O°  :@O:.    " \
            "    ¸ooO@Oº   .;@O;.¸¸. " \
            "  .ooOOO@@@@@OOO@OOOO@º " \
            "              °:@O:°    " \
            "              •;@O:•    " \
            "              •:@O:•    " \
            "            ¸.oO@@Oo•   " \
            "         ¸.:oOO@@@Ooo•. " \
            )
        lines=(
            "                .0¸     " \
            "               .OO:     " \
            "              .O@O;°    " \
            "            ¸o@O@O:•    " \
            "          ¸oO@º:@O:•    " \
            "        ¸oO@O° :@O:.    " \
            "      .oOO@O°  :@O:.    " \
            "    .oOO@Oº    ;@O;.¸¸. " \
            " .oOOOOO@@@@@OOO@OOOO@º " \
            "              °:@O:°    " \
            "              •;@O:•    " \
            "              •:@O:•    " \
            "            ¸.oO@@Oo.   " \
            "         ¸.:oOO@@@Ooo•. " \
            )
        lines=(
            "                .0¸     " \
            "               .OO:     " \
            "              .O@O;°    " \
            "            ¸o@O@O:•    " \
            "          ¸oO@º:@O:•    " \
            "        ¸oO@O° :@O:.    " \
            "      .oOO@O°  :@O:.    " \
            "    .oOO@Oº    ;@O;.¸¸. " \
            " .oOOOOO@@@@@OOO@OOOO@º " \
            "              °:@O:°    " \
            "              •;@O:•    " \
            "              •:@O:•    " \
            "            ¸.oO@@Oo.   " \
            "         ¸.:oOO@@@Ooo•. " \
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
        lines=(
            "  °•@@OOoooooooooooO@•°  " \
            "  °•oooOOO@@@@@@@OOOo•   " \
            "   °:O@º°          °º•   " \
            "   •OO@o.            °   " \
            "   °ºOO@@@OOooo.         " \
            "      °ºººOOOO@@@o•.     " \
            "              °ºO@@Oo.   " \
            "    .o.         ºO@@Oo•  " \
            "  .oOº          •oO@@@o• " \
            " .oO°           •oO@@@o• " \
            " :O(           ¸oO@@@Oº° " \
            " °OOo•.¸¸¸¸¸.•oO@@@@Oº°  " \
            "  °ºOOOoooo@@@@@@OOº°    " \
            "    °ººOOO@@@OOºº°       " \
            )
        lines=(
            "   •@@OOoooooooooooO@•   " \
            "   •oooOOO@@@@@@@OOOo•   " \
            "    OO@º°          °º°   " \
            "   °OO@o.                " \
            "   °ºOO@@@OOooo.         " \
            "      °ºººOOOO@@@o•.     " \
            "              °ºO@@Oo.   " \
            "    .o.         ºO@@Oo•  " \
            "  .oOº          •oO@@@o• " \
            " .oO°           •oO@@@o• " \
            " :O(           ¸oO@@@Oº° " \
            " °OOo•.¸¸¸¸¸.•oO@@@@Oº°  " \
            "  °ºOOOoooo@@@@@@OOº°    " \
            "    °ººOOO@@@OOºº°       " \
            )
        width=25
        ;;
    (6)
        lines=(
            "           ¸...¸        " \
            "        .oO@@@@Oo.      " \
            "     .o@@@0º°°°°º0o     " \
            "   .o0@@O°              " \
            "  .o0@@o                " \
            " .O0@@0•    ¸....¸      " \
            " o0@@@0•..o0@@@@@0Oo.   " \
            " O0@#@@0@@Oº°°°°°ºO0Oo¸ " \
            " 0@@##@00°        °O0O• " \
            " º0@#@@00.        .O0O° " \
            " °00@@@@OOo.¸¸¸¸.oO0O°  " \
            "  °OO0@@@@@@@@@@@00º°   " \
            "    °ººO0@@@@@@0ºº°     " \
            "                        " \
            )
        width=24
    ;;

    (7)
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
        lines=(
            " @O*º°°°°°°°°°°º*O@@º° " \
            " *º°           .O@*°   " \
            " °           .o@°      " \
            "           .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O               " \
            "  .o@@@Oo.             " \
            "    º@O°               " \
            "     °)                " \
            "      °                " \
            )
        width=23
        lines=(
            " @Oo...¸¸¸¸¸¸..o*O@@º° " \
            " @O*º°°°°°°°°°°º*O@@º° " \
            " Oº°           .O@*°   " \
            " °           .o@°      " \
            "           .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O               " \
            "  .o@@@Oo.             " \
            "    º@O°               " \
            "     °{                " \
            )
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
        lines=(
            " @o.¸¸¸¸¸¸¸¸¸¸¸.oO@@*° " \
            " OOOºººº*****ºº**O@@º° " \
            " Oº            .O@*°   " \
            " º           .o@°      " \
            " °         .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O               " \
            "  .o@@@Oo.             " \
            "    º@O°               " \
            "     °{                " \
            )
        lines=(
            " @o.¸¸¸¸¸¸¸¸¸¸¸..oO@@@ " \
            " OOOºººº***ºº****O@@*° " \
            " Oº            .O@º°   " \
            " º           .o@°      " \
            " °         .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O¸              " \
            "  .o@@@Oo.             " \
            "    º@Oº               " \
            "     °(                " \
            )
        lines=(
            " oOOOOO@@@@@@@@OOO@@Oo " \
            " OOOºººº***ºº****O@@O° " \
            " Oº            .O@º°   " \
            " º           .o@°      " \
            "           .o@°        " \
            "         .o@°          " \
            "       ¸o@°            " \
            "      .o@°             " \
            "    ¸o@@°              " \
            "   ¸o@@O               " \
            "   o@@@O¸              " \
            "  .o@@@Oo.             " \
            "  .O@@@OOo.            " \
            "   ºO@@@OOº            " \
            )
        width=23
        ;;

    (8)
        lines=(
            "         ¸....¸          " \
            "       •oO@@OOOo•.       " \
            "     •oO@@OOº°°ºOO•.     " \
            "    •oO@@Oº     °OO•.    " \
            "   °oO@@Oo•      •OO•    " \
            "   °•oO@@Oo.¸  ¸.oOO°    " \
            "     ••oO@@OOOOOOO•      " \
            "   .oOO@@@@@@@@@@@Oo.    " \
            " .oOO@@@@OOº°°°°°ºO@Oo   " \
            " oOO@@@OOo•       •O@O•  " \
            " oOO@@@@Oo.¸     ¸.O@O•  " \
            " °ºOO@@@@@OOooooO@@OO°   " \
            "  °ºOO@@@@@@@@@@@OOº°    " \
            "    °ººOO@@@@@@Oºº       " \
            )
        lines=(
            "          ¸¸¸¸¸          " \
            "       •oO@@OOOOo.       " \
            "     •oO@@OOº°°ºOOo.     " \
            "    •oO@@Oº     °OOo.    " \
            "   °oO@@Oo•      •OO•    " \
            "   °•OO@@Oo.¸  ¸.oOº     " \
            "     ••oO@@OOOOOOO•      " \
            "   .oOO@@@@@@@@@@@Oo.    " \
            " .oOO@@@@OOº°°°°°ºO@Oo   " \
            " oOO@@@OOo•       •O@O•  " \
            " oOO@@@@Oo.¸     ¸.O@O•  " \
            " °ºOO@@@@@OOooooO@@OO°   " \
            "  °ºOO@@@@@@@@@@@OOº°    " \
            "    °ººOO@@@@@@Oºº       " \
            )
        width=24
        ;;

    (9)
        # alt-right-paren: ººººº
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

return
}



function tiktok
{
local tiktok=$1

local hours=${tiktok%:*}
local minutes=${tiktok#*:}
minutes=${minutes#0}


while : ; do
    $CLEAR
    centralizationalizer
    numbers=$( printf "%d:%02d" $hours $minutes )
    for number in $( echo $numbers | sed -e 's/./& /g' ); do
        set_lines_oOo
        render_character
    done
    tput cup 0 0
    sleep 3
    (( minutes += 1 ))
    if [[ $minutes -ge 60 ]]; then
        minutes=0
        (( hours += 1 ))
    fi

    if [[ $hours -gt 12 ]]; then
        hours=1
    fi
done
return
}


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

¸,.•° oO0º @*

Z,.88 oO00 28
S  AA  S A AS
C   S

@Oo•.•º°@Oo•.•º°@Oo•.•º°@Oo•.•º°@Oo•.•º°
@Oo•.•º°@Oo•.•º°@Oo•.•º°@Oo•.•º°@Oo•.•º°

@Oo.

.•º°

@@@@@@@
OOOOOOO
ooooooo
ººººººº
°°°°°°°
•••••••
.......

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
#----------------------------------------------------------------------#
# takes ~3 seconds to draw HH:MM                                       #
#----------------------------------------------------------------------#
seconds=$( date -v+3S +%S | sed -e 's/^0//' )
(( sleep_for = 60 - seconds ))

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
function render_printc
{
local _line="${@}"

if [[ $DARK_MODE -eq 1 ]]; then
#----------------------------------------------------------------------#
#     _line="${@//[.•°ºoO0:@#]/_}"                                     #
#----------------------------------------------------------------------#
    _line="${@//[^ ]/_}"
fi

#----------------------------------------------------------------------#
# echo draws things much faster                                        #
# i prefer slow. printc forks a new shell                              #
# which slows things down just enough to look nice.                    #
# however, we could always just source printc...                       #
# source-ing works fine for the short display                          #
#----------------------------------------------------------------------#
case $sleep_magic in
    (magic)
        echo -n "[38;5;${acidx[$_idx]}m${_line}[m"
        ;;
    (*)
        printc -n "${acidx[$_idx]}" "${_line}"
        ;;
esac
# echo -n "[7m[38;5;${acidx[$_idx]}m${_line}[m"
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
        tput cup 0 0 ; echo -n y=$y x=$x palette=$color_palette idx=$_idx pond=$pound_acidx
    fi
    tput cup $y $x
    render_printc "$line"
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
#----------------------------------------------------------------------#
#         numbers=( A B M P " " 1 2 3 4 5 : 6 7 8 9 0 . )              #
#         numbers=(                                                    #
#             $(                                                       #
#             for x in \                                               #
#                 " " : \                                              #
#                 A B M P \                                            #
#                 1 2 3 4 5 \                                          #
#                 6 7 8 9 0 . \                                        #
#                 ; do                                                 #
#                 echo $RANDOM $x                                      #
#             done | sort -rn | fields 2                               #
#             )                                                        #
#         )                                                            #
#----------------------------------------------------------------------#
        numbers=( 1 2 3 4 5 : 6 7 8 9 0 . )
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
    $SET_LINES_FUNC
#----------------------------------------------------------------------#
#     case $font in                                                    #
#         (original) set_lines ;; ## original                          #
#         (gothic) set_lines_gothic ;;                                 #
#         (oOo) set_lines_oOo ;;                                       #
#     esac                                                             #
#----------------------------------------------------------------------#
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
return
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
#----------------------------------------------------------------------#
# args parsing sanity check.                                           #
#----------------------------------------------------------------------#
# init                                                                 #
# for arg in "${@}" ; do                                               #
#     incr                                                             #
#     pouncy -in purple,lime "$num "                                   #
#     pouncy lime,purple " $arg "                                      #
#     continue                                                         #
# done                                                                 #
# exit                                                                 #
#----------------------------------------------------------------------#

for arg in "${@}" ; do

    case "$arg" in
        (-o|--oOo) font=oOo ; SET_LINES_FUNC=set_lines_oOo ;;
        (-O|--orig*) font=original ; SET_LINES_FUNC=set_lines ;;
        (-g|--gothic) font=gothic ; SET_LINES_FUNC=set_lines_gothic ;;

        (-v|--version) _version=1 ;;
        (-d|--dark*) DARK_MODE=1 ;;
        (--tiktok=*) tiktok=${arg#--tiktok=} ;;
        (*pulse) PULSE_TEST=1 ;;
        (-g|--glyphs) glyphs ; exit ;;
        (-d|--debug) DEBUG=1 ;;
        (-n|--no-sleep|--noSleep) start_sleep=0 ;;
        (random) yap_random_colors ;;
        (-l|--long) date_format='%I:%M:%S:%p' ; sleep_magic= ;;
        (-s|--short) sleep_magic=magic ; date_format='%I:%M' ;;
        (-h|--help)
            pouncy turquoise usage:
            pouncy -n lime "$zero "
            pouncy purple '[-s|--short|-l|--long]' '[clock-version] [color-palette]'
            pouncy -n lime "$zero "
            pouncy purple '[--acidx=42,46,206...]'
            pouncy -n lime "$zero "
            pouncy purple '[--dark] [--tiktok=99:99]'
            pouncy -n lime "$zero "
            pouncy purple '[--demo=HH:MM] [demo]'
            pouncy cyan "$zero defaults:"
            pouncy -n lime "short date format: "
            pouncy purple ${date_format}
            pouncy -n lime "render_char: "
            pouncy purple $render $color_palette
            print_sep '- '
            eval $color_palette
            yap_show_colors
            pouncy lime the --acidx option allows for customized color-palettes
            pouncy lime like so: --acidx=90,91,92,93,99,98,105,104,111,116,114,112
            pouncy lime '(for colors to indexes conversion, run: frogs)'
            pouncy cyan '[-o|--OO] (rounded font style)'
            pouncy cyan '[-g|--gothic] (gothic font style)'

#----------------------------------------------------------------------#
# now for the tricky business of displaying a dynamic list of palettes #
#----------------------------------------------------------------------#
            echo -n 'see color palettes? y/n '
            answer=$( quickread.exe )
            echo $answer
            case $answer in
                (n) echo ; echo quitting ; exit ;;
            esac
            print_sep '- '
            yap_palettes
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
            : # nop the palette
            palette=true
            ;;

        (once) run_once=True ;;
        (1|render_clock_1|render_1) render=render_clock_1 ;;
        (4|render_clock_4|render_4) render=render_clock_4 ;;

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
        (*)
        found_it=0
        grab_palettes
        for palette in ${palettes[*]}; do
            if [[ $arg == $palette ]]; then
                found_it=1
                eval $arg
                palette=$arg
                break
            fi
            if [[ yap_$arg == $palette ]]; then
                found_it=1
                eval yap_$arg
                palette=yap_$arg
                break
            fi
        done
        if [[ $found_it -eq 0 ]]; then
            echo unknown argument: $arg ; exit 9
        fi
        ;;
#----------------------------------------------------------------------#
# ===================                                                  #
# ===================                                                  #
#         (bloop)    bloop ;;                                          #
#         (blook)    blook ;;                                          #
#         (cream)    yap_cream ;;                                      #
#         (cream2)   yap_cream2 ;;                                     #
#                                                                      #
#         (pastels1) yap_pastels1 ;;                                   #
#         (pastels2) yap_pastels2 ;;                                   #
#         (pastels3) yap_pastels3 ;;                                   #
#         (pastels4) yap_pastels4 ;;                                   #
#                                                                      #
#         (roger)    roger ;; ##( Dean, that is.)                      #
#         (roger2)   roger2 ;; ##( Dean, that is.)                     #
#         (greens3)  yap_greens3 ;;                                    #
#         (greens)   yap_greens ;;                                     #
#         (purple*)  yap_purples ;;                                    #
#         (yellow*)  yap_yellow ;;                                     #
#         (blue*)    yap_blue ;;                                       #
#                                                                      #
#         (rainbow)                       yap_rainbow ;;               #
#         (rainbow_bright|bright_rainbow) yap_rainbow_bright ;;        #
#         (rainbow_spiral|spiral_rainbow) yap_spiral_rainbow ;;        #
#         (rainbow_full|full_rainbow)     yap_full_rainbow ;;          #
#         (barb) barb ;; # pinks and pinkish reds                      #
#         (yap*) eval $arg ;;                                          #
#----------------------------------------------------------------------#
    esac
done

#----------------------------------------------------------------------#
# only way to get all parameters set. :-P                              #
#----------------------------------------------------------------------#
if [[ -n $tiktok ]]; then
    tiktok $tiktok
    exit
fi

return
}


#----------------------------------------------------------------------#
# defaults.                                                            #
# MAIN                                                                 #
#----------------------------------------------------------------------#
title clocky.sh $*
sleep_for=7
sleep_magic=magic
date_format='%I:%M:%S:%p'
date_format='%I:%M'
PULSE_TEST=0
_version=0
render=render_clock_4
start_sleep=3
font=oOo
SET_LINES_FUNC=set_lines_oOo

#----------------------------------------------------------------------#
# yap_purples                                                          #
#----------------------------------------------------------------------#
# yap_greens
# barb
# roger
yap_gcw

set_args "${@}"

if [[ $DEMO -eq 1 ]]; then
    $CLEAR
    $render
    exit
fi

# if [[ -n $start_sleep ]]; then
#     echo
#     echo sleeping a bit. please maximize the screen.
#     echo
#     sleep ${start_sleep}
# fi

#----------------------------------------------------------------------#
# hesitate to give time to maximize the screen.                        #
#----------------------------------------------------------------------#
declare -a orig_acidx
orig_acidx=( $( echo ${acidx[*]} ) )

#----------------------------------------------------------------------#
# auto-refresh running clocky.sh                                       #
#----------------------------------------------------------------------#
FCLOCKY=$HOME/Dropbox/bin/clocky.sh
CLOCKYSUM=$( sum $FCLOCKY | fields 1 )

# vecho _version
# vecho CLOCKYSUM
# exit

$CLEAR
_print_sum=1
while : ; do

#----------------------------------------------------------------------#
# auto-refresh running clocky.sh                                       #
# utilizing hard-coding again.                                         #
#----------------------------------------------------------------------#
    NEW_CLOCKYSUM=$( sum $FCLOCKY | fields 1 )
    if [[ $CLOCKYSUM != $NEW_CLOCKYSUM || $_version -eq 1 ]]; then
        numbers=$( echo $NEW_CLOCKYSUM | sed -e 's/./& /g' )
        sling 42 43 44 45 46 47 48
        $CLEAR
        centralizationalizer
        for number in ${numbers}; do
            $SET_LINES_FUNC
            render_character
        done
        tput cup 0 0
        sleep 30
        exec $FCLOCKY $*
    fi

#----------------------------------------------------------------------#
# explicitly set color-palette                                         #
#----------------------------------------------------------------------#
    acidx=( $( echo ${orig_acidx[*]} ) )
    _yap_pound
    _idx=0

#----------------------------------------------------------------------#
# RENDER PRINT THE TIME!!                                              #
#----------------------------------------------------------------------#
    $CLEAR
    $render

#----------------------------------------------------------------------#
# kinda of like a typewriter carriage return;                          #
# print our 10 second dots below the time.                             #
#----------------------------------------------------------------------#
    init x $_x_init
    (( y = _y_init + 16 ))

#----------------------------------------------------------------------#
# put some dots out there at the start, if need be.                    #
# how to account for the 3 second head-start of the rendering.         #
#----------------------------------------------------------------------#
#     tens=$( date +%S | cut -c1 )                                     #
#     bnum=0                                                           #
#     while [[ $bnum -lt $tens ]]; do                                  #
#         pulse                                                        #
#         (( bnum += 1 ))                                              #
# must re-check the time because of how long                           #
# it takes to draw a pulse dot.                                        #
#         tens=$( date +%S | cut -c1 )                                 #
#         if [[ $tens -eq 0 ]]; then                                   #
#             break                                                    #
#         fi                                                           #
#     done                                                             #
#----------------------------------------------------------------------#

#----------------------------------------------------------------------#
# figure out how long we need to wait until we draw the time again.    #
#----------------------------------------------------------------------#
    case $sleep_magic in
        (magic) sleep_magic ;;
        (*) ;; # for --long format. we refresh every 7 seconds.
    esac

#----------------------------------------------------------------------#
# effort to parameterize the pulse dot colors aborted.                 #
# TOO MUCH GOING ON................ ABORT MISSION!                     #
# all the yaps1 functions rely on global fgs and _idx.                 #
# this also will not work with the way we grep for palettes in help.   #
# because of the default case syntax.                                  #
#----------------------------------------------------------------------#

#----------------------------------------------------------------------#
#     yap_burple                                                       #
#----------------------------------------------------------------------#
    yap_rainbow_bright

    (( _idx = RANDOM % pound_acidx ))

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


