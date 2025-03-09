#!/bin/bash

# define an array of phrases
PHRASES=("ITS A HALT" "I am your mother" "I find find")

# randomly select a phrase
RANDOM_INDEX=$(( RANDOM % ${#PHRASES[@]} ))
SELECTED_PHRASE=${PHRASES[$RANDOM_INDEX]}

# print the messages with figlet
figlet -w 200 -f starwars "$SELECTED_PHRASE"
