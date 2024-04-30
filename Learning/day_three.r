# An array with one dimension with values ranging from 1 to 24
thisarray <- c(1:24)
print(thisarray)

# An array with more than one dimension
multiarray <- array(thisarray, dim = c(4, 3, 2))
print(multiarray)


thisarray <- c(1:24)

# Access all the items from the first row from matrix one
multiarray <- array(thisarray, dim = c(4, 3, 2))
print(multiarray[c(1), , 1])

# Access all the items from the first column from matrix one
multiarray <- array(thisarray, dim = c(4, 3, 2))
print(multiarray[, c(1), 1])

thisarray <- c(1:24)
multiarray <- array(thisarray, dim = c(4, 3, 2))

print(length(multiarray))

data_frame <- data.frame(
    Training = c("Strength", "Stamina", "Other"),
    Pulse = c(100, 150, 120),
    Duration = c(60, 30, 45)
)

# Print the data frame
print(data_frame)

print(summary(data_frame))

print(data_frame[2])

print(data_frame[["Pulse"]])

print(data_frame$Duration)

new_row_df <- rbind(data_frame, c("Strength", 110, 110))
print(new_row_df)

new_col_df <- cbind(data_frame, day = c("tue", "mon", "wed"))
print(new_col_df)

# Remove the first row and column
data_frame_new <- data_frame[-c(1), -c(1)]

# Print the new data frame
print(data_frame_new)

print(dim(data_frame))
print(ncol(data_frame))
print(nrow(data_frame))
print(length(data_frame))

music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))

print(music_genre)
print(levels(music_genre))


