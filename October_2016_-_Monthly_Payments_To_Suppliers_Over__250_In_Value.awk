# October_2016_-_Monthly_Payments_To_Suppliers_Over__250_In_Value.csv

BEGIN {
	FPAT = "([^,]*)|(\"[^\"]+\")"
	#OFS = "\",\""
	OFS = ","
}
#Remove all £ symbols
    {gsub(/£/,"")}

#Remove all , symbols in field for value 11
    {gsub(/,/,"", $11)}

#Print all lines line
{
	print $0
}