# September_2016_-_Monthly_Payments_To_Suppliers_Over__250_In_Value.csv

BEGIN {
	FPAT = "([^,]*)|(\"[^\"]+\")"
	#OFS = "\",\""
	OFS = ","
}
#Remove all £ symbols
    {gsub(/£/,"")}

#Remove all , symbols in field for value 11
    {gsub(/,/,"", $11)}

#Convert the date format (half the file has 2 digit years and month/day wrong way around eg 9/13/16)
NR > 1{
    if ($8 ~ /^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2}$/){
        #should match 9/12/14 or 9/2/11
        split($8, date, "/") #split by / symbol
        $8 = sprintf("%02d",date[2]) "/" sprintf("%02d",date[1]) "/20" sprintf("%2d",date[3]) #reorder
    }
}
    
#Print all lines
{
	print $0
}