***create a table using stored estimates from 3 regression models. add stars for pvalues on SEs***
esttab est1 est2 est3, se star(* 0.10 ** 0.05 *** 0.01) label 
