# February_2016_-_Monthly_Payments_To_Suppliers_Over__250_In_Value.csv

BEGIN {
	FPAT = "([^,]*)|(\"[^\"]+\")"
	#OFS = "\",\""
	OFS = ","
}
#Remove all £ symbols
    {gsub(/£/,"")}

#Remove all , symbols in field for value 11
    {gsub(/,/,"", $11)}

#Convert the date format (all dates are in format 12/01/2015 12:00:00 AM)
NR > 1{
        split($8, date, " ") #split by space symbol
        split(date[1], date_2, "/") #split by / symbol
        $8 = date_2[2] "/" date_2[1] "/" date_2[3] #reorder
}
    
#Print all lines line
{
	print $0
}