# Assignment 7: R Objects, Classes, and Methods

# 1. Load and inspect the dataset
data("mtcars")

head(mtcars)
str(mtcars)

# Inspect the dataset's class and underlying type
class(mtcars)
typeof(mtcars)
isS4(mtcars)

# 2. Test a generic function on different object classes

# Create a numeric object and a factor from the dataset
mpg <- mtcars$mpg
cylinders <- factor(mtcars$cyl)

class(mpg)
class(cylinders)

# Numeric data: summary.default gives descriptive statistics
summary(mpg)

# Factor data: summary.factor counts each category
summary(cylinders)

# 3. Create an S3 object
s3_obj <- list(name = "Example Student", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"

# Define a print method for this class
print.student_s3 <- function(x, ...) {
  cat("Name:", x$name, "\n")
  cat("Age:", x$age, "\n")
  cat("GPA:", x$GPA, "\n")
  invisible(x)
}

# Call the generic function
print(s3_obj)

# Inspect the object and access one component
class(s3_obj)
typeof(s3_obj)
isS4(s3_obj)
s3_obj$name

# 4. Define an S4 class
setClass(
  "student_s4",
  slots = c(name = "character", age = "numeric", GPA = "numeric")
)

# Create an S4 object
s4_obj <- new(
  "student_s4",
  name = "Example Student",
  age = 29,
  GPA = 3.5
)

# Define a show method for this class
setMethod("show", "student_s4", function(object) {
  cat("Name:", object@name, "\n")
  cat("Age:", object@age, "\n")
  cat("GPA:", object@GPA, "\n")
})

# Call the generic function
show(s4_obj)

# Inspect the object and access one slot
class(s4_obj)
typeof(s4_obj)
isS4(s4_obj)
s4_obj@name