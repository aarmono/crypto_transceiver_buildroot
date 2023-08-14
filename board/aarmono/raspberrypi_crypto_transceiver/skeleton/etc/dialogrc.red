#
# Run-time configuration file for dialog
#
#
#
# Types of values:
#
# Number     -  <number>
# String     -  "string"
# Boolean    -  <ON|OFF>
# Attribute  -  (foreground,background,highlight?,underline?,reverse?)

# For radiolists and checklists, bind the asterisk key
# to the item select, for keypad compatability
bindkey radiolist \052 TOGGLE
bindkey checklist \052 TOGGLE

screen_color = (WHITE,RED,ON)
