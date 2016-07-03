libname customer "d:\data\192465995\My Documents\SAS Training\DATA";

proc sql;

   create table newtable as
   select column1, column2, column3 /* notice commas b/w columns */
   from old_data_set
   order by column1; /* notice a semicolon is used ONLY after finish designing table */

quit;

/*   ONE   */
proc sql;

   create table als_SQL_april as
   select me_dt, acct_umk, me_balance, past_due_days
   from customer.als201104
   order by acct_umk;

quit;

/*   TWO   */
proc sql;

   create table als_SQL_april as
   select me_dt, acct_umk, me_balance as APR_Balance, past_due_days as APR_Past_Due
   from customer.als201104
   order by acct_umk;

quit;

/*   THREE   */
proc sql;

   create table customer.als_SQL_april as
   select me_dt, acct_umk, me_balance as APR_Balance label="APR Balance" format dollar12.0, 
          past_due_days as APR_Past_Due label="APR Past Due"
   from customer.als201104
   order by acct_umk;

quit;


proc sql;

   create table customer.als_SQL_may as
   select me_dt, acct_umk, me_balance as MAY_Balance label="MAY_Balance" format dollar12.0, 
          past_due_days as MAY_Past_Due label="MAY_Past_Due"
   from customer.als201105
   order by acct_umk;

quit;
