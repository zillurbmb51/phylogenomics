# This script is to find the rownames which has values in all columns
df <- read.csv("Orthogroups.csv", header=T, sep = "\t", row.names = 1, stringsAsFactors=F)
df[df==""]<-NA # Fill the blanks with NA
df_2<-df[complete.cases(df),] # Rows that have text in all columns
write(rownames(df_2),file="core_orthogroups.txt")

