#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  if [[ $YEAR != year ]]
  then
    # check for winner_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")

    # if not, add them
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_ID_IN_TEAMS_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_ID_IN_TEAMS_RESULT = "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $WINNER"
      fi
      # get new winner_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    fi

    # check for opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

    # if not, add them
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_ID_IN_TEAMS_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_WIINER_ID_IN_TEAMS_RESULT = "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $OPPONENT"
      fi
      # get new opponent_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    fi

    # add others data
      INSERT_DATA_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS)")
      if [[ $INSERT_DATA_RESULT = "INSERT 0 1" ]]
      then
        echo "Inserted into games, $WINNER vs $OPPONENT match"
      fi
  fi
done
