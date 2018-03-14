Corrplot_R <- function(M, method, fname) {
  library(corrplot)
  
  #dev.off()	# avoid permante flashing-up when using gretl
  #png(filename=fname, type="cairo", width=600, height=600, pointsize=14, bg=NA, res=96)
  corrplot(M, method=method)
  #dev.off()
  0
}


# Example
n <- 3
M1 <- runif(n,min=-1,max=1) 
M2 <- runif(n,min=-1,max=1) 
M3 <- runif(n,min=-1,max=1) 
dat <- cbind(M1,M2,M3)
Corrplot_R(dat, "number", 2)

library(corrplot)
M <- cor(mtcars)
corrplot(M, method = "number")
