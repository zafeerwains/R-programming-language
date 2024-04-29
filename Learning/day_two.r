thislist <- list("apple", "banana", "cherry")
print(thislist) # indexing starts from 1
print(paste("at 1 Index", thislist[1]))
print(paste("at 2 Index", thislist[2]))
print(paste("at 3 Index", thislist[3]))


thislist[2] <- "mango"
print(thislist)
print(length(thislist))

print("apple" %in% thislist) # chack wheather value is present in or not

thislist <- append(thislist, "Pineapple") # add new value at end of list
print(thislist)

# add new value at Specific index of list
thislist <- append(thislist, "kiwi", after = 1)
print(thislist)

newlist <- thislist[-1] # remove first element
print(newlist)

newlist <- (thislist)[3:5]
print(newlist)

for (x in thislist) {
    print(x)
}

list1 <- list("a", "b", "c")
list2 <- list(1, 2, 3)
list3 <- c(list2, list1)

print(list3)


# matrix
# Create a matrix
thismatrix <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2)

# Print the matrix
print(thismatrix)


print(thismatrix[1, 2])

print(thismatrix[2, ])

print(thismatrix[, 2])

print(thismatrix[c(1, 2), ])

thismatrix <- matrix(c(
    "apple", "banana", "cherry", "orange",
    "grape", "pineapple", "pear", "melon", "fig"
), nrow = 3, ncol = 3)

newmatrix <- cbind(thismatrix, c("strawberry", "blueberry", "raspberry"))

# Print the new matrix
print(newmatrix)

newmatrix <- rbind(thismatrix, c("strawberry", "blueberry", "raspberry"))

# Print the new matrix
print(newmatrix)

newmatrix <- newmatrix[-c(1), -c(1)]
print(newmatrix)

print(dim(newmatrix))

print(length(newmatrix))

for (rows in 1:nrow(thismatrix)) {
    for (columns in 1:ncol(thismatrix)) {
        print(thismatrix[rows, columns])
    }
}


# Combine matrices
matrix1 <- matrix(c("apple", "banana", "cherry", "grape"), nrow = 2, ncol = 2)
matrix2 <- matrix(c(
    "orange", "mango",
    "pineapple", "watermelon"
), nrow = 2, ncol = 2)

# Adding it as a rows
matrix_combined <- rbind(matrix1, matrix2)
print(matrix_combined)

# Adding it as a columns
matrix_combined <- cbind(matrix1, matrix2)
print(matrix_combined)
