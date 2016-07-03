/************************************************************************

                              TRAINING DATA

************************************************************************/
libname libname sasyymm '\\sew95012\wrkgrp\Consumer Risk\SAS YYMM';

data mtg201101;
   set sasyymm.mtg201101;
   if _n_<1000 then output;
run;
data mtg201102;
   set sasyymm.mtg201102;
   if _n_<1000 then output;
run;
data als201101;
   set sasyymm.als201101;
   if _n_<1000 then output;
run;
data als201102;
   set sasyymm.als201102;
   if _n_<1000 then output;
run;
data card201101;
   set sasyymm.card_201101;
   if _n_<1000 then output;
run;
data card201102;
   set sasyymm.card_201102;
   if _n_<1000 then output;
run;
