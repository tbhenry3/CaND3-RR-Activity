
***create a summary stats table of chores, lifesat, and visminority by sex. display n mean sd min and max***
tabstat chores lifesat visminority, by(female) stat(n, mean, sd, min, max) col(stat) long
