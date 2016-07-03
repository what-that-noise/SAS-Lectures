
libname customer "d:\data\192465995\My Documents\SAS Training\DATA";

data als_all;
   set customer.als201104
       customer.als201105
       customer.als201106;
run;

data als_character;
   format date_char $10.;
   set als_all;
   date_char=put(me_dt, date9.);
run;

data als_substr;
   format acct_substr $3.;
   set als_numeric;
   acct_substr=substr(acct_umk, 1, 3);
run;

data als_character;
   format score_char $4.;
   set customer.als_all;
   score_char=put(refresh_score, 4.0);
run;

data als_numeric;
   format score_num 4.0;
   set als_character;
   score_num=input(score_char, $4.);
run;

data als_substr;
   format acct_substr $4.;
   set als_numeric;
   acct_substr=substr(acct_umk, 1, 3);
run;

data als_substr_end;
   format acct_substr_end $11.;
   set als_substr;
   acct_substr_end=substr(acct_umk, 4, 11);
run;

data als_substr_compress;
   format acct_substr_compress $15.;
   set als_substr_end;
   acct_substr_compress=compress(acct_substr||acct_substr_end);
run;
