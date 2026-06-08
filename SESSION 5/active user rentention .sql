select extract (month from U.event_date) as month,
count(distinct U.user_id) as monthly_active_users
from user_actions U 
where extract(year from U.event_date)=2022
and extract(month from U.event_date)=7
and exists(
select 1 from user_actions A 
where A.user_id=U.user_id
and date_trunc('month',A.event_date) = date_trunc('month',U.event_date)
- interval '1 month')
group by month;