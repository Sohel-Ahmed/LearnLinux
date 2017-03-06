
#!/bin/bash
# Q1.Script to sum to nos
#

if [ $# -ne 2 ]
then
    echo "Usage - $0   x    y"
    echo "        Where x and y are two nos for which I will print sum"
    exit 1
fi
    echo "Sum of $1 and $2 is `expr $1 + $2`"

#
# Q2. Script to find out bigest number
#
# Algo:
#      1) START: Take three nos as n1,n2,n3.
#      2) Is n1 is greater than n2 and n3, if yes 
#         print n1 is bigest no goto step 5, otherwise goto next step
#      3) Is n2 is greater than n1 and n3, if yes 
#         print n2 is bigest no goto step 5, otherwise goto next step
#      4) Is n3 is greater than n1 and n2, if yes 
#         print n3 is bigest no goto step 5, otherwise goto next step
#      5) END
#
#

    if [ $# -ne 3 ]
    then
	echo "$0: number1 number2 number3 are not given" >&2
        exit 1    
    fi
    n1=$1
    n2=$2
    n3=$3
    if [ $n1 -gt $n2 ] && [ $n1 -gt $n3 ]
    then
	echo "$n1 is Bigest number"
    elif [ $n2 -gt $n1 ] && [ $n2 -gt $n3 ]         
    then
	echo "$n2 is Bigest number"
    elif [ $n3 -gt $n1 ] && [ $n3 -gt $n2 ]         
    then
        echo "$n3 is Bigest number"
    elif [ $1 -eq $2 ] && [ $1 -eq $3 ] && [ $2 -eq $3 ]
    then
	echo "All the three numbers are equal"    
    else
        echo "I can not figure out which number is biger"    
    fi    

#
#Q.3.Write script to print nos as 5,4,3,2,1 using while loop.

# Q3
# Algo:
#       1) START: set value of i to 5 (since we want to start from 5, if you
#          want to start from other value put that value)
#       2) Start While Loop
#       3) Chechk, Is value of i is zero, If yes goto step 5 else
#          continue with next step
#       4) print i, decement i by 1 (i.e. i=i-1 to goto zero) and
#          goto step 3
#       5) END
#
i=5
while test $i != 0
do
	echo "$i
"
	i=`expr $i - 1`
done
#
#	Q.4. Write Script, using case statement to perform basic math operation as
#	follows
#	+ addition
#	- subtraction
#	x multiplication
#	/ division
#	The name of script must be 'q4' which works as follows
#	$ ./q4 20 / 3, Also check for sufficient command line arguments

# Q4
#

if test $# = 3
then
	case $2 in
	 +) let z=$1+$3;;
	 -) let z=$1-$3;;
	 /) let z=$1/$3;;
	 x|X) let z=$1*$3;;
	 *) echo Warning - $2 invalied operator, only +,-,x,/ operator allowed
	    exit;;
	esac
	echo Answer is $z
else
	echo "Usage - $0   value1  operator value2"
	echo "        Where, value1 and value2 are numeric values"
	echo "               operator can be +,-,/,x (For Multiplication)"
fi

#Q.5.Write Script to see current date, time, username, and current directory

# Q5
#
echo "Hello, $LOGNAME"
echo "Current date is `date`"
echo "User is `who i am`"
echo "Current direcotry `pwd`"

#
#Q.6.Write script to print given number in reverse order, for eg. If no is 123 it must print as 321.

# Script to reverse given no
#
# Algo:
#       1) Input number n
#       2) Set rev=0, sd=0
#   	3) Find single digit in sd as n % 10 it will give (left most digit)
#       4) Construct revrse no as rev * 10 + sd
#       5) Decrment n by 1
#       6) Is n is greater than zero, if yes goto step 3, otherwise next step
#       7) Print rev
#
if [ $# -ne 1 ]
then
    echo "Usage: $0   number"
    echo "       I will find reverse of given number"
    echo "       For eg. $0 123, I will print 321"
    exit 1
fi

n=$1
rev=0
sd=0

while [ $n -gt 0 ]
do
    sd=`expr $n % 10`
    rev=`expr $rev \* 10  + $sd`
    n=`expr $n / 10`
done
    echo  "Reverse number is $rev"

#
#Q.7.Write script to print given numbers sum of all digit, For eg. If no is 123 it's sum of all digit will be 1+2+3 = 6.
#
# Algo:
#       1) Input number n
#       2) Set sum=0, sd=0
#   	3) Find single digit in sd as n % 10 it will give (left most digit)
#       4) Construct sum no as sum=sum+sd
#       5) Decrment n by 1
#       6) Is n is greater than zero, if yes goto step 3, otherwise next step
#       7) Print sum
#
if [ $# -ne 1 ]
then
    echo "Usage: $0   number"
    echo "       I will find sum of all digit for given number"
    echo "       For eg. $0 123, I will print 6 as sum of all digit (1+2+3)"
    exit 1
fi

n=$1
sum=0
sd=0
while [ $n -gt 0 ]
do
    sd=`expr $n % 10`
    sum=`expr $sum + $sd`
    n=`expr $n / 10`
done
    echo  "Sum of digit for numner is $sum"
    

#Q.8.How to perform real number (number with decimal point) calculation in Linux
#Answer: Use Linux's bc command


#
# Q10 Q.10.How to perform real number calculation in shell script and store result to
#third variable , lets say a=5.66, b=8.67, c=a+b?
#
a=5.66
b=8.67
c=`echo $a + $b | bc`
echo "$a + $b = $c"

#Q.11.Write script to determine whether given file exist or not, file name is supplied as command line argument, also check for sufficient number of command line argument

# Q11

if [ $# -ne 1 ]
then
    echo "Usage - $0  file-name"
    exit 1
fi

if [ -f $1 ]
then
    echo "$1 file exist"
else
    echo "Sorry, $1 file does not exist"
fi
    
#Q.12.Write script to determine whether given command line argument ($1) contains "*" symbol or not, if $1 does not contains "*" symbol add it to $1, otherwise show message "Symbol is not required". For e.g. If we called this script Q12 then after giving ,
#$ Q12 /bin
#Here $1 is /bin, it should check whether "*" symbol is present or not if not it should print Required i.e. /bin/*, and if symbol present then Symbol is not required must be printed. Test your script as
#$ Q12 /bin
#$ Q12 /bin/*
# Q12
# Script to check whether "/*" is included, in $1 or not
# 

cat "$1" > /tmp/file.$$   2>/tmp/file0.$$

grep "*"  /tmp/file.$$    >/tmp/file0.$$

if [ $? -eq 1 ]
then
    echo "Required i.e. $1/*"
else
    echo "Symbol is Not required"    
fi    

rm -f /tmp/file.$$
rm -f /tmp/file0.$$
#
#Q.13. Write script to print contains of file from given line number to next given number of lines. For e.g. If we called this script as Q13 and run as
#$ Q13 5 5 myf , Here print contains of 'myf' file from line number 5 to next 5 line of that file.

# Q13
#
# Shell script to print contains of file from given line no to next 
# given  numberlines
#

#
# Print error / diagnostic for user if no arg's given
#
if [ $# -eq 0 ] 
then
    echo "$0:Error command arguments missing!"
    echo "Usage: $0 start_line   uptoline   filename"
    echo "Where start_line is line number from which you would like to print file"
    echo "uptoline is line number upto which would like to print"
    echo "For eg. $0 5 5 myfile"
    echo "Here from myfile total 5 lines printed starting from line no. 5 to"
    echo "line no 10."
    exit 1
fi

#
# Look for sufficent arg's
#

    if [ $# -eq 3 ]; then
	if [ -e $3 ]; then
    	    tail +$1 $3 | head -n$2
         else
    	    echo "$0: Error opening file $3" 
	    exit 2
	fi   
    else
        echo "Missing arguments!"	
    fi

#
#Q.14. Write script to implement getopts statement, your script should understand following command line argument called this script Q14,
#Q14 -c -d -m -e
#Where options work as
#-c clear the screen
#-d show list of files in current working directory
#-m start mc (midnight commander shell) , if installed
#-e { editor } start this { editor } if installed
# Q14
# -c clear
# -d dir
# -m mc
# -e vi { editor }
#

#
# Function to clear the screen
#
cls()
{
    clear
    echo "Clear screen, press a key . . ."
    read
    return
}

#
# Function to show files in current directory 
#
show_ls()
{   
    ls
    echo "list files, press a key . . ."
    read
    return
}

#
# Function to start mc
#
start_mc()
{
    if which mc > /dev/null ; then
	mc
	echo "Midnight commander, Press a key . . ."
	read
    else
	echo "Error: Midnight commander not installed, Press a key . . ."
	read
    fi		
    return
}

#
# Function to start editor 
#
start_ed()
{
    ced=$1
    if which $ced > /dev/null ; then
	$ced
	echo "$ced, Press a key . . ."
	read
    else
	echo "Error: $ced is not installed or no such editor exist, Press a key . . ."
	read
    fi		
    return
}

#
# Function to print help
#
print_help_uu()
{
	   echo "Usage: $0 -c -d -m -v {editor name}"; 
	   echo "Where -c clear the screen";
	   echo "      -d show dir";
	   echo "      -m start midnight commander shell";
	   echo "      -e {editor}, start {editor} of your choice";
	   return
}

#
# Main procedure start here
#
# Check for sufficent args
#

if [ $# -eq 0 ] ; then
    print_help_uu
    exit 1
fi    

#
# Now parse command line arguments
#
while getopts cdme: opt
do
    case "$opt" in
	c) cls;;
	d) show_ls;;
	m) start_mc;;
	e) thised="$OPTARG"; start_ed $thised ;;
	\?) print_help_uu; exit 1;; 
    esac
done        	   
	  
#
#Q.15. Write script called sayHello, put this script into your startup file called .bash_profile, the script should run as soon as you logon to system, and it print any one of the following message in infobox using dialog utility, if installed in your system, If dialog utility is not installed then use echo statement to print message : -
#Good Morning
#Good Afternoon
#Good Evening , according to system time.

# Q15
#

temph=`date | cut -c12-13`
dat=`date +"%A %d in %B of %Y (%r)"`

if [ $temph -lt 12 ]
then
    mess="Good Morning $LOGNAME, Have nice day!"
fi

if [ $temph -gt 12 -a $temph -le 16 ]
then
    mess="Good Afternoon $LOGNAME"
fi

if [ $temph -gt 16 -a $temph -le 18 ]
then
    mess="Good Evening $LOGNAME"
fi

if which dialog > /dev/null
then
    dialog --backtitle "Linux Shell Script Tutorial"\
    --title "(-: Welcome to Linux :-)"\
    --infobox "\n$mess\nThis is $dat" 6 60
    echo -n "                            Press a key to continue. . .                        "
    read
    clear
else
    echo -e "$mess\nThis is $dat"
fi


#
#Q.16. How to write script, that will print, Message "Hello World" , in Bold and Blink effect, and in different colors like red, brown etc using echo command.
# Q16
# echo command with escape sequance to give differnt effects
#
# Syntax: echo -e "escape-code your message, var1, var2 etc"
# For eg. echo -e "\033[1m  Hello World"
#                   |         |
#                   |         | 
#               Escape code   Message
#

clear 
echo -e "\033[1m Hello World"
 # bold effect
echo -e "\033[5m Blink"
       # blink effect
echo -e "\033[0m Hello World"
 # back to noraml

echo -e "\033[31m Hello World"
 # Red color
echo -e "\033[32m Hello World"
 # Green color
echo -e "\033[33m Hello World"
 # See remaing on screen
echo -e "\033[34m Hello World"
echo -e "\033[35m Hello World"
echo -e "\033[36m Hello World"

echo -e -n "\033[0m "
  # back to noraml

echo -e "\033[41m Hello World"
echo -e "\033[42m Hello World"
echo -e "\033[43m Hello World"
echo -e "\033[44m Hello World"
echo -e "\033[45m Hello World"
echo -e "\033[46m Hello World"


echo -e "\033[0m Hello World"
  # back to noraml
#



#Q.20.Write shell script using for loop to print the following patterns on screen


echo "Can you see the following:"

for (( i=1; i<=5; i++ ))
do
    for (( j=1; j<=i;  j++ ))
    do
     echo -n "$j"
    done
    echo ""
done


echo "Climb the steps of success"

for (( i=1; i<=5; i++ ))
do
    for (( j=1; j<=i;  j++ ))
    do
     echo -n " |"
    done
    echo "_ "
done
