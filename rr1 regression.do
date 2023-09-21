
***regress chores onto lifesat using OLS controlling for sex and visible minority status***
regress lifesat c.chores i.female i.visminority 
estimates store est1 //store estimates

***regress chores onto lifesat by sex using OLS controlling for visible minority status***
regress lifesat c.chores i.visminority if female==1
estimates store est2 //store estimates
regress lifesat c.chores i.visminority if female==0
estimates store est3 //store estimates
