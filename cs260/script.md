## BOURNE SHELL
```shell
#!/bin/sh
#Script that asks the user for a number and prints out if it is even or odd.

echo -n "Please provide a number : "
read user_input
x=`expr $user_input % 2`
if [ $x -eq 0 ]
then
    echo "Even"
else
    echo "Odd"
fi
```

```shell
#!/bin/sh
#Script that asks the user "Are you OK?"
#If user replies y or Y, then say "glad to hear it" else if the user enters n or N then print  "sorry that you are not feeling good". If the user enters some other character, then print in-correct choice and ask the question again.
while true; do
    read -p "Are you OK?" user_input
    case $user_input in
        [Yy]* ) echo "glad to hear it";
            break;;
        [Nn]* ) echo "sorry that you are not feeling good";
            break;;
        * ) echo "in-correct choice";;
    esac
done
```

```shell
#!/bin/sh

#Write a script that asks the user for a score. If the score is between 90 and 100, then print "you got A", else if between 80 and 90, then "you got B" and so on. If less than 60, then "you failed". If the user enters number not between 0 and 100, then print the error message and exit the script.

#Modify this script such that the user runs it with a number between 0 and 100 as an argument to the script and not ask the user for the score.

if [ $# -eq 0 ]
then
    read -p "Enter Score " user_input
else
    user_input=$1
fi
if [ $user_input -ge 90 -a $user_input -le 100 ]
then
    echo "you got A"
elif [ $user_input -ge 80 ]
then
    echo "you got B"
elif [ $user_input -ge 70 ]
then
    echo "you got C"
elif [ $user_input -ge 60 ]
then
    echo "you got D"
else
    echo "you failed"
fi
```

```shell
#!/bin/sh

#Save the current date in a variable
d=$(date | tr " " "\n")

#Shifts through the different parts/elements of the date using a loop and prints each one out in a seperate line.
for i in $d
do
    echo $i
done
```

```shell
#/bin/sh

read -p "Enter color " color
case $color in
    [Bb]l* ) echo "the sky color is $color";;
    red|yellow ) echo "the sun is sometimes this color";;
    * ) echo "this color is not in any of the categories defined.";;
esac
```

```shell
#!/bin/sh

cnt=0
while [ $cnt -lt 10 ]; do
    echo "$cnt"
    cnt=` expr $cnt + 1 `
done
```

```shell
#!/bin/bash

for i in "$@"
do
    echo $@
    shift
done
```

```shell
#!/bin/sh


lo=$1
hi=$2

if [ $hi -lt $lo ]
then
    temp=$hi
    hi=$lo
    lo=$temp
fi

re=0

while [ $lo -gt 0 ]; do
    re=$(($hi%$lo))
    hi=$lo
    lo=$re
done

echo "GCD is $hi"

echo "LCM is $(($1*$2/$hi))"
```

```shell
#!/bin/sh

echo "$(( $1 ** 2 ))"
```

```shell
#!/bin/sh

if [ $# -eq 0 ]
then
    read -p "Enter first number" arg1
    read -p "Enter second number" arg2
elif [ $# -ne 2 ]
then
    echo "USAGE error! Must have 2 arguments!"
else
    arg1=$1
    arg2=$2
fi


#MENU
while true; do
    echo "Add the numbers (enter a or A)"
    echo "Subtract the numbers (enter s or S)"
    echo "Multiply the numbers (enter m or M)"
    echo "Divide the numbers (enter d or D)"
    echo "Exit (select e or E)"
    read -p "Select Command: " cmd
    case $cmd in
        [Aa]* ) echo $(($arg1+$arg2));;
        [Ss]* ) echo $(($arg1-$arg2));;
        [Mm]* ) echo $(($arg1*$arg2));;
        [Dd]* ) echo $(($arg1/$arg2));;
        [Ee]* ) break;;
        * ) echo "invalid command";;
    esac

    echo "Another operation (enter o or O)"
    echo "Two different integers (enter i or I)"
    echo "Exit (select e or E)"
    read -p "Select Command: " cmd
    case $cmd in
        [Oo]* ) echo "Select another operation";;
        [Ii]* ) read -p "Enter first number " arg1;
                read -p "Enter second number " arg2;;
        [Ee]* ) break;;
    esac
done
```

```shell
#!/bin/sh

read -p "Enter integer from 1 to 10: " input

sum=0
factorial=1

for ((i = 1; i <= $input; i++)); do
    sum=$(($sum+i))
    factorial=$(($factorial*i))
done
echo "Sum: $sum"
echo "Factorial: $factorial"
```

## CSHELL

```shell
#!/bin/csh

echo "Enter Number: "
set num = $<
@ rem = $num % 2
if ( $rem == 0 ) then
    echo "even"
else
    echo "odd"
endif
```

```shell
#!/bin/csh
while ( 1 )
    echo "Are you ok?"
    set user_input = $<
    switch ( $user_input )
        case [Yy]* :
            echo "glad to hear it"
            break
        case [Nn]* :
            echo "sorry that you are not feeling good"
            break
        default :
            echo "in-correct choice"
            breaksw
    endsw
end
```

```shell
#!/bin/csh

if ( $#argv == 0 ) then
    echo "Enter Number"
    set num = $<
else
    set num = $1
endif

if ( $num >= 90 && $num <= 100 ) then
    echo "you got A"
else if ( $num >= 80 && $num < 90 ) then
    echo "you got B"
else if ( $num >= 70 && $num < 80 ) then
    echo "you got C"
else if ( $num >= 60 && $num < 70 ) then
    echo "you got D"
else
    echo "you failed"
endif
```
```shell
#!/bin/csh

set date = `date`
set date = ( $date )
foreach word ( $date )
    echo $word
end
```
```shell
#!/bin/csh

set user_input = $<
switch ( $user_input )
    case [Bb]l* :
        echo "the sky color is $user_input."
        breaksw
    case red :
        echo "the sun is sometimes this color."
        breaksw
    case yellow :
        echo "the sun is sometimes this color."
        breaksw
    default :
        echo "this color is not in any of the categories defined."
        breaksw
endsw
```
```shell
#!/bin/csh

set count = 0
while ( $count < 10 )
    echo "$count"
    @ count = $count + 1
end
```
```shell
#!/bin/csh

foreach arg ( $argv )
    echo $argv
    shift
end
```
```shell
#!/bin/csh

set lo = $1
set hi = $2

if ( $hi < $lo ) then
    set temp = $hi
    set hi = $lo
    set lo = $temp
endif

set re = 0

while ( $lo > 0 )
    @ re = $hi % $lo
    set hi = $lo
    set lo = $re
end

echo "GCD is $hi"
@ lcm = $1 * $2 / $hi
echo "LCM is $lcm"

```
```shell
#!/bin/csh

@ num = $1 * $1

echo $num
```
```shell
#!/bin/csh

if ( $#argv == 0 ) then
    echo "Enter first number"
    set arg1 = $<
    echo "Enter second number"
    set arg2 = $<
else if ( $#argv != 2 ) then
    echo "USAGE error! Must have 2 arguments!"
else
    set arg1 = $1
    set arg2 = $2
endif

#MENU
while ( 1 )
    echo "Add the numbers (enter a or A)"
    echo "Subtract the numbers (enter s or S)"
    echo "Multiply the numbers (enter m or M)"
    echo "Divide the numbers (enter d or D)"
    echo "Exit (select e or E)"
    echo "Enter command: "
    set cmd = $<
    switch ( $cmd )
        case [Aa]* :
            @ res = $arg1 + $arg2
            breaksw
        case [Ss]* :
            @ res = $arg1 - $arg2
            breaksw
        case [Mm]* :
            @ res = $arg1 * $arg2
            breaksw
        case [Dd]* :
            @ res = $arg1 / $arg2
            breaksw
        case [Ee]* :
            break
        default :
            echo "invalid command"
            continue
    endsw
    echo "ANSWER: $res"
    echo "Another operation (enter o or O)"
    echo "Two different integers (enter i or I)"
    echo "Exit (select e or E)"
    echo "Select command: "
    set cmd = $<
    switch ( $cmd )
        case [Oo]* :
            echo "Select another operation"
            breaksw
        case [Ii]* :
            echo "Enter first number "
            set arg1 = $<
            echo "Enter second number "
            set arg2 = $<
            breaksw
        case [Ee]* :
            break
    endsw
end
```
```shell
#!/bin/csh

echo "Enter a number from 1 to 10"
set in = $<
set sum = 0
set product = 1

while ( $in > 0 )
    @ product *= $in
    @ sum += $in
    @ in -= 1
end



echo "SUM: $sum"
echo "PRODUCT: $product"
```
