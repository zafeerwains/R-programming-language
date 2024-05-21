# Load necessary libraries
library(tidyverse)
library(lubridate)
library(caret)
library(arules)
library(arulesViz)

# Load the dataset
crypto_data <- read.csv("Crypto.csv")

# Check for missing values
colSums(is.na(crypto_data))

crypto_data <- na.omit(crypto_data)


# Correct the date format for entries causing NA values
crypto_data$date_taken <- ifelse(
  grepl("/", crypto_data$date_taken), 
  as.Date(crypto_data$date_taken, format="%m/%d/%Y"),
  as.Date(crypto_data$date_taken, format="%d-%m-%Y")
)

# Remove rows with NA dates
crypto_data <- crypto_data %>% filter(!is.na(date_taken))

# Remove commas from numeric columns and convert to numeric
crypto_data <- crypto_data %>% 
  mutate(across(c(price, volume24hrs, marketcap, circulatingsupply, maxsupply, totalsupply), 
                ~ as.numeric(gsub(",", "", .))))

# Normalize numeric columns
numeric_columns <- c('price', 'volume24hrs', 'marketcap', 'circulatingsupply', 'maxsupply', 'totalsupply')
crypto_data[numeric_columns] <- as.data.frame(scale(crypto_data[numeric_columns]))

# Check for missing values and handle them
crypto_data <- na.omit(crypto_data)

# Discretize numeric columns
crypto_data_discretized <- crypto_data %>%
  mutate(across(numeric_columns, ~cut(., breaks = 3, labels = c("Low", "Medium", "High"))))

# Convert the dataset to transactions
trans_data <- as(crypto_data_discretized, "transactions")
summary(trans_data)

# Apply the Apriori algorithm
rules <- apriori(trans_data, parameter = list(supp = 0.1, conf = 0.8))

# Inspect the rules
inspect(rules)

# Plot rules
plot(rules)

# Example target variable: 'price_category' (categorical based on price range)
crypto_data$price_category <- cut(crypto_data$price, breaks = c(-Inf, -1, 1, Inf), labels = c("low", "medium", "high"))

# Check the distribution of the price categories
table(crypto_data$price_category)

# Set seed for reproducibility
set.seed(42)

# Split the data
trainIndex <- createDataPartition(crypto_data$price_category, p = 0.8, list = FALSE)
train_data <- crypto_data[trainIndex, ]
test_data <- crypto_data[-trainIndex, ]

# Train the decision tree classifier
model <- train(price_category ~ ., data = train_data, method = "rpart", na.action = na.omit)

# Predictions
predictions <- predict(model, test_data)

# Evaluation
confusionMatrix(predictions, test_data$price_category)

