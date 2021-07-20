for line in "${ports[@]}"

 
 

 
do

 
 

 
if echo quit | timeout --signal=9 2 telnet $line </dev/null 2>&1 | grep -q Escape

 
 

 
then

 
output=Success

 
 

 
elif echo quit | timeout --signal=9 2 telnet $line </dev/null 2>&1 | grep -q refused

 
 

 
then

 
output=Success

 
else

 
output=failed

 
fi

 
 

 
echo "$line=$output"

 
 

 
runCheck "Network-port $line" "equalCk" "success" "${output}"

 
 

 
done

 
}
