
# Assignment 11: Debugging in R
# Jeremy Foss

# Helper function for identifying outliers using Tukey's rule
tukey.outlier <- function(x) {
  q1 <- as.numeric(quantile(x, 0.25))
  q3 <- as.numeric(quantile(x, 0.75))
  iqr <- IQR(x)
  
  (x < q1 - 1.5 * iqr) | (x > q3 + 1.5 * iqr)
}

# Original function with the bug
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

# Test the original function
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

cat("Original error:\n")
tryCatch(
  tukey_multiple(test_mat),
  error = function(e) cat(conditionMessage(e), "\n")
)

# Corrected function
corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

# Test the corrected function
result <- corrected_tukey(test_mat)

cat("\nCorrected output:\n")
print(result)

cat("\nOutput length:", length(result), "\n")

stopifnot(is.logical(result), length(result) == 10)
cat("Validation passed!\n")
