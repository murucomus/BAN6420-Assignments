# Install and Load applicable libraries
install.packages("fs")
install.packages("readr")
library(ggplot2)  # For plotting
library(dplyr)    # For data manipulation
library(fs)
library(readr)

# Define the base directory and file name
base_dir <- path_home()  # This points to the user's home directory
# print(base_dir) # Error checking code
file_name <- 'netflix_data.csv'

path <- path(base_dir, 'Downloads', file_name)

print(path) # Error checking code

# Define function to check if file path exists
is_valid_file_path <- function(file_path) {
  # Check if the path exists and is a file
  if (file_exists(file_path) && file_info(file_path)$is_file) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

if (is_valid_file_path(path)) {
  print("This is a valid file path.")
} else {
  print("This is not a valid file path.")
}


# Reading the CSV file into a data frame
Netflix_shows_movies <- read_csv(path)

# Handling missing values - preprocessing

# Display the number of missing values per column
missing_values <- colSums(is.na(Netflix_shows_movies))
print(missing_values)

# Display the percentage of missing values per column
missing_percentage <- colMeans(is.na(Netflix_shows_movies)) * 100
#print(missing_percentage)

# Get number of rows and columns
num_rows <- nrow(Netflix_shows_movies)
num_columns <- ncol(Netflix_shows_movies)
print(paste("Number of rows:", num_rows))
print(paste("Number of columns:", num_columns))

# Replacing missing values for specific columns with 'unknown'
Netflix_shows_movies <- Netflix_shows_movies %>%
  mutate(
    director = ifelse(is.na(director), 'unknown', director),
    cast = ifelse(is.na(cast), 'unknown', cast),
    country = ifelse(is.na(country), 'unknown', country),
    rating = ifelse(is.na(rating), 'unknown', rating),
    date_added = ifelse(is.na(date_added), 'unknown', date_added)
  )

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Assuming Netflix_shows_movies is your data frame

# Distribution of content ratings (As per requirement in assignment)
rating_counts <- Netflix_shows_movies %>%
  count(rating) %>%
  arrange(desc(n))

# Print the distribution of content ratings
print("Distribution of content ratings:")
print(rating_counts)

# Plot the distribution of content ratings
ggplot(rating_counts, aes(x = reorder(rating, -n), y = n)) +
  geom_bar(stat = "identity") +
  labs(title = "Content Rating Distribution", x = "Rating", y = "Count") +
  theme_minimal()

