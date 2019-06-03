use labor_sql
go
create synonym PR1 for MMROCHKO_MODULE_2.dbo.PRODUCTION1; 
create synonym CA1 for MMROCHKO_MODULE_2.dbo.CAR1; 
create synonym Fr1 for MMROCHKO_MODULE_2.dbo.Flowers1;
create synonym Fr2 for MMROCHKO_MODULE_2.dbo.Flowers2; 

select * from PR1;
select * from CA1;
select * from Fr1;
select * from Fr2;

use MMROCHKO_MODULE_2
go
create schema [MMrochko] AUTHORIZATION [dbo]
go
