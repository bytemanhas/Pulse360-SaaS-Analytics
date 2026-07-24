USE pulse360;

SELECT COUNT(*) FROM accounts;
SELECT COUNT(*) FROM subscriptions;
SELECT COUNT(*) FROM feature_usage;
SELECT COUNT(*) FROM support_tickets;

SELECT COUNT(*) AS Total_Accounts FROM accounts;

SELECT COUNT(*) AS Total_Subscriptions FROM subscriptions;

SELECT COUNT(*) AS Total_Feature_Usage FROM feature_usage;

SELECT COUNT(*) AS Total_Support_Tickets FROM support_tickets;

SELECT COUNT(*) AS Total_Churn_Events FROM churn_events;

SELECT account_id,
COUNT(*) AS Duplicate_Count
FROM accounts
GROUP BY account_id
HAVING COUNT(*) > 1;

SELECT subscription_id,
COUNT(*) AS Duplicate_Count
FROM subscriptions
GROUP BY subscription_id
HAVING COUNT(*) > 1;

SELECT
SUM(account_id IS NULL) AS Missing_Account_ID,
SUM(account_name IS NULL) AS Missing_Account_Name,
SUM(industry IS NULL) AS Missing_Industry,
SUM(country IS NULL) AS Missing_Country
FROM accounts;


SELECT
    industry,
    COUNT(*) AS total_customers
FROM accounts
GROUP BY industry
ORDER BY total_customers DESC;



SELECT
    country,
    COUNT(*) AS total_customers
FROM accounts
GROUP BY country
ORDER BY total_customers DESC;


SELECT
    plan_tier,
    COUNT(*) AS total_customers
FROM subscriptions
GROUP BY plan_tier
ORDER BY total_customers DESC;



SELECT
    plan_tier,
    ROUND(SUM(mrr_amount),2) AS total_mrr
FROM subscriptions
GROUP BY plan_tier
ORDER BY total_mrr DESC;



SELECT
    plan_tier,
    ROUND(SUM(arr_amount),2) AS total_arr
FROM subscriptions
GROUP BY plan_tier
ORDER BY total_arr DESC;



SELECT
    is_trial,
    COUNT(*) AS customers
FROM subscriptions
GROUP BY is_trial;



SELECT
    billing_frequency,
    COUNT(*) AS subscriptions
FROM subscriptions
GROUP BY billing_frequency;


SELECT
    auto_renew_flag,
    COUNT(*) AS subscriptions
FROM subscriptions
GROUP BY auto_renew_flag;


SELECT
    a.account_id,
    a.account_name,
    a.industry,
    a.country,
    s.plan_tier,
    s.seats,
    s.mrr_amount,
    s.arr_amount
FROM accounts a
INNER JOIN subscriptions s
ON a.account_id = s.account_id;


SELECT
    a.industry,
    ROUND(SUM(s.mrr_amount),2) AS Total_MRR
FROM accounts a
JOIN subscriptions s
ON a.account_id = s.account_id
GROUP BY a.industry
ORDER BY Total_MRR DESC;


SELECT
    a.country,
    ROUND(SUM(s.arr_amount),2) AS Total_ARR
FROM accounts a
JOIN subscriptions s
ON a.account_id = s.account_id
GROUP BY a.country
ORDER BY Total_ARR DESC;



SELECT
    plan_tier,
    ROUND(AVG(seats),2) AS Avg_Seats
FROM subscriptions
GROUP BY plan_tier
ORDER BY Avg_Seats DESC;



SELECT
    a.account_name,
    s.plan_tier,
    s.mrr_amount
FROM accounts a
JOIN subscriptions s
ON a.account_id=s.account_id
ORDER BY s.mrr_amount DESC
LIMIT 10;


SELECT
    a.industry,
    COUNT(*) AS Churned_Customers
FROM accounts a
JOIN churn_events c
ON a.account_id=c.account_id
GROUP BY a.industry
ORDER BY Churned_Customers DESC;


SELECT
    a.country,
    COUNT(*) AS Churned_Customers
FROM accounts a
JOIN churn_events c
ON a.account_id=c.account_id
GROUP BY a.country
ORDER BY Churned_Customers DESC;


SELECT
    reason_code,
    ROUND(SUM(refund_amount_usd),2) AS Refund_Amount
FROM churn_events
GROUP BY reason_code
ORDER BY Refund_Amount DESC;


SELECT
    ROUND(AVG(refund_amount_usd),2) AS Average_Refund
FROM churn_events;


SELECT
    a.account_name,
    s.plan_tier,
    s.mrr_amount,
    RANK() OVER(ORDER BY s.mrr_amount DESC) AS Revenue_Rank
FROM accounts a
JOIN subscriptions s
ON a.account_id = s.account_id;


SELECT *
FROM
(
SELECT
    a.industry,
    a.account_name,
    s.mrr_amount,
    ROW_NUMBER() OVER(
        PARTITION BY a.industry
        ORDER BY s.mrr_amount DESC
    ) AS rn
FROM accounts a
JOIN subscriptions s
ON a.account_id=s.account_id
) x
WHERE rn=1;



SELECT
    account_id,
    plan_tier,
    mrr_amount,

CASE
    WHEN mrr_amount>=3000 THEN 'High Value'
    WHEN mrr_amount>=1000 THEN 'Medium Value'
    ELSE 'Low Value'
END AS Customer_Category

FROM subscriptions;


SELECT

plan_tier,
account_id,
mrr_amount,

AVG(mrr_amount)
OVER(PARTITION BY plan_tier)
AS Avg_Plan_Revenue

FROM subscriptions;


SELECT

subscription_id,
start_date,
mrr_amount,

SUM(mrr_amount)
OVER(
ORDER BY start_date
)
AS Running_Revenue

FROM subscriptions;



SELECT

subscription_id,
start_date,
mrr_amount,

LAG(mrr_amount)
OVER(
ORDER BY start_date
)
AS Previous_Revenue

FROM subscriptions;


SELECT

subscription_id,
start_date,
mrr_amount,

LEAD(mrr_amount)
OVER(
ORDER BY start_date
)
AS Next_Revenue

FROM subscriptions;


SELECT

feature_name,

SUM(usage_count) AS Total_Usage,

RANK()
OVER(
ORDER BY SUM(usage_count) DESC
)
AS Feature_Rank

FROM feature_usage

GROUP BY feature_name;



SELECT

a.account_name,

s.plan_tier,

s.mrr_amount,

st.satisfaction_score,

CASE

WHEN s.mrr_amount>3000
AND st.satisfaction_score>=4
THEN 'Healthy'

WHEN s.mrr_amount>1000
THEN 'At Risk'

ELSE 'Critical'

END AS Health_Status

FROM accounts a

JOIN subscriptions s
ON a.account_id=s.account_id

LEFT JOIN support_tickets st
ON a.account_id=st.account_id;


CREATE OR REPLACE VIEW vw_customer360 AS

SELECT

a.account_id,
a.account_name,
a.industry,
a.country,
a.signup_date,

s.subscription_id,
s.plan_tier,
s.seats,
s.mrr_amount,
s.arr_amount,
s.billing_frequency,
s.auto_renew_flag,
s.is_trial

FROM accounts a

LEFT JOIN subscriptions s
ON a.account_id=s.account_id;

SELECT * FROM vw_customer360
LIMIT 20;

CREATE OR REPLACE VIEW vw_revenue_summary AS

SELECT

plan_tier,

COUNT(*) AS Customers,

SUM(mrr_amount) AS Total_MRR,

SUM(arr_amount) AS Total_ARR,

AVG(mrr_amount) AS Avg_MRR

FROM subscriptions

GROUP BY plan_tier;



SELECT * FROM vw_revenue_summary;


CREATE OR REPLACE VIEW vw_support_summary AS

SELECT

priority,

COUNT(*) AS Tickets,

AVG(resolution_time_hours) AS Avg_Resolution,

AVG(satisfaction_score) AS Avg_Satisfaction,

SUM(escalation_flag) AS Escalations

FROM support_tickets

GROUP BY priority;


CREATE OR REPLACE VIEW vw_feature_usage_summary AS

SELECT

feature_name,

SUM(usage_count) AS Total_Usage,

AVG(usage_duration_secs) AS Avg_Duration,

SUM(error_count) AS Errors

FROM feature_usage

GROUP BY feature_name;



CREATE OR REPLACE VIEW vw_churn_summary AS

SELECT

reason_code,

COUNT(*) AS Total_Churn,

SUM(refund_amount_usd) AS Total_Refund,

AVG(refund_amount_usd) AS Avg_Refund

FROM churn_events

GROUP BY reason_code;

SHOW FULL TABLES
WHERE Table_type='VIEW';