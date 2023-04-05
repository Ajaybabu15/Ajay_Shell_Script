#Police Drunk & Drive
# 1. Calculate the age.
# 2.If its <18 to >0 , You should not consume alochol.
# 3.<45 to >18, you are allowed as per govt regulations
# 4.<65 to >45, not good to health
# 5.>65, NOT Recommended
#!/bin/bash
read -p "Please Provide Your Birth Year:" YOB
CURRENT_YEAR=2023
CURRENT_AGE=$(expr $CURRENT_YEAR - $YOB)

if [ $CURRENT_AGE -lt 18 -a $CURRENT_AGE -gt 0 ]
then
   echo "Your Age is $CURRENT_AGE and as per Govt, Your age dont qualify for alcohol consumption"
elif [ $CURRENT_AGE -lt 45 -a $CURRENT_AGE -gt 18 ]
then
   echo "Your Age is $CURRENT_AGE and as per Govt, You can consume alcohol"
elif [ $CURRENT_AGE -lt 65 -a $CURRENT_AGE -gt 45 ]
then
   echo "Your Age is $CURRENT_AGE and not recommended to consume alcohol"
elif [ $CURRENT_AGE -lt 110 -a $CURRENT_AGE -gt 65 ]
then
   echo "Your Age is $CURRENT_AGE and Very risky to consume alcohol"
else
   echo "Invalid Input"
fi