USE MMROCHKO_MODULE_2;
CREATE TABLE PRODUCTION1 (
order_number integer,
inserted_date datetime NULL,
updated_date datetime NULL,
items_sold integer NOT NULL,
buyer varchar (30) NULL,
deliver_date datetime NULL,
producer varchar (30) NULL,
brand_of_item varchar (30) NULL,
car_number varchar (30) NOT NULL,
items_bought integer constraint details1 default (0),
certification_number integer,
constraint details2 check (items_sold >1),
constraint details3 primary key clustered (order_number),
constraint details4 unique (certification_number));

CREATE TABLE CAR1 (
certification_number integer constraint details5 foreign key references PRODUCTION1(certification_number),
color varchar(30) NULL,
brand varchar (30) NULL,
transported_items integer NOT NULL,
driver varchar (30) NULL,
license varchar (30) NULL,
old_VS_new varchar (30) NULL,
days_in_use integer NULL,
with_VS_without_turbine varchar (30) NULL,
wheels varchar (30) NULL,
inserted_date datetime NULL,
updated_date datetime NULL,
items_bought integer constraint details6 default (0),
);

CREATE TRIGGER T1 ON PRODUCTION1
AFTER UPDATE AS
begin 
update CAR1
set updated_date = getdate() from PRODUCTION1;
END

CREATE VIEW dbo.staff1
(order_number, inserted_date, updated_date, items_sold,buyer, deliver_date, producer,brand_of_item, car_number,items_bought,certification_number)
as 
select order_number, inserted_date, updated_date, items_sold,buyer, deliver_date, producer,brand_of_item, car_number,items_bought,certification_number from dbo.PRODUCTION1;

CREATE VIEW dbo.staff2
(car_number, color, brand, transported_items,driver,license, old_VS_new,days_in_use,with_VS_without_turbine,wheels) 
as 
select
car_number, color, brand, transported_items,driver,license, old_VS_new,days_in_use,with_VS_without_turbine,wheels from dbo.CAR1

CREATE VIEW dbo.staff3
(order_number, inserted_date, updated_date, items_sold,buyer, deliver_date, producer,brand_of_item, car_number,certification_number) 
as 
select
order_number, inserted_date, updated_date, items_sold,buyer, deliver_date, producer,brand_of_item, car_number,certification_number from dbo.PRODUCTION1
where items_sold = 1000