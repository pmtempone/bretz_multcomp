-----#librerias-----

library(ISwR)
library(multcomp)

----#Introduccion----

thuesen.lm <- lm(short.velocity ~ blood.glucose,data = thuesen)
summary(thuesen.lm)

plot(thuesen$blood.glucose,thuesen$short.velocity)
abline(thuesen.lm,col='red')

#aplicar ajuste de bonferroni

thuesen.mc <- glht(thuesen.lm, linfct = diag(2))
summary(thuesen.mc, test = adjusted(type = "bonferroni"))

#The associated adjusted p-value is 0.096, twice as large as the unadjusted
#p-value from the previous analysis. This is because now the p-value is corrected
#(i.e., adjusted) for multiplicity using the Bonferroni test