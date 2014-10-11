# R Programming
# Week 4
# Programming Assigmment 3: Hospital Quality
# Part 3: Ranking hospitals in all states

# Set the working directory
setwd("/Users/russ/Documents/Coursera/R_Programming/Week 4")

rankall <- function(outcome, num = "best") {
    
    # Check that outcome is valid
    source("selectOutcome.R")
    var <- selectOutcome(outcome)
    
    # Read outcome data
    df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    # For each state, find the hospital of the given rank
    df[, var] <- suppressWarnings(as.numeric(df[, var]))
    df <- df[order(df$"State", df[var], df$"Hospital.Name", na.last=NA), ]
    df <- df[!is.na(var)]
    df.split <- split(df[, "Hospital.Name"], df$State)

    rankHospitals <- function(data, num) {
        if (num == "best") {
            head(data, 1)
        } else if (num == "worst") {
            tail(data, 1)
        } else {
            data[num]
        }
    }
    
    # Return a data frame with the hospital names and the
    # (abbreviated) state name
    output <- lapply(df.split, rankHospitals, num)
    data.frame(hospital = unlist(output), 
               state = names(output), 
               row.names = names(output))

}