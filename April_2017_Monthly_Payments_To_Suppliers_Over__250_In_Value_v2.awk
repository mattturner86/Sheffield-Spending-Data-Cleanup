# April_2017_Monthly_Payments_To_Suppliers_Over__250_In_Value_v2.csv

BEGIN {
	FPAT = "([^,]*)|(\"[^\"]+\")"
	#OFS = "\",\""
	OFS = ","
}
#Remove all £ symbols
    {gsub(/£/,"")}

#Remove all , symbols in field for value 11
    {gsub(/,/,"", $11)}

#Convert the date format (all dates are in format dd mmmm yyyy)
NR > 1{
        split($8, date_2, " ") #split by space symbol
        #split(date[1], date_2, "/") #split by / symbol
        $8 = date_2[1] "/04/" date_2[3] #reorder
}
    
#Print header line
NR==1{
	print $0
}
#Print all lines except first (dodgy data)
NR>2{
	print $0
}