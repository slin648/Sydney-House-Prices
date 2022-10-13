data <- read.csv("SydneyEstateNa.csv")

# break the data into two parts
n <- nrow(data)
n1 <- floor(n / 2)
n2 <- n - n1
data1 <- data[1:n1, ]
data2 <- data[(n1 + 1):n, ]

# drop the first column
data1 <- data1[, -1]
data2 <- data2[, -1]

# write the data to csv files
write.csv(data1, "SydneyEstateNa1.csv")
write.csv(data2, "SydneyEstateNa2.csv")
