drop if marstat !=1 //keep only married participants

drop if prtypec !=1 //keep only cohabiting hetero partners

***create duplicate variables***
gen mealprep = com_105
gen housework = com_110
gen dishes = com_115
gen laundry = com_120
gen grocery = com_125
gen gardening = com_130
gen outdoorwork = com_135
gen social = com_140
gen finance = com_145

gen female = sex
recode female 1=0 2=1 //dummy code 0=male 1=female
label define genlab 0 "Male" 1 "Female" //add labels (will make table look better)
label values female genlab //apply labels

gen visminority = vismin
recode visminority 2=0 //dummy code 0=not visible minority 1=visible minority

gen lifesat = slm_01

***recode so that "not applicable" "valid skip" "don't know" "refusal" & "not stated" == missing***
recode visminority (7=.) (8=.) (9=.)
recode mealprep (6=.) (7=.) (8=.) (9=.)
recode housework (6=.) (7=.) (8=.) (9=.)
recode dishes (6=.) (7=.) (8=.) (9=.)
recode laundry (6=.) (7=.) (8=.) (9=.)
recode grocery (6=.) (7=.) (8=.) (9=.)
recode gardening (5=.) (6=.) (7=.) (8=.) (9=.)
recode outdoorwork (5=.) (6=.) (7=.) (8=.) (9=.)
recode social (6=.) (7=.) (8=.) (9=.)
recode finance (6=.) (7=.) (8=.) (9=.)
recode lifesat (96=.) (97=.) (98=.) (99=.)

***drop participants missing on key variables by creating a sample***
egen sample_miss=rmiss (visminority female lifesat mealprep housework dishes laundry grocery gardening outdoorwork social finance)
drop if sample_miss!=0

***recode chore variables such that 0=mostly your partner/shared equally/neither and 1=mostly you 
recode mealprep 2=0 3=0 4=0
recode housework 2=0 3=0 4=0
recode dishes 2=0 3=0 4=0
recode laundry 2=0 3=0 4=0
recode grocery 2=0 3=0 4=0
recode gardening 2=0 3=0 4=0
recode outdoorwork 2=0 3=0 4=0
recode social 2=0 3=0 4=0
recode finance 2=0 3=0 4=0

***create index measure that sums the number of chores mostly done by R***
egen chores = rowtotal (mealprep housework dishes laundry grocery gardening outdoorwork social finance)
