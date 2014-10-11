# Week 4 helper function
# Sort hospitals by outcome

sortByOutcome <- function(state, outcome) {
    
    # Check that outcome is valid
    source("selectOutcome.R")
    var <- selectOutcome(outcome)
    
    # Read outcome data
    df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state is valid
    if (!state %in% df$State) {
        stop("invalid state")
    }
    
    # Select state, sort hospital names by outcome variable
    df <- df[df$State == state, ]
    df[, var] <- suppressWarnings(as.numeric(df[, var]))
    df <- df[order(df[var], df$"Hospital.Name"), ]
    df <- as.character(df$Hospital.Name[!is.na(df[var])])
    
}