# June_2016_Monthly_Payements_To_Suppliers_Over__250_In_Value.csv

BEGIN {
	FPAT = "([^,]*)|(\"[^\"]+\")"
	#OFS = "\",\""
	OFS = ","
}
#Remove all £ symbols
    {gsub(/£/,"")}

#Remove all , symbols in field for value 11
    {gsub(/,/,"", $11)}

#Convert the date format (all dates are in Excel integer format)
NR > 1{
    if ($8 ~ /[0-9]{5}/){
        #convert excel to unix timestamp ref https://stackoverflow.com/a/6154953
        a = $8 - 25569
        b = a * 86400
        c = strftime("%d/%m/%Y" ,b)
        $8 = c
    }
}
    
#Print all lines except first (dodgy data) (no header row)
NR>1{
	print $0
}