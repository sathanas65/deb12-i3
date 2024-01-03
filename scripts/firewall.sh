#!/bin/bash

# Get Firewall status
status_output=$(sudo ufw status 2>&1)
# Check if the output contains "you are not logged in"
if [[ $status_output == *"Status: active"* ]]; then
  sudo ufw disable
  status_output=$(sudo ufw status 2>&1)
  if [[ $status_output == *"Firewall stopped"* ]]; then
	  notify-send --urgency=critical "UFW WARNING:
	  YOUR FIREWALL IS DISABLED!
	  YOUR NETWORK PORTS ARE ALL OPEN!"
  else
    notify-send --urgency=critical "UFW TOGGLE ERROR!"
  fi
	
if [[ $status_output == *"Status: inactive"* ]]; then
  sudo ufw enable
	$status_output=$(sudo ufw status 2>&1) 
  if [[ $status_output == *"Status: active"* ]]; then
	  notify-send "UFW:" "$status_output"   
  else
    notify-send --urgency=critical "UFW TOGGLE ERROR!"
  fi

else
    notify-send --urgency=critical "UFW STATUS ERROR!"
fi


