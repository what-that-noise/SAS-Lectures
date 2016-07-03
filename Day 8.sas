libname customer "d:\data\192465995\My Documents\SAS Training\DATA";
/* Example  ONE   */
proc sql;
   create table als_APR_MAY as
   select l.acct_umk, l.APR_Balance, r.MAY_Balance
   from customer.als_sql_apr as l left join customer.als_sql_may as r
   on l.acct_umk=r.acct_umk;
quit;
/*   Try your own ONE   */
proc sql;
   create table als_APR_MAY as
   select l.acct_umk, l.APR_Balance format dollar15.0, r.MAY_Balance format dollar15.0
   from customer.als_sql_april as l left join customer.als_sql_may as r
   on l.acct_umk=r.acct_umk;
quit;
/*   Try your own TWO   */
proc sql;
   create table als_APR_MAY as
   select l.acct_umk, 
          l.APR_Balance format dollar15.0, 
          r.MAY_Balance format dollar15.0,
		  l.APR_past_due,
		  r.MAY_Past_Due
   from customer.als_sql_apr as l left join customer.als_sql_may as r
   on l.acct_umk=r.acct_umk;
quit;
/*   Example Two   */
proc sql;
   create table als_APR_MAY_Sum as
   select sum(l.APR_Balance) as APR_BALANCE format dollar15.0, 
          sum(r.MAY_Balance) as MAY_Balance format dollar15.0
   from customer.als_sql_april as l left join customer.als_sql_may as r
   on l.acct_umk=r.acct_umk;
quit;

/*   Try on your own 3   */
proc sql;
   create table als_APR_MAY_Ave as
   select mean(l.APR_Balance) as APR_BALANCE format dollar15.0, 
          mean(r.MAY_Balance) as MAY_Balance format dollar15.0
   from customer.als_sql_april as l left join customer.als_sql_may as r
   on l.acct_umk=r.acct_umk;
quit;
/*   Example 3   */
proc sql;
   create table als_MAY_DQ as
   select *
   from customer.als_sql_may
   where may_past_due >=30;
quit;
/*   Example 4   */
proc sql;
   create table als_APR_MAY_DQ as
   select l.acct_umk, 
          l.APR_Balance format dollar15.0, 
          r.MAY_Balance format dollar15.0,
		  l.APR_past_due,
		  r.MAY_Past_Due
   from customer.als_sql_april as l inner join als_may_DQ as r
   on l.acct_umk=r.acct_umk;
quit;
