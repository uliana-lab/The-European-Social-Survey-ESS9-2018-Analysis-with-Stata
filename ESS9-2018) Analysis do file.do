*setting working directory
cd "C:\Users\Kalinina_Uliana\Downloads"

cap log using final_HW, append
use "C:\Users\Kalinina_Uliana\Downloads\ESS9-2018.dta"

*filtering so that only data for Great Britain would be shown
keep if cntry=="GB"

*two categorical variables that I chose are 'gender' and 'had a paid job'; the quantitative variable is 'number of children'
codebook gndr pdjobev nbthcld
describe gndr pdjobev nbthcld
inspect gndr pdjobev nbthcld

*frequency distribution variables for categorical variables 
tab gndr
tab pdjobev
tab gndr pdjobev, row

*pie chart for variable 'gender'
graph pie, over(gndr)  plabel(_all percent, size(1*5) ///
color(white)) title ("Gender") note ("Data: ESS9-2018")

*bar graph for variable 'had a paid job'
graph hbar, over(pdjobev) ytitle ("Percent of Participants") ///
title("Had a Paid Job") blabel(ber, format(%4.1f)) note ("Data: ESS9-2018")

*summary statistics table for quantitative variable 
sum nbthcld, detail

*histogram
histogram nbthcld, normal percent title (Number of Children) ///
note ("Data: ESS9-2018")

log close
exit