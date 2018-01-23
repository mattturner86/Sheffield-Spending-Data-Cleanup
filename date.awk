#this script prints the 8th field (date field). Use with |sort|uniq to print all unique values

BEGIN {FPAT = "([^,]*)|(\"[^\"]+\")"}
NR>1{print $8}
