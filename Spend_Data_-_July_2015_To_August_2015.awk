# Spend_Data_-_July_2015_To_August_2015.csv

BEGIN {
	FPAT = "([^,]*)|(\"[^\"]+\")"
	#OFS = "\",\""
	OFS = ","
}
#Remove all £ symbols
    {gsub(/£/,"")}

#Remove all , symbols in field for value 11
    {gsub(/,/,"", $11)}

#Convert the date format (half the file is excel integer dates)
NR > 1{
    if ($8 ~ /^[0-9]{5}$/){
        #should match 12345
        #convert excel to unix timestamp ref https://stackoverflow.com/a/6154953
        a = $8 - 25569
        b = a * 86400
        c = strftime("%d/%m/%Y" ,b)
        $8 = c
        }
}

#Print all lines line
{
	print $0
}