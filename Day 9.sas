libname customer "d:\data\192465995\My Documents\SAS Training\DATA";

/*   Example  1 */
proc sql;
   create table als_APR_DQ_in_MAY as
   select *
   from customer.als_sql_April
   where acct_umk in(select distinct acct_umk
                     from customer.als_sql_May
                     where May_past_due>=30);
quit;

/*   Try on your own  1 */
proc sql;
   create table als_APR_HighBal_MAY as
   select *
   from customer.als_sql_April
   where acct_umk in(select distinct acct_umk
                     from customer.als_sql_May
                     where May_balance>40000);
quit;

/*   Try on your own  2 */
proc sql;
   create table als_DQ_APR_HighBal_MAY as
   select *
   from customer.als_sql_April
   where acct_umk in(select distinct acct_umk
                     from customer.als_sql_May
                     where May_balance>40000) 
         and APR_past_due>=30;
quit;

/*   Try on your own  2 Alternate */
proc sql;
   create table als_DQ_APR_HighBal_MAY_Alt as
   select *
   from customer.als_sql_April
   where acct_umk in(select distinct acct_umk
                     from customer.als_sql_May
                     where May_balance>40000 
                           and acct_umk in(select distinct acct_umk
                                           from customer.als_sql_april
                                           where APR_past_due>=30));
quit;

/*   Example 1 */
proc sql;
   create table New_table as
   select *,
        CASE
		   when condition1 is true then "Value1"
		   when condition2 is true then "Value2"
		END as New_Variable
   from old_table;
quit;

proc sql;
   create table ALS_DQ_Buckets as
   select *,
        CASE
		   when 30<=APR_past_due<=59 then "30-59"
		   when 60<=APR_past_due<=89 then "60-89"
		   when APR_past_due>=90 then "90+"
		END as Past_Due_Bucket
   from als_DQ_APR_HighBal_MAY;
quit;

/*   Try on your own 3   */
proc sql;
   create table ALS_April_DQ_Buckets as
   select *,
        CASE
		   when 0<=APR_past_due<=29 then "0-29"
		   when 30<=APR_past_due<=59 then "30-59"
		   when 60<=APR_past_due<=89 then "60-89"
		   when 90<=APR_past_due<=119 then "90-120"
		   when APR_past_due>=120 then "120+"
		END as Past_Due_Bucket
   from customer.als_SQL_April;
quit;
