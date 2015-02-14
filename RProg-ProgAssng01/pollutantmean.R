pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
		
		pset<-data.frame(x=numeric(0))
		names(pset) <- pollutant
		for (i in 1:length(id)) {
			while(nchar(id[i])<3) {
				id[i] <- paste("0",id[i],sep="")
			}
			monData <- read.csv(file=paste0(directory,"/",id[i],".csv"))
			pset <- rbind(pset,subset(monData, select=pollutant))
		}
		pmean <- round(as.numeric(colMeans(pset,na.rm=TRUE)),digits=3)
		return(pmean)
}