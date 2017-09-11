# This script is to find the rownames which has values in all columns
df <- read.csv("Orthogroups.csv", header=T, sep = "\t", row.names = 1, stringsAsFactors=F)
dim(df)
colnames(df)
df[df==""]<-NA # Fill the blanks with NA

df_2<-df[complete.cases(df),] # Rows that have text in all columns
dim(df_2)
df_3=na.omit(df) # Discard the NA, this is our final datafarame
dim(df_3)
rownames(df_3) # We need only rownames
write(rownames(df_3),file="core_orthogroups.txt")

