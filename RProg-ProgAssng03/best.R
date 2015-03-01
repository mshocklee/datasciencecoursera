best <- function(state, outcome) {
## Read outcome data
odata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
## Check that state and outcome are valid
if(! state %in% unique(odata[,7])) {stop("invalid state")}
if(! outcome %in% c("heart attack","heart failure","pneumonia")) {stop("invalid outcome")}
## Return hospital name in that state with lowest 30-day death
## rate
}