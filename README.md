#----------------------------------------------------------------------#
# color_stuff                                                          #
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# a bunch of unix scripts that do stuff with colors and characters.    #
#                                                                      #
# these scripts require an xterm-256 terminal.                         #
# i've tried to do whatever in both black and white backgrounds,       #
# but all scripts don't support that.                                  #
#                                                                      #
# i'll update things when i can.                                       #
#                                                                      #
# once you download one of these scripts,                              #
# just run it from within an xterm app window:                         #
#                                                                      #
# % bash ./clam1                                                       #
#                                                                      #
# or                                                                   #
#                                                                      #
# % chmod 755 clam1 ; PATH=${PATH%:}: ; clam1                          #
#                                                                      #
# or                                                                   #
#                                                                      #
# % chmod +x clam1 ; PATH=${PATH%:}: ; clam1                           #
#                                                                      #
# etc ... .. .                                                         #
#                                                                      #
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# in order to use the yaps scripts to change either your FG or BG      #
# colors, dependent upon dark or lightness of your terminal setting.   #
# % source yaps1                                                       #
#                                                                      #
# if you suddenly can't see anything, type:                            #
# % yap_toggle_ground                                                  #
#                                                                      #
# Next, to see what options are available:                             #
# % yap_show                                                           #
#                                                                      #
# They're pretty self-explanatory. To stop the color madness,          #
# % yap_off                                                            #
#                                                                      #
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# All functions:                                                       #
#                                                                      #
# yap_off -- turn off the coloration.                                  #
# yap_on -- turn on the coloration.                                    #
#                                                                      #
# yap_demo -- simple demo of how it looks. the pastel shades           #
#     are recommended for light backgrounds because                    #
#     its makes each command look like a post-it note                  #
#     of a different color.                                            #
#                                                                      #
# yap_toggle_ground -- switch from coloration of                       #
#     foreground to background and vice versa                          #
#                                                                      #
# yap_bright_rainbow -- good for dark backgrounds                      #
# yap_2_colors -- only 2 colors for old style printing paper effect    #
#                                                                      #
# yap_blues                                                            #
# yap_greens                                                           #
# yap_greens2                                                          #
# yap_greens_purple                                                    #
# yap_pastels1                                                         #
# yap_pastels2                                                         #
# yap_pastels3                                                         #
# yap_pastels4                                                         #
# yap_rainbow -- done in light pastel shades                           #
# yap_rainbow_bright                                                   #
# yap_show                                                             #
# yap_show_colors                                                      #
#                                                                      #
# yap_random -- select colors randomly from the list.                  #
# yap_sequential -- select colors sequentially from the list.          #
#                                                                      #
#----------------------------------------------------------------------#
