#Match the date field based on a regex and spit out line numbers

BEGIN {
	FPAT = "([^,]*)|(\"[^\"]+\")"
	#OFS = "\",\""
	OFS = ","
}

#Check each line for date format
NR > 1{
    if ($8 ~ /[0-9]{5}/){
        #convert excel to unix timestamp ref https://stackoverflow.com/a/6154953
        a = $8 - 25569
        b = a * 86400
        c = strftime("%d/%m/%Y" ,b)
        $8 = c
        print $8
    }
}