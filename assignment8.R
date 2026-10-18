# Assignment 8: Input/Output, String Manipulation, and plyr

# Import the comma-separated student data
student6 <- read.table(
  file.choose(),
  header = TRUE,
  sep = ",",
  stringsAsFactors = FALSE
)

# Inspect the imported data
head(student6)
dim(student6)
str(student6)

# Check for missing values
colSums(is.na(student6))

# Confirm where our output files will be saved
getwd()

# Load plyr
library(plyr)

# Calculate the mean grade for each sex
gender_mean <- ddply(
  student6,
  "Sex",
  plyr::summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

# Display the grouped means
gender_mean

# Write the grouped means to a tab-separated text file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep = "\t",
  row.names = FALSE
)

# Confirm the file exists
file.exists("gender_mean.txt")

# Read the saved file back to check its contents
read.table(
  "gender_mean.txt",
  header = TRUE,
  sep = "\t"
)

# Keep students whose names contain i or I
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)

# Display the matching names and their count
i_students$Name
nrow(i_students)

# Export only the matching names
write.csv(
  i_students$Name,
  file = "i_students.csv",
  row.names = FALSE,
  quote = FALSE
)

# Confirm the file exists
file.exists("i_students.csv")

# Read the saved names back
read.csv("i_students.csv", stringsAsFactors = FALSE)

# Export all columns for the matching students
write.csv(
  i_students,
  file = "i_students_full.csv",
  row.names = FALSE
)

# Read the saved dataset back
saved_students <- read.csv(
  "i_students_full.csv",
  stringsAsFactors = FALSE
)

saved_students
dim(saved_students)

# Confirm all three required files exist
file.exists(c(
  "gender_mean.txt",
  "i_students.csv",
  "i_students_full.csv"
))

