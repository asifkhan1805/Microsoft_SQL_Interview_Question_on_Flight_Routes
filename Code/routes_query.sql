-- You need to find all possible routes between New York and Tokyo.  Here are conditions :
-- 1 - Route can be a direct flight 
-- 2 - or there can be an indirect route with 1 stop at most.

with allflights as ( select f.flight_id, f.start_port, a.city_name as start_city, f.end_port, b.city_name as end_city, f.start_time, f.end_time
from flights1 f
join airports a on f.start_port= a.port_code
join airports b on f.end_port= b.port_code
where a.city_name= 'New York' or b.city_name= "Tokyo")

select flight_id, start_city, null as middle_city, end_city, timestampdiff(minute, start_time, end_time) as duration
from allflights
where start_city='New York' and end_city= "Tokyo"
union all
select concat(a.flight_id, "," , b.flight_id) id, a.start_city as trip_start_city, a.end_city as trip_middle_City, b.end_city as trip_end_city,
		timestampdiff(minute, a.start_time, b.end_time ) as duration
from(
select *, 1 as id
from allflights
where start_city = "New York") a
join 
(select *, 2 as id
from allflights
where end_city = "Tokyo") b on a.end_city = b. start_city
where a.end_time <= b. start_time;