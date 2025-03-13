#!/bin/bash

# simple-interest.sh
# A simple script to calculate simple interest

# Display usage information
print_usage() {
  echo "Usage: $0 <principal> <rate> <time>"
  echo "  principal - The principal amount (in dollars)"
  echo "  rate      - The interest rate (in percentage)"
  echo "  time      - The time period (in years)"
  exit 1
}

# Check if correct number of arguments are provided
if [ $# -ne 3 ]; then
  print_usage
fi

# Assign arguments to variables
principal=$1
rate=$2
time=$3

# Validate inputs (check if they are numbers and positive)
if ! [[ $principal =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ $rate =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ $time =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: All inputs must be positive numbers"
  print_usage
fi

# Calculate simple interest
interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)
total=$(echo "scale=2; $principal + $interest" | bc)

# Display the result
echo "Principal Amount: \$$principal"
echo "Interest Rate: $rate%"
echo "Time Period: $time years"
echo "Simple Interest: \$$interest"
echo "Total Amount: \$$total"
