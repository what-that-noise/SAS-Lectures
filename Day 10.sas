/*   Example 1 */
%let balance=40000; 

proc sql;
   create table als_DQ_APR_HighBal_MAY as
   select *
   from customer.als_sql_April
   where acct_umk in(select distinct acct_umk
                     from customer.als_sql_May
                     where may_balance>&balance.) 
         and APR_past_due>=30;
quit;

/*   Try on your own 1 */
%let balance=60000; 
%let past_due=30;
proc sql;
   create table als_DQ_APR_HighBal_MAY as
   select *
   from customer.als_sql_April
   where acct_umk in(select distinct acct_umk
                     from customer.als_sql_May
                     where may_balance>&balance.) 
         and APR_past_due>=&past_due.;
quit;
options mlogic mprint;
/*   Try on your own 2 */
%let balance=60000; 
%let past_due=30;
%let Month=May;
proc sql;
   create table als_DQ_APR_HighBal_MAY as
   select *
   from customer.als_sql_April
   where acct_umk in(select distinct acct_umk
                     from customer.als_sql_&month.
                     where may_balance>&balance.) 
         and APR_past_due>=&past_due.;
quit;

/*   Try on your own 3 */
%let balance=75000; 
%let past_due=1;
%let Month=May;
proc sql;
   create table als_DQ_APR_HighBal_MAY as
   select *
   from customer.als_sql_April
   where acct_umk in(select distinct acct_umk
                     from customer.als_sql_&month.
                     where may_balance>&balance.) 
         and APR_past_due>=&past_due.;
quit;



data date;
   format current date9.;
   current=today();
   current_date=put(current,date9.);
run;

%let current_date=;
proc sql;
   select current_date into:current_date
   from date;
quit;
%put &current_date. ;



%let acct_high_pd=;
proc sql;
   
   select acct_umk into :acct_high_pd separated by " "
   from customer.als_sql_April
   where apr_past_due>=90;

quit;
%put &acct_high_pd. ;
















