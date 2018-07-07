quickSort <- function(arr) {
  # gera numeros randomicos.
  mid <- sample(arr, 1)
  
  left <- c()
  right <- c()
  
  # move menores para esquerda e maiores para direita.
  lapply(arr[arr != mid], function(d) {
    if (d < mid) {
      left <<- c(left, d)
    }
    else {
      right <<- c(right, d)
    }
  })
  
  if (length(left) > 1) {
    left <- quickSort(left)
  }
  
  if (length(right) > 1) {
    right <- quickSort(right)
  }
  .
  c(left, mid, right)
}

