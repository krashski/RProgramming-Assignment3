# R Programming
# Week 4
# Programming Assigmment 3: Hospital Quality
# Part 2: Ranking hospitals by outcome in a state

# Set the working directory
setwd("/Users/russ/Documents/Coursera/R_Programming/Week 4")

rankhospital <- function(state, outcome, num = "best") {
    
    ## Return hospital name in the state with the given rank
    ## for 30-day death rate
    source("best.R")
    source("sortByOutcome.R")
    
    if (num == "best") {
        best(state, outcome)
        } else if (num == "worst") {
        tail(sortByOutcome(state, outcome), 1)
    } else {
        sortByOutcome(state, outcome)[num]
    } 
    
}  