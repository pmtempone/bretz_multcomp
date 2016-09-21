-----#librerias-----

library(ISwR)
library(multcomp)

options(scipen = 999)
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

summary(thuesen.mc)

'The adjusted p-value for the slope parameter is now 0.064 and thus considerably
smaller than the 0.096 from the Bonferroni test, although we still have
not achieved significance. During the course of this book we will discuss even
more powerful methods, which allow the user to safely claim that the slope is
signicant at the level alpha = 0:05 after having adjusted for multiplicity.'


