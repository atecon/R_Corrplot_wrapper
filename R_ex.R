Corrplot_R <- function(M, method, fname) {
  library(corrplot)
  
  #dev.off()	# avoid permante flashing-up when using gretl
  #png(filename=fname, type="cairo", width=600, height=600, pointsize=14, bg=NA, res=96)
  corrplot(M, method="color")
  #dev.off()
  0
}


# Example
n <- 100
M1 <- rnorm(n,0) 
M2 <- rnorm(n,3)
M3 <- rnorm(n,5)
dat <- cbind(M1,M2,M3)
C <- corMatrix(dat)
Corrplot_R(dat, 1, 2)

library(corrplot)
M <- cor(mtcars)
corrplot(M, method = "circle")
