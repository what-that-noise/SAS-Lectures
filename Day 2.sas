
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
data loan_info_combine;
   set loan_info_1
       loan_info_2;
run;





