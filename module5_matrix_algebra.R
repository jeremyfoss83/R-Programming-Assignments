# Module 5: Matrix Algebra in R

# 1. Create the matrices
A <- matrix(1:100, nrow = 10)
B <- matrix(1:1000, nrow = 10)

# 2. Inspect dimensions
dim(A)  # 10 x 10: square
dim(B)  # 10 x 100: not square

# 3. Compute inverse and determinant

# For A: catch the error because A is singular
invA <- tryCatch(solve(A), error = function(e) e)
detA <- det(A)

# For B: catch errors because B is not square
invB <- tryCatch(solve(B), error = function(e) e)
detB <- tryCatch(det(B), error = function(e) e)

# 4. Display the results
invA
detA
invB
detB