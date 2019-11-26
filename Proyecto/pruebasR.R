library(dplyr)
library(data.table)
library(ggplot2)
library(reshape2)

cancer <- fread("tabladatoscancer.csv")
class(cancer)
head(cancer, 5)
str(cancer)

cancer2 <- cancer[is.na(cancer$Year) == FALSE]
head(cancer2, 5)
class(cancer2)

resumen <- cancer2[, list(tot = sum(Count)), by = c("Year", "Sex", "States", "Race")]
summary(resumen)

hist(resumen$Year, xlab = "Año", ylab = "Casos de cancer", col = "red")

hist(resumen$tot, xlab = "Año", ylab = "Casos de cancer", col = "red")

boxplot(resumen$tot ~ resumen$Sex, xlab = "Personas de raza blanca", ylab = "Casos de cancer registrados", outliners = FALSE)

promedios = sapply(resumen, mean(resumen$tot))

#GGPLOT

ggplot(resumen, aes(x = Year, y = tot, col = Race)) +
  geom_point() + facet_wrap(~ Race)


