library("dplyr")
data(mtcars)
head(mtcars)
summary(mtcars)
#str(mtcars)
selected_columns<-mtcars%>%select(mpg, cyl, hp)
head(selected_columns)

filtered_rows<-mtcars%>%filter(mpg>20, cyl==4)
head(filtered_rows)

arranged_data<-mtcars%>%arrange((mpg))
head(arranged_data)

mutated_data<-mtcars%>%mutate(mpg_per_cyl=mpg/cyl)
head(mutated_data)

grouped_data<-mtcars%>%group_by(cyl)%>%summarize(avg.mpg=mean(mpg))
print(grouped_data)


write.csv(mutated_data, "mutated_data.csv")

install.packages("data.table")
library(data.table)

