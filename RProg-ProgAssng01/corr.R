corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
		
		comp <- subset(complete(directory), nobs > threshold)
		files <- paste0(directory,"/",list.files(directory)[comp[[1]]])
		nsCorr <- numeric(0)
		abvThresh <- data.frame()
		
		for(i in 1:nrow(comp)) {
			abvThresh <- read.csv(files[i])
			nsCorr <- c(nsCorr,cor(abvThresh$nitrate, abvThresh$sulfate,use="complete.obs"))
		}
		nsCorr <- round(nsCorr,digits=5)
}