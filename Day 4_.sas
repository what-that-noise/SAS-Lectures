libname customer "d:\data\192465995\My Documents\SAS Training\DATA";

data als201104;
   format me_dt date9.;
   set customer.als201104;
   me_dt="30APR2011"d;
run;

data als201105;
   format me_dt date9.;
   set customer.als201105;
   me_dt="31MAY2011"d;
run;


data als_all;
   set work.als201104
       als201105
       customer.als201106;
run;

data customer.als_all;
   set work.als201104
       als201105
       customer.als201106;
run;


*This is a note;

