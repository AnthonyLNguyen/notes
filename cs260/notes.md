# CS 260 Notes

## Shell Scripts
### Arguments
```Bash
$@ #argv (vars)
$# #argc (count)
```

### Read user input
```Bash
echo -n "Please confirm : [Yes|No]"
read user_input
```
Then, compare it with standard answer 'yes'
```Bash
if [ "$user_input = "Yes" ]
    echo "Thanks!"  
fi
```

### if else then elif
```Bash
if
    then
    elif
        then
```

### for
```Bash
for test_command
do
    commands
done
```

### while
```Bash
while [ "$number" -lt 10 ] #-lt means lessthan
do
   number=`expr $number +1` 
done
```
