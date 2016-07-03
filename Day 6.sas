libname customer "d:\data\192465995\My Documents\SAS Training\DATA";

data als_subset;
   set customer.als_all;
   if acct_umk="A8118100004814" then  do;
   output;
   end;
run;


data als_cumulate;
   format cum_balance dollar10.0;
   set als_subset;
   retain Cum_balance 0;
   Cum_balance=Cum_balance+me_balance;
run;

proc sort data=customer.als_all; 
          by acct_umk me_dt;
run;

data als_cumulate2;
   format cum_balance dollar10.0;
   set customer.als_all;
   by acct_umk;
   if first.acct_umk=1 then do;
   cum_balance = me_balance;
   end;
   else do;
   retain cum_balance;
   cum_balance=cum_balance+me_balance;
   end;
run;
