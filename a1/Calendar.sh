#Name: Huang Jiaming
#NSID: jih211
#StuID: 11207964

echo "================================================="
date +'|                  '%b' '%Y'                     |'
echo "================================================="
echo "|  Mon | Tues |  Wed | Thur |  Fri |  Sat |  Sun |"
echo "|------------------------------------------------|"
dayT=$(date +%d)    # get the date in the month
day1=$dayT
indexT=$(date +%u)  # get the date in the week
n1=$indexT
declare -a index    # declare an array to represent the dates of a  week
while [ "$n1" -le 7 ]
do                  # there will be a bug here, the last week of each month will show from day '1' to day '31', I'm not going to fix it
    if [ $day1 -gt 31 ];then        # because I think everyone should know how many days there are in a month.                                              
	break
    fi
    index[$n1]=$day1
    ((day1+=1))
    ((n1+=1))
done
n1=$indexT
day1=$dayT
while [ "$n1" -ge 1 ]
do
    if [ $day1 -gt 31 ];then
	break
    fi
    index[$n1]=$day1
    ((day1-=1))
    ((n1-=1))
done
n1=1
while [ "$n1" -le 7 ]
do
    printf "|  ${index[$n1]}  "
    ((n1+=1))
done
printf "|\n"
declare -a tasks    # declare an array to represent the tasks of a week
n1=1
while [ "$n1" -le 7 ]
do
    task[$n1]="-"
    printf "|  ${task[$n1]}  "
    ((n1+=1))
done
printf "|\n"
while true
do
    printf ">>Input 1-7 to set tasks\n>>Input P to Print the calendar\n>>Input C to clear all the tasks records.\n>>Input Q to quit\n"
    printf "Your choice(Case Sensitive!):"
    read input
    if [ "$input" == Q ]
    then
	break
    fi
    if [[ "$input" -ge "1" && "$input" -le "7" ]]
    then
	printf "input your task:"
	read task
	task[$input]=$task
	printf "task set done!\n"
    fi
    if [ "$input" == "P" ]
    then
	clear
	echo "============================================="
	date +'|                '%b' '%Y'                   |'
	echo "============================================="
	echo "|  Mon | Tues |  Wed | Thur |  Fri |  Sat |  Sun |"
	echo "|------------------------------------------------|"
	n1=1
	while [ "$n1" -le 7 ]
	do
	    printf "|  ${index[$n1]}  "
	    ((n1+=1))
	done
	printf "|\n"
	n1=1
	while [ "$n1" -le 7 ]
	do
	    printf "|  ${task[$n1]}  "
	    ((n1+=1))
	done
	printf "|\n"
    fi
    if [ "$input" == C ]
    then
	n1=1
	while [ $n1 -le 7 ]
	do
	    task[$n1]="-"
	    ((n1+=1))
	done
	printf "task records cleared!\n"
    fi
done
