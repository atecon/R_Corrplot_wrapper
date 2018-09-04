Corrplot_R <- function(M, method, monochrome, cmin, cmax, fontsize, fname) {
  
  # URL: https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html
  pkgTest("corrplot")
  library(corrplot)
  
  #dev.off()	# avoid permante flashing-up when using gretl
  png(filename=fname, type="cairo", width=600, height=600, pointsize=fontsize, bg=NA, res=96)	
  if (monochrome==0) {
    corrplot(M, method=method, cl.lim=c(cmin,cmax), is.corr=FALSE) # ,col = gray.colors(10))
    # "is.corr=FALSE" makes sure that the color-range is automatically adapted when the
    # correlation range to plot gets narrower.
  }
  if (monochrome!=0) {
    corrplot(M, method=method, cl.lim=c(cmin,cmax), col = gray.colors(100), is.corr=FALSE) # ,col = gray.colors(10))
  }
  dev.off()
  0
}

# Corrplot_R1 <- function(M, method, fname) {
#   # package Cairo 1.5-9 (2015-09-26)
#   library(Cairo)
#   library(corrplot)
#   
#   #dev.off()
#   # dimensions in pixels
#   CairoPNG(filename=fname, width=600, height=600, pointsize=14)
#   corrplot(M, method=method)
#   dev.off()
#   0
# }

# check whether corrplot pckg. is already installed
pkgTest <- function(x) {
  if (!require(x,character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
    if(!require(x,character.only = TRUE)) stop("Package not found")
  }
}

# Example
fs = 22
n <- 3
M1 <- runif(n,min=-1,max=1) 
M2 <- runif(n,min=-1,max=1) 
M3 <- runif(n,min=-1,max=1) 
dat <- cbind(M1,M2,M3)
fname = "/home/at/gretl/R_corrplot_test.png"
Corrplot_R(dat, "color", 0, -1, 1, fs, fname)
