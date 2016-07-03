data loan_info_1;
   format customer $6.
          app_date date9.
		  employee_app $2.
		  product_group $6.
		  loan_amt dollar10.0;
   customer="Molly";
   app_date="23JUL2010"d;
   employee_app="N";
   product_group="HEIL";
   loan_amt=50000;
   output;
   customer="Jimbo";
   app_date="01APR2009"d;
   employee_app="Y";
   product_group="HELOC";
   loan_amt=60000;
   output;
run;
data loan_info_2;
   format customer $8.
          app_date date9.
		  employee_app $2.
		  product_group $6.
		  loan_amt dollar10.;
   customer="Danny";
   app_date="15JAN2010"d;
   employee_app="N";
   product_group="HEIL";
   loan_amt=75000;
   output;
   customer="Bob";
   app_date="18DEC2005"d;
   employee_app="Y";
   product_group="HELOC";
   loan_amt=100000;
   output;
run;

/*     Day 3   */
data loan_info_combine;
   format customer $10.;
   set loan_info_1
       loan_info_2;
run;
      
data loan_dq;
   format past_due_days 5.0;
   set loan_info_combine;
   past_due_days=180;
run;

/*    'IF  THEN DO' Clause    */
data customer_past_due;
   format past_due_days 5.0;
   set loan_info_combine;

   if customer="Molly" then do;
      past_due_days=0;
   end;
   if customer="Jimbo" then do;
      past_due_days=35;
   end;
   if customer="Danny" then do;
      past_due_days=15;
   end;
   if customer="Bob" then do;
      past_due_days=180;
   end;

run;

/*    'IF  THEN DO' OUTPUT    */
data only_dq_loans;
   set customer_past_due;

   if past_due_days >= 30 then do;
      output;
   end;

run;
data employee_dq_loans;
   set customer_past_due;

   if employee_app="Y" and past_due_days > 0 then do;
      output;
   end;

run;
data large_past_due;
   set customer_past_due;

   if past_due_days >= 30 or loan_amt >70000 then do;
      output;
   end;

run;




