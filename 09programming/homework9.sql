--Mark Davis
--homework 10, cs342
--April 14, 2017


--Exercise 1

select m.name
from Movie m, Director d, MovieDirector md
where d.firstName='Clint' and
	d.lastName='Eastwood' and
	d.id=md.directorId and
	m.id=md.movieId;

--Instead of using Clint Eastwood's name, I could've used his id number but I do not know the id.
--So I couldn't ran a query to return the id associated with Clint Eastwood then run the homework query.
--I did not use indexes since Oracle already has indexes for primary keys


--Exercise 2

select d.firstName, d.lastName, sum(m.id)
from Movie m, Director, MovieDirector md
where m.id=md.movieId and
	d.id=md.directorId
group by d.firstName, d.lastName
having sum(m.id) > 200;

--I could've used a full join here instead of an inner join but an inner join is more efficient 
--I did not use indexes since Oracle already had indexes for primary keys.


--Exercise 3

select a.firstName, a.lastName, count(m.id)
from Actors a, Movies m, Role r
where a.id=r.actorId and
	m.id=r.movieId and
	m.rank > 8.5
group by a.firstName, a.lastName
having count(m.id) > 10;

--Again, I could've used a full join but an inner join is more efficient.
--I did not use indexes since Oracle already uses indexes for primary keys.