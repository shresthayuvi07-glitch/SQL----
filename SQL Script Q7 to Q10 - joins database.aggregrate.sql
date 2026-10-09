use joins; 

-- Q7. Joins(Library): total fine per member(joins + GROUPBY). Members with no loans must show 0. which joins?
select m.member_id, m.mname, 
sum(l.fine) as total_fine 
from members as m 
left join loans as l 
on m.member_id = l.member_id 
group by m.member_id, m.mname; 

-- Q8. Joins(Library): members whose total fine is above 100(HAVING) 
select m.member_id, m.mname, 
sum(l.fine) as total_fine 
from members as m 
left join loans as l 
on m.member_id = l.member_id 
group by m.member_id, m.mname
having total_fine >= 100; 

-- Q9. COUNT(*) vs COUNT(fine): make one final NULL and show the difference. 
select 
count(*) as total_rows, 
count(fine) as fine_not_null 
from loans; 
 
-- Q10. In one sentence: why can HAVING see COUNT(*) but WHERE cannot? 
-- Answer: HAVING runs after GROUPBY so it can see COUNT(*), While WHERE runs before GROUPBY 
-- so, COUNT(*) doesnot exist yet. 

