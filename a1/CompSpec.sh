#Name: Huang Jiaming
#NSID: jih211
#StuID: 11207964

echo "-----------------------------------------"
echo "            Computer Stats:              "
echo "========================================="
echo "|"
printf "| Total CPU's: "$(nproc)"\n"
printf "| Number of CPU's being used: "$(ps -ao psr | awk '{sum=0}{if(NR>1)sum+=$1}END{print sum}')"\n"
printf "| Total Memory: "$(free -m | awk '/[M]em/{printf $2/1000}')" GB\n"
printf "| Used Memory: "$(free -m | awk '/[M]em/{printf $3/1000}')" GB\n"
echo "|----------------------------------------"
echo "|"
echo "| Listings:    User    CPU's    Mem    Job"
ssh $USER@tux7 'echo \|$(hostname)' 
ssh $USER@tux7 " ps -ao user,psr,%cpu,%mem,comm | sed 's/^/\|/'| sed 's/PSR/CPU/g' "
echo "|"
ssh $USER@peon6 'echo \|$(hostname)' 
ssh $USER@peon6 " ps -ao user,psr,%cpu,%mem,comm | sed 's/^/\|/'| sed 's/PSR/CPU/g' "
echo "|"
ssh $USER@tux5 'echo \|$(hostname)' 
ssh $USER@tux5 " ps -ao user,psr,%cpu,%mem,comm | sed 's/^/\|/'| sed 's/PSR/CPU/g' "
echo "|"
ssh $USER@peon11 'echo \|$(hostname)' 
ssh $USER@peon11 " ps -ao user,psr,%cpu,%mem,comm | sed 's/^/\|/'| sed 's/PSR/CPU/g' "
