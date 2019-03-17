#----------------------------------------------------------------------#
# color_stuff                                                          #
#----------------------------------------------------------------------#
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
#----------------------------------------------------------------------#
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
# Other functions are just differently named color sets.               #
#----------------------------------------------------------------------#
