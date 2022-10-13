library(HRW)
data(SydneyRealEstate)

nrow(SydneyRealEstate)
ncol(SydneyRealEstate)


d <- 8 # Assign the last digit of your UPI here
set.seed(123 + d)
# get index of NAs
n <- nrow(SydneyRealEstate)

# random missing data
prob.NA <- 0.2
na.index <- c()
for (i in 1:n) {
    if (runif(1) < prob.NA) {
        na.index <- c(na.index, i)
    }
}
length(na.index)
barplot(na.index)

# add NAs to data frame
SydneyEstateNa <- SydneyRealEstate
SydneyEstateNa$distToBusStop[na.index] <- ""


# Non-random missing data
d <- 8 # Assign the last digit of your UPI here
set.seed(123 + d)

# logit(p) = log(p/(1-p)) = -10 + y
# p = (e^(y-10))/(e^(y-10)+1)

y <- SydneyEstateNa$distToCoastline
prob.NA <- exp(y - 10) / (exp(y - 10) + 1)
n <- nrow(SydneyRealEstate)
# get index of NAs
na.index <- c()
for (i in 1:n) {
    if (runif(1) < prob.NA[i]) {
        na.index <- c(na.index, i)
    }
}
length(na.index)
barplot(na.index)

# add NAs to data frame
SydneyEstateNa$distToCoastline[na.index] <- ""

write.csv(SydneyEstateNa, "SydneyEstateNa.csv")
