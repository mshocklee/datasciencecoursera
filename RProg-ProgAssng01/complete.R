complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
		
		files <- paste0(directory,"/",list.files(directory))
		file.data <- data.frame()
		nobs.data <- data.frame("id"= numeric(length=length(id)), "nobs"= numeric(length=length(id)))
		
		for(i in 1:length(id)) {
				file.data <- read.csv(files[id[i]])
				nobs.data[i,1:2] <- c(id[i],sum(complete.cases(file.data)))
		}
		nobs.data
}