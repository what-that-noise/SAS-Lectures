libname t 'd:\data\192465995\My Documents\SAS Training\DATA';
libname sasall '\\sew95012\wrkgrp\Consumer Risk\SAS YYMM\SAS_ALL';
libname sasym '\\sew95012\wrkgrp\Consumer Risk\SAS YYMM';
libname sasyymm (sasym sasall);
data als201106;
   set sasyymm.als201106 (keep = me_dt me_balance Refresh_Score Coff_Ind ALS_LEGAL_STAT credit_limit acct_umk lien_type NA_Flag Past_Due_Days product_group);
   where ranuni(0)<0.01;
run;
data als201105;
   set sasyymm.als201105 (keep = me_dt me_balance Refresh_Score Coff_Ind ALS_LEGAL_STAT credit_limit acct_umk lien_type NA_Flag Past_Due_Days product_group);

run;
data als201104;
   set sasyymm.als201104 (keep = me_dt me_balance Refresh_Score Coff_Ind ALS_LEGAL_STAT credit_limit acct_umk lien_type NA_Flag Past_Due_Days product_group);

run;
proc sql;
   create table t.als201106 as
   select *
   from als201106
   where acct_umk in(select distinct acct_umk
                     from als201105)
		 and acct_umk in(select distinct acct_umk
                     from als201104);

   create table t.als201105 as
   select *
   from als201105
   where acct_umk in(select distinct acct_umk
                     from t.als201106);

   create table t.als201104 as
   select *
   from als201104
   where acct_umk in(select distinct acct_umk
                     from t.als201106);
quit;

libname customer 'd:\data\192465995\My Documents\SAS Training\DATA';
