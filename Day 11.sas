libname customer "d:\data\192465995\My Documents\SAS Training\DATA";

/*   CREATE DATASETS ALS201104, ALS201105, ALS201106   */
data als201104;
   format DQ_Balance dollar15.0;
   set customer.als201104;
   if past_due_days>30 then do;
      DQ_Balance=me_balance;
   end;
   else do;
      DQ_Balance=0;
   end;
run;
data als201105;
   format DQ_Balance dollar15.0;
   set customer.als201105;
   if past_due_days>30 then do;
      DQ_Balance=me_balance;
   end;
   else do;
      DQ_Balance=0;
   end;
run;
data als201106;
   format DQ_Balance dollar15.0;
   set customer.als201106;
   if past_due_days>30 then do;
      DQ_Balance=me_balance;
   end;
   else do;
      DQ_Balance=0;
   end;
run;

/*   COMBINE ALL DATASETS   */
data als_all_DQ;
   set als201104
       als201105
	   als201106;
run;
proc sql;
   create table als_all_dq_change as
   select distinct me_dt, 
                   sum(me_balance) as me_balance format dollar20.0, 
                   sum(DQ_Balance) as dq_balance format dollar20.0,
                   sum(me_balance)/sum(DQ_Balance) as pct_DQ format percent8.2
   from als_all_dq
   group by me_dt;
quit;


/*********    CREATE MACRO VARIABLES TO CREATE DIFFERENT DQ TABLES    *********/     

%let past_due=30;
data als201104;
   format DQ_Balance dollar15.0;
   set customer.als201104;
   if past_due_days>&past_due. then do;
      DQ_Balance=me_balance;
   end;
   else do;
      DQ_Balance=0;
   end;
run;
data als201105;
   format DQ_Balance dollar15.0;
   set customer.als201105;
   if past_due_days>&past_due. then do;
      DQ_Balance=me_balance;
   end;
   else do;
      DQ_Balance=0;
   end;
run;
data als201106;
   format DQ_Balance dollar15.0;
   set customer.als201106;
   if past_due_days>&past_due. then do;
      DQ_Balance=me_balance;
   end;
   else do;
      DQ_Balance=0;
   end;
run;
data als_all_DQ;
   set als201104
       als201105
	   als201106;
run;
proc sql;
   create table als_all_dq_change as
   select distinct me_dt, 
                   sum(me_balance) as me_balance format dollar20.0, 
                   sum(DQ_Balance) as dq_balance format dollar20.0,
                   sum(DQ_Balance)/sum(me_balance) as pct_DQ format percent8.2
   from als_all_dq
   group by me_dt;
quit;



/*********    USE MACRO VARIABLES TO NAME DIFFERENT DQ TABLES    *********/     

%let past_due=30;
/*   CREATE DATASETS ALS201104, ALS201105, ALS201106   */
data als201104;
   format DQ_Balance dollar15.0;
   set customer.als201104;
   if past_due_days>&past_due. then do;
      DQ_Balance=me_balance;
   end;
   else do;
      DQ_Balance=0;
   end;
run;
data als201105;
   format DQ_Balance dollar15.0;
   set customer.als201105;
   if past_due_days>&past_due. then do;
      DQ_Balance=me_balance;
   end;
   else do;
      DQ_Balance=0;
   end;
run;
data als201106;
   format DQ_Balance dollar15.0;
   set customer.als201106;
   if past_due_days>&past_due. then do;
      DQ_Balance=me_balance;
   end;
   else do;
      DQ_Balance=0;
   end;
run;

/*   COMBINE ALL DATASETS   */
data als_all_DQ;
   set als201104
       als201105
	   als201106;
run;
proc sort data=als_all_dq; by acct_umk past_due_days; run;
proc sql;
   create table als_all_dq_change_&past_due. as
   select distinct me_dt, 
                   sum(me_balance) as me_balance format dollar20.0, 
                   sum(DQ_Balance) as dq_balance format dollar20.0,
                   sum(DQ_Balance)/sum(me_balance) as pct_DQ format percent8.2
   from als_all_dq
   group by me_dt;
quit;


/*********    CREATE MACRO TO AUTOMATE CREATING DQ TABLES    *********/     

%macro dq_table(past_due=);
%if &past_due ^= %then %do;



/*   CREATE DATASETS ALS201104, ALS201105, ALS201106   */
data als201104;
   format DQ_Balance dollar15.0;
   set customer.als201104;
   if past_due_days>&past_due. then do;
      DQ_Balance=me_balance;
   end;
   else do;
      DQ_Balance=0;
   end;
run;
data als201105;
   format DQ_Balance dollar15.0;
   set customer.als201105;
   if past_due_days>&past_due. then do;
      DQ_Balance=me_balance;
   end;
   else do;
      DQ_Balance=0;
   end;
run;
data als201106;
   format DQ_Balance dollar15.0;
   set customer.als201106;
   if past_due_days>&past_due. then do;
      DQ_Balance=me_balance;
   end;
   else do;
      DQ_Balance=0;
   end;
run;

/*   COMBINE ALL DATASETS   */
data als_all_DQ;
   set als201104
       als201105
	   als201106;
run;
proc sql;
   create table customer.als_all_dq_change as
   select distinct me_dt, 
                   sum(me_balance) as me_balance format dollar20.0, 
                   sum(DQ_Balance) as dq_balance format dollar20.0,
                   sum(DQ_Balance)/sum(me_balance) as pct_DQ format percent8.2
   from als_all_dq
   group by me_dt;
quit;

%end;
%else %do;
%put you idiot;
%end;

%mend dq_table;

%dq_table(past_due=30);
