CREATE TABLE Flowers1 (
purchase_number varchar (30) PRIMARY KEY,
quantity integer,
quality varchar (30),
color varchar (30) NOT NULL,
type_of_flower varchar (30),
pooring varchar (30),
pot varchar (30),
form varchar (30),
flowerweight int,
ground varchar (30),
nutrition varchar (30),
structure varchar (30),
price integer, 
[package] varchar(200), 
arriving_date datetime,
updatecnt integer not null default 0);

CREATE TABLE Flowers2 (
purchase_number varchar (30) PRIMARY KEY,
operationtype char(1),
operationdate datetime not null default getdate(),
quantity varchar (30),
quality varchar (30),
color varchar (30) NOT NULL,
type_of_flower varchar (30),
pooring varchar (30),
pot varchar (30),
form varchar (30),
flowerweight integer,
ground varchar (30),
nutrition varchar (30),
structure varchar (30),
price integer, 
[package] varchar(200), 
arriving_date datetime);

CREATE TRIGGER T2 ON Flowers1
AFTER INSERT, UPDATE, DELETE AS
begin 
IF @@ROWCOUNT = 0 RETURN
DECLARE @operation char(1)
declare @ins int = (select count(*) from inserted)
declare @del int = (select count(*) from deleted)
SET @operation = 
case 
when @ins > 0 and @del > 0 then 'U'
when @ins = 0 and @del > 0 then 'D'
when @ins > 0 and @del = 0 then 'I'
end

if @operation = 'I' begin
insert into Flowers2 (color,operationtype,quantity)
select inserted.color, @operation, inserted.quantity from Flowers1
inner join inserted on Flowers1.color = inserted.color
end

if @operation = 'D' begin
insert into Flowers2 (color,operationtype,quantity)
select deleted.color, @operation, deleted.quantity from deleted
end

if @operation = 'U' begin
update Flowers1 set arriving_date = getdate(), updatecnt += 1 
from Flowers1 inner join inserted on Flowers1.color = inserted.color

if update(package)
insert into Flowers2 (color, operationtype, pot, form, ground)
select inserted.color, @operation, deleted.quantity, inserted.quantity, 'old' + isnull(deleted.package,'') from Flowers1
inner join inserted on Flowers1.color = inserted.color
inner join deleted on Flowers1.color = deleted.color
else 
insert into Flowers2 (color, operationtype, pot, form)
select inserted.color, @operation, deleted.quantity, inserted.quantity from Flowers1
inner join inserted on Flowers1.color = inserted.color
inner join deleted on Flowers1.color = deleted.color
end
END 
go