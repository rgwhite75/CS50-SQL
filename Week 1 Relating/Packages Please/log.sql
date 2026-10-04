
-- *** The Lost Letter ***
--checking the address of the lost letter
select *
from addresses
where address = '900 Somerville Avenue'

--checking the address supplied
--there is nothing at the given address
select *
from addresses
where address = '2 Finnegan Street'

--find where the letter was sent to
--it was sent to address Id 854
select *
from packages p
where from_address_id in (select id from addresses
            where address = '900 Somerville Avenue')
and contents = 'Congratulatory letter'

--where was the package dropped off
--dropped off at address id 854
select *
from scans
where package_id=384

--look at the actual address to where the letter was sent to
--it was sent to '2 Finnigan Street'
select *
from addresses
where id = 854

-- *** The Devious Delivery ***
--since there is no From address, need to look for a package where the FROM address ID is null
--is supposed to be sent to address id 50
--package id --5098
select * from packages
where from_address_id is null
limit 10

--where was it sent
--dropped off id 348
select *
from scans
where package_id=5098
order by timestamp asc

--look at that address to see where it was dropped off
select *
from addresses
where id=348





-- *** The Forgotten Gift ***
--was sent to
select * from addresses
where address='728 Maple Place'

--was sent from
select * from addresses
where address='109 Tileston Street'

--see where the package was being sent to
select *
from packages
where from_address_id in (select id from addresses
                where address='109 Tileston Street' )

--see where the package was scanned and where it was
--it was picked up a second time and with driver 17

select *
from scans
where package_id=9523
order by timestamp asc

select *
from drivers
where id=17
