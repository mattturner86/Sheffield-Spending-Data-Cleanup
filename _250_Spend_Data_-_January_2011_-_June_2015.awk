# _250_Spend_Data_-_January_2011_-_June_2015.csv

BEGIN {
	FPAT = "([^,]*)|(\"[^\"]+\")"
	#OFS = "\",\""
	OFS = ","
}
#Remove all £ symbols
    {gsub(/£/,"")}

#Remove all , symbols in field for value 11
    {gsub(/,/,"", $11)}

#Convert the date format (half the file has 2 digit years)
NR > 1{
    if ($8 ~ /^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2}$/){
        #should match 9/12/14 or 9/2/11
        split($8, date, "/") #split by / symbol
        $8 = sprintf("%02d",date[1]) "/" sprintf("%02d",date[2]) "/20" sprintf("%2d",date[3]) #reorder
    }
}

#Print all lines line
{
	print $0
}