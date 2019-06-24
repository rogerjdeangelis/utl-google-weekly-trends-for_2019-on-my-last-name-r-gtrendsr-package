Google weekly trends for 2019 on my last name r gtrendsr package                                
                                                                                                
I am not vain.                                                                                  
                                                                                                
*_                   _                                                                          
(_)_ __  _ __  _   _| |_                                                                        
| | '_ \| '_ \| | | | __|                                                                       
| | | | | |_) | |_| | |_                                                                        
|_|_| |_| .__/ \__,_|\__|                                                                       
        |_|                                                                                     
;                                                                                               
                                                                                                
  Search Term:  deangelis                                                                       
                                                                                                
  Time Period:  2019-01-01 2019-06-24                                                           
                                                                                                
  Country Codes:  CA US IN GB SE                                                                
                                                                                                
                  Canada                                                                        
                  USA                                                                           
                  India                                                                         
                  Great Britian                                                                 
                  Sweden                                                                        
                                                                                                
*            _               _                                                                  
  ___  _   _| |_ _ __  _   _| |_                                                                
 / _ \| | | | __| '_ \| | | | __|                                                               
| (_) | |_| | |_| |_) | |_| | |_                                                                
 \___/ \__,_|\__| .__/ \__,_|\__|                                                               
                |_|                                                                             
;                                                                                               
                                                                                                
WANT total obs=312                                                                              
                                                                                                
Obs       DATE       HITS    GEO                                                                
                                                                                                
  1    2019-01-01     33     CA                                                                 
  2    2019-01-02     64     CA                                                                 
  3    2019-01-07     31     CA                                                                 
  4    2019-01-11     35     CA                                                                 
...                                                                                             
                                                                                                
                                                                                                
Analysis Variable : HITS                                                                        
                                                                                                
2019-01-01 2019-06-24                                                                           
                                                                                                
                                                                                                
GEO     Days         Sum                                                                        
-------------------------                                                                       
CANADA   88        3,325                                                                        
                                                                                                
ENGLAND  34          625                                                                        
                                                                                                
INDIA    24          171                                                                        
                                                                                                
SWEDEN    6          563   * in 6 days                                                          
                                                                                                
US      172        3,085                                                                        
-------------------------                                                                       
                                                                                                
                                                                                                
HITS                                                                                            
500 +   HITS First 26 Weeks of 2019                                                             
    |                                                                                           
    |                                                                                           
400 +       **             *                                                                    
    |      *  *      **     *                                                                   
    |                     *                                                                     
300 +     *    *    *  **    *                                                                  
    |    *        *           *  *                                                              
    |   *                       *                                                               
200 +           **                                                                              
    |                                                                                           
    |                                                                                           
100 +--+---------+---------+------+-                                                            
       0        10        20     26                                                             
                                                                                                
                    WEEK                                                                        
                                                                                                
*                                                                                               
 _ __  _ __ ___   ___ ___  ___ ___                                                              
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                             
| |_) | | | (_) | (_|  __/\__ \__ \                                                             
| .__/|_|  \___/ \___\___||___/___/                                                             
|_|                                                                                             
;                                                                                               
                                                                                                
%utl_submit_r64('                                                                               
library(gtrendsR);                                                                              
library(SASxport);                                                                              
library(data.table);                                                                            
res <- gtrends("deangelis",                                                                     
   geo = c("CA","US","IN","SE","GB"),                                                           
   time="2019-01-01 2019-06-24");                                                               
want<-as.data.table(res$interest_over_time);                                                    
write.xport(want,file="d:/xpt/want.xpt");                                                       
');                                                                                             
                                                                                                
libname xpt xport "d:/xpt/want.xpt";                                                            
data want;                                                                                      
  format date yymmdd10.;                                                                        
  set xpt.want(where=(hits>0));                                                                 
  date=datepart(date);                                                                          
  drop time keyword gprop category;                                                             
run;quit;                                                                                       
libname xpt clear;                                                                              
                                                                                                
/*                                                                                              
WANT total obs=318                                                                              
                                                                                                
Obs       DATE       HITS    GEO                                                                
                                                                                                
  1    2019-01-01     33     CA                                                                 
  2    2019-01-02     64     CA                                                                 
  3    2019-01-07     31     CA                                                                 
  4    2019-01-11     35     CA                                                                 
  5    2019-01-18     34     CA                                                                 
  6    2019-01-21     30     CA                                                                 
                                                                                                
proc means data=want sum;                                                                       
  class geo;                                                                                    
  var hits;                                                                                     
run;quit;                                                                                       
*/                                                                                              
                                                                                                
proc sql;                                                                                       
  create                                                                                        
    table want_world(where=(hits>100)) as                                                       
  select                                                                                        
      monotonic() as week                                                                       
     ,sum(hits)  as hits                                                                        
  from                                                                                          
      want                                                                                      
  group                                                                                         
      by week(date)                                                                             
;quit;                                                                                          
                                                                                                
options ls=64 ps=24;                                                                            
proc plot data=want_world(rename=hits=hits1111111111);;                                         
  plot hits1111111111*week='*';                                                                 
run;quit;                                                                                       
                                                                                                
