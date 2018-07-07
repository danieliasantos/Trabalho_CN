Matriz <- function(m){
  m <- matrix(runif(10, min=0, max=10), nrow=4, ncol=4)
  summary(as.numeric(m))
}