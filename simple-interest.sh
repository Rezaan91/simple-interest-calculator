
#!/usr/bin/env bash
# simple-interest.sh — compute simple interest (SI = P * R * T / 100)

read -p "Enter principal amount (P): " P
read -p "Enter annual interest rate (%) (R): " R
read -p "Enter time period in years (T): " T

# Basic numeric validation (integers or decimals)
numre='^[0-9]*([.][0-9]+)?$'
if ! [[ $P =~ $numre && $R =~ $numre && $T =~ $numre ]]; then
  echo "Error: Please enter numeric values for P, R, and T."
  exit 1
fi

# Use bc for floating point math
SI=$(echo "scale=2; $P * $R * $T / 100" | bc)
TOTAL=$(echo "scale=2; $P + $SI" | bc)

echo "Simple Interest: $SI"
echo "Total Amount (Principal + Interest): $TOTAL"
