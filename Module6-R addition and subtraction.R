# Assignment 6: Matrix Operations and Construction

# Task 1: Matrix addition and subtraction
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

print(A + B)
print(A - B)

# Task 2: Create a diagonal matrix
D <- diag(c(4, 1, 2, 3))
print(D)

# Task 3: Construct the custom 5 x 5 matrix
M <- diag(3, nrow = 5, ncol = 5)
M[1, 2:5] <- 1
M[2:5, 1] <- 2
print(M)