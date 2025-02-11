library(ggplot2)
library(dplyr)
library(readr)
library(tidyr)
data <- read.csv("C:\\Users\\gaurav\\Documents\\class room.csv")
head(data)
summary(data)
sum(is.na(data))
data$Gender <- as.factor(data$Gender)
data$EthnicGroup <- as.factor(data$EthnicGroup)
data$ParentEduc <- as.factor(data$ParentEduc)
data$LunchType <- as.factor(data$LunchType)
data$TestPrep <- as.factor(data$TestPrep)
data$ParentMaritalStatus <- as.factor(data$ParentMaritalStatus)
data$PracticeSport <- as.factor(data$PracticeSport)
data$IsFirstChild <- as.factor(data$IsFirstChild)
data$TransportMeans <- as.factor(data$TransportMeans)
data$WklyStudyHours <- as.factor(data$WklyStudyHours)
ggplot(data, aes(x = MathScore)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  theme_minimal() +
  ggtitle("Distribution of Math Scores")
ggplot(data, aes(x = Gender, y = MathScore, fill = Gender)) +
  geom_boxplot() +
  theme_minimal() +
  ggtitle("Math Scores by Gender")
cor_test <- cor(data[c("MathScore", "ReadingScore", "WritingScore")], use = "complete.obs")
print(cor_test)
ggplot(data, aes(x = WklyStudyHours, y = MathScore, fill = WklyStudyHours)) +
  geom_boxplot() +
  theme_minimal() +
  ggtitle("Math Scores by Weekly Study Hours")
write.csv(data, "cleaned_data.csv", row.names = FALSE)

