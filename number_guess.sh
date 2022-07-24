#!/bin/bash

# freeCodeCamp Lesson 14: Number Guessing Game Project

# Access to SQL queries
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate value to guess during game
RANDOM_NUMBER=$(( RANDOM % 1000 +1 ))
echo $RANDOM_NUMBER

# Ask for username
echo 'Enter your username:'
read USERNAME

# Try to get username from database
ENTERED_NAME_RESULT=$($PSQL "SELECT username FROM number_guess WHERE username='$USERNAME';")

# Take action if username was not in the database
if [[ -z $ENTERED_NAME_RESULT ]]
then 
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  NEW_PLAYER_RESULT=$($PSQL "INSERT INTO number_guess(username, games_played) VALUES('$USERNAME', 0);")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username='$USERNAME';")
  BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username='$USERNAME';")
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Functioinality for checking guesses against random number
echo -e '\nGuess the secret number between 1 and 1000:'
read GUESS

ATTEMPTS=1

CHECK_GUESS() {
  if [[ $GUESS =~ ^[0-9]+$ ]] 
  then 
    if [[ $GUESS -lt $RANDOM_NUMBER ]]
    then 
      echo -e "\nIt's higher than that, guess again:"
      ATTEMPTS=$((ATTEMPTS+1))
      read GUESS
      CHECK_GUESS
    elif [[ $GUESS -gt $RANDOM_NUMBER ]]
    then 
      echo -e "\nIt's lower than that, guess again:"
      ATTEMPTS=$((ATTEMPTS+1))
      read GUESS
      CHECK_GUESS
    fi
  else 
    echo -e '\nThat is not an integer, guess again:'
    read GUESS
    CHECK_GUESS
  fi
}
CHECK_GUESS

# Update username game stats
UPDATE_GAMES_RESULT=$($PSQL "UPDATE number_guess SET games_played=$((GAMES_PLAYED+1)) WHERE username='$USERNAME';")

if [[ $ATTEMPTS -lt $BEST_GAME || -z $BEST_GAME ]]
then 
  UPDATE_BEST_RESULT=$($PSQL "UPDATE number_guess SET best_game=$ATTEMPTS WHERE username='$USERNAME';")
fi

echo -e "\nYou guessed it in $ATTEMPTS tries. The secret number was $RANDOM_NUMBER. Nice job!"
