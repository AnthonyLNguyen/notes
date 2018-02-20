# CS 260 Notes

## grep Answers
```bash
$ egrep San datebook
$ egrep ^J datebook
$ egrep 700$ datebook
$ egrep -v 843 datebook
$ egrep :12\/ datebook
$ egrep :408- datebook
$ egrep '[A-Z][a-z]{4}, [A-Z]' datebook
$ egrep '^[A-z]* [Kk]' datebook
$ egrep -n [0-9]{6}$ datebook
$ egrep -i lincoln datebook
```

## sed Answers
```bash
$ sed -n 5,10p datebook
$ sed '/Lane/d' datebook
$ sed -n '/1[12]\//p' datebook
$ sed '/Fred/ s/$/***' datebook
$ sed '/Jose/ c\JOSE HAS RETIRED' datebook
$ sed -r '/Popeye/ s/[0-9]+\/[0-9]+\/[0-9]{2}/11\/14\/46/' datebook
$ sed '/^$/d'
$ sed '1 i\PERSONNEL FILE' datebook | sed '/500/d' | sed -r 's/([A-Za-z]+) ([a-zA-Z]+)/\2 \1/' | sed -e '$ a\THE END’
```

## awk Answers
```bash
$ awk -F: '{print $2}' employees
$ awk -F: '/^Dan/ {print $2}' employees
$ awk '/^Susan/ {print "Name: " $1 " Number: " $2}' employees
$ awk '/^.* D/' employees
$ awk '/^[CE]/' employees
$ awk '/^[[:alpha:]]{4} /' employees
$ awk '/(916)/ {print $1}' employees
$ awk -F: '/^Mike/ {print "$"$3, "$"$4, "$"$5}' employees
$ awk -F"[ :]" '{print $2",", $1}' employees
$ awk -F: -f facts employees

facts file:
    	/Savage/ {print $1, $2}
    	/^Chet/ {print "$"$3, "$"$4, "$"$5}
    	/:250:[0-9]*:[0-9]*/ {print $1}
```





## Vim/Emacs
*Open file
*Save file
*Copy paste
*Search and replace

## Emacs (inferior):
```
Exit			C-x, C-c
Open file		C-x, C-f
Save file 		C-x, C-s
Copy paste		C-Spc to set mark		C-w to cut      M-w to copy    C-y to paste
Searching and Replacing
C-s 	Incremental search forward
C-r 	Incremental search backward
C-M-s 	Regexp search forward
C-M-r 	Regexp search backward

M-x, replace-string, RET, string, RET, replacement
String replace from here to end of buffer (YOU ACTUALLY TYPE “replace-string” AFTER PRESSING M-x) RET = PRESS ENTER

M-x, query-replace, RET ... 	String replace from here to end of buffer, querying for each occurrence

M-x, grep, RET  ...		Prompts for a grep command, shows hits in a buffer


C-x, ` 	Visit next grep hit
Undo			C-x, u
```

## Vim (superior):
```
Exit			:q	:q! (To force quit without saving)	:wq (write and then quit)
Open file		:open <filename>
Save file 		:w <OPTIONAL-filename>
Copy paste		Press the v key to enter visual mode. Move to highlight. Press the y key (yank) to copy (or d to cut). Press the p key to paste.
Search			:/text/
Replace		:s/text/next/ (replaces on current line)		:%s/text/next/g (replaces all)
Undo			Press the u key
```


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
