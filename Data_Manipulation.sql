SELECT * FROM BANKLOAN;
 
 -- 1. What is the Total Loan Applications? 
 
SELECT count(id) as Total_Loan_Applications from bankloan;

 -- 2. What is the Month-to-Date (MTD) Loan Applications?

SELECT count(id) as MTD_Total_Loan_Applications from bankloan
WHERE month(issue_date)= 12 and year(issue_date)=2021 ;
 
  -- 3. What is the Previous-Month-to-Date (MTD) Loan Applications?
 
SELECT count(id) as PMTD_Total_Loan_Applications from bankloan
WHERE month(issue_date)= 11 and year(issue_date)=2021 ;

  -- 4. What is the Total Funded Amount ?
  
  SELECT sum(loan_amount) as Total_Funded_Amount from bankloan;

 -- 5. What is the Month-to-Date (MTD) Total Funded Amount?

SELECT sum(loan_amount) as MTD_Total_Funded_Amount from bankloan
WHERE month(issue_date)= 12 and year(issue_date)=2021 ;

-- 6. What is the Previous-Month-to-Date (MTD) Total Funded Amount?

SELECT sum(loan_amount) as PMTD_Total_Funded_Amount from bankloan
WHERE month(issue_date)= 11 and year(issue_date)=2021 ;

-- 7. What is the Total Amount Received?

SELECT sum(total_payment) as Total_Amount_Received from bankloan;

 -- 8. What is the Month-to-Date (MTD) Total Amount Received?

SELECT sum(total_payment) as MTD_Total_Amount_Recieved from bankloan
WHERE month(issue_date)= 12 and year(issue_date)=2021 ;

-- 9. What is the Previous-Month-to-Date (MTD) Total Amount Received?

SELECT sum(total_payment) as PMTD_Total_Amount_Recieved from bankloan
WHERE month(issue_date)= 11 and year(issue_date)=2021 ;

-- 10. What is the Average Interest Rate?

SELECT round(Avg(int_rate),2) as Average_int_rate from bankloan;

 -- 11. What is the Month-to-Date (MTD) Average int rate?

SELECT round(Avg(int_rate) *100,2) as MTD_Average_int_rate from bankloan
WHERE month(issue_date)= 12 and year(issue_date)=2021 ;

-- 12. What is the Previous-Month-to-Date (MTD) Average int rate?

SELECT round(Avg(int_rate) * 100,2) as PMTD_Average_int_rate from bankloan
WHERE month(issue_date)= 11 and year(issue_date)=2021 ;

-- 13. What is the Average dti rate ?

select round(avg(dti)* 100,2) as Average_dti_rate from bankloan;

-- 14. What is the Month-to-Date (MTD) Average dti rate ?

select round(avg(dti)* 100,2) as MTD_Average_dti_rate from bankloan
where month (issue_date)=12 and year(issue_date)=2021;

-- 15. What is the Previous-Month-to-Date (MTD) Average dti rate ?

select round(avg(dti)* 100,2) as PMTD_Average_dti_rate from bankloan
where month (issue_date)=11 and year(issue_date)=2021;

-- 16. What is the Good loan percentage ?

select round((count(case when loan_status = 'Fully Paid' or loan_status = 'current' then id end) * 100)
/
count(id),2) AS good_loan_percentage from bankloan;

-- 17. What is the Good loan application?

SELECT count(ID) AS good_loan_application from bankloan
where loan_status = 'Fully Paid' or loan_status = 'current';

-- 18. What is the Good loan funded amount?

SELECT sum(loan_amount) AS good_loan_funded_amount from bankloan
where loan_status = 'Fully Paid' or loan_status = 'current';

-- 19. What is the Good loan recieved amount?

SELECT sum(total_payment) AS good_loan_amount_recieved from bankloan
where loan_status = 'Fully Paid' or loan_status = 'current';

-- 20. What is the Bad loan percentage ?

select round((count(case when loan_status = 'charged off' then id end)*100)
/
count(id),2) AS bad_loan_percentage from bankloan;

-- 21. What is the Bad loan application?

SELECT count(ID) AS bad_loan_application from bankloan
where loan_status = 'charged off';

-- 22. What is the Bad loan funded amount?

SELECT sum(loan_amount) AS bad_loan_funded_amount from bankloan
where loan_status = 'charged off';

-- 23. What is the Bad loan recieved amount?

SELECT sum(total_payment) AS bad_loan_recieved_amount from bankloan
where loan_status = 'charged off';

-- 24. Loan Status Grid View ?

SELECT
        loan_status,
        COUNT(id) AS Total_loan_application,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate) AS Interest_Rate,
        AVG(dti) AS DTI
    FROM
        bankloan
    GROUP BY
        loan_status ;
      
-- 25. Monthly Trends by Issue Date?

SELECT 
	MONTH(issue_date) AS Month_Number, 
	monthname(issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bankloan
GROUP BY MONTH(issue_date), monthname(issue_date)
ORDER BY MONTH(issue_date);

-- 26. Regional Analysis by State?

SELECT 
	address_state, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bankloan
GROUP BY address_state
ORDER BY Total_Loan_Applications desc ;

 -- 27.Loan Term Analysis?

SELECT 
	term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bankloan
GROUP BY term
ORDER BY term ;

-- 28.Employee Length Analysis? 

SELECT 
	emp_length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bankloan
GROUP BY emp_length
ORDER BY Total_Loan_Applications desc  ;

-- 29.Loan Purpose Breakdown?

SELECT 
	purpose, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bankloan
GROUP BY purpose
ORDER BY Total_Loan_Applications desc  ;

-- 30.Home Ownership Analysis?

SELECT 
	home_ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bankloan
where grade='A' and address_state = 'CA'
GROUP BY home_ownership
ORDER BY Total_Loan_Applications desc  ;




