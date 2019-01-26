create database Jyothi_Software_Project
use Jyothi_Software_Project

create table tbl_Files
(
SKU varchar(100) not null primary key,
Asin varchar(10) not null ,
Condition varchar(100) not null  check (Condition in ('New','Used')),
Title varchar(75) not null ,
Quantity int not null,
Price int not null check (Price>0)
)

Create Proc Proc_AddFiles
(@sku varchar(100),@asin varchar(100),@condition varchar(100),@title varchar(100),@quantity int,@price int)
as
begin
declare @count int 
select @count=count(*) from tbl_Files where SKU=@sku
if(@count=0)
begin
insert tbl_Files values(@sku,@asin,@condition,@title,@quantity,@price)
end
return @count -- it will be added if it count is 0
end

Select * from tbl_Files

delete tbl_Files