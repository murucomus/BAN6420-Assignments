data(iris)
min_max_norm <- function(x){
    (x-min(x))/(max(x)-min(x))
}

iris_norm <- as.data.frame(lapply(iris[1:4], min_max_norm))

head(iris_norm)
src(iris_norm)