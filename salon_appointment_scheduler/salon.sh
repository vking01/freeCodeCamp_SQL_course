#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ AFRO SALON ~~~~~\n"

SHOWING_SERVICES() {
  SERVICES_AVAILABLE=$($PSQL "SELECT * FROM services")
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo "$SERVICES_AVAILABLE" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
}

MAIN_MENU() {
  echo -e "Welcome to Afro Salon, how can I help you?\n"
  SHOWING_SERVICES
  until [[ $SERVICE_ID_SELECTED =~ ^[1-5]$ ]]
  do 
   SHOWING_SERVICES "I could not find that service. What would you like today?"
  done
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  # ask for phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  # check for customer name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if not exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  if [[ $INSERT_APPOINTMENT_RESULT = "INSERT 0 1" ]]
  then
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU