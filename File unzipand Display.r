# To unzip the folder using R displaying the data.
#Load necessary utils library
library(utils)

# Specify the path to the zip file
zip_file_path <- r"C:\\Users\\muruc\\OneDrive - Nexford University\\Data Analytics NXU\\Assignments\\BAN6420\\Assignment 2\Salary\employee_name_salary.zip"  

# Specify the directory to extract the files to
extraction_dir <- r"C:\\Users\\muruc\\OneDrive - Nexford University\\Data Analytics NXU\\Assignments\\BAN6420\\Assignment 2\Salary" 

# Unzip the file
unzip(zip_file_path, exdir = extraction_dir)

# Automatically pick the file name
csv_files <- list.files(path = extraction_dir, pattern = "*.csv", full.names = TRUE)

# Create an empty list to store the dataframes
dataframes <- list()

# Loop over the list of CSV files and read each one into a dataframe
for (file in csv_files) {
  df <- read.csv(file)
  dataframes[[file]] <- df
}
# Combine all dataframes into a single dataframe
combined_df <- do.call(rbind, dataframes)

# Display the combined dataframe
print(combined_df)

