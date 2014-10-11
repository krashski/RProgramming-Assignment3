# R Programming
# Week 4
# Programming Assigmment 3: Hospital Quality
# Part 1: Finding the best hospital in a state

# Set the working directory
setwd("/Users/russ/Documents/Coursera/R_Programming/Week 4")

best <- function(state, outcome) {
    
    # Return hospital name in the state with lowest 30-day death rate
    source("sortByOutcome.R")
    head(sortByOutcome(state, outcome), 1)
    
}  