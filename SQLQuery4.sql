create database MyDataBase -- database olustruma islemi.
--drop database MyDataBase -- buda var olan databasei silmek icin kullanilir.

use MyDataBase

create table tablo_adi
(
id int,
name varchar(255),
surname nvarchar(255)
)

--- Alter table ile tablolarimizi duzenleyebiliyoruz
alter table tablo_adi
add OlusturmaTarihi datetime 

alter table tablo_adi
drop column OlusturmaTarihi -- drop column ile var olan colunu sildik

alter table tablo_adi
alter column isim nvarchar (250) --alter column ile isim adindaki columnu duzenleyebildim

 drop table tablo_adi  -- bu sekilde de tableyi silebiliriz


 -- not null constrainti

create table constraintNotNULL
(id int not null unique,
name nvarchar(50) not null,
surname nvarchar (50) not null
)

--Unique
create table constraintUnique
(id int not null unique,
name nvarchar(50),
surname nvarchar(50),
emailAdres nvarchar(100) unique

)
use AdventureWorks2017 -- i am letting know my program that i want to use adventureworks2017`s database
select top 3 -- it brings us first 3 rows
CustomerID,  -- we want to show to user customerid 
SUM(TotalDue) as TotalSales -- here with the formule of SUM() we could summed totaldue and we renamed it as totalsales

from AdventureWorks2017.Sales.SalesOrderHeader SOH -- with saying from AdventureWorks2017.Sales.SalesOrderHeader, I am letting program knows that 
--i want to get informations from sales.salesorderheader and i renamed it as soh
group by CustomerID order by TotalSales DESC -- i groupped my requesting by customer id and ordered it by totalsales with descending order which means(DESC)	

create table MyIncomeandExpenses(
Income money not null,
Expenses money not null
)
select * from dbo.MyIncomeandExpenses

insert into dbo.MyIncomeandExpenses (Income,Expenses) values(8000,5000)


--primary key (not null ve unique constraintlerini alir) foreign key ile beraber baska tablolara baglanir

--check if gibi kisitlamalar icin kullanilir.

create table constraintCheck
(id int primary key,
name nvarchar(50),
surname nvarchar(50),
emailAdres nvarchar(100) unique,
age int not null check (age>=18)
)

-- default constrainti 

create table constraintDefault
(id int primary key,
name nvarchar(50),
surname nvarchar(50),
createdAt datetime default getdate()
)

-- client isimli bir tablo olusturduk, client icin id ve clientnumber var 
create table client
(id int primary key,
clientnumber int,
name nvarchar(50),
surname nvarchar(50),
createdAt datetime
)

-- clientinfo ismninde baska bir tablo daha yaptik , clientidsini foreign key ile client idsine bagladik. bu sayede ikinci tablomuz birinci tablomuz ile bagimli hale geldi.
create table clientinfo
(id int primary key,
clientid int,
contacttyp int, --1: GSM / 2: Acik adres / 3: Sabit telefon
deger nvarchar(500),
createdAt datetime
foreign key (clientid) references client(id)
)


-- insert into icin yeni tablom
create table student
(id int primary key,
name nvarchar(50),
surname nvarchar(50),
email nvarchar(50),
)
--insert into ile kodlama yoluylada deger ekleyebildim
insert into student(id,name,surname) values (1,'Hasbi','KAYNAK')

select * from student

--update komutu
update student
set 
name = 'Olaf'
where id=1 -- where komutu koymak cok onemli aksi halde tum kolonlarimizin degerlerini aayni deger olarak degistiririz.

--delete kullanisi
delete student 
where id=1 

create table personeller (
id int primary key,
isim nvarchar(50) not null,
soyisim nvarchar(50)not null,
emailadres nvarchar(200)not null unique,
cinsiyet varchar(1),
olusturmatarih datetime not null,
durum bit default 'True'
)


INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (274, NULL, NULL, 0.0000, 0.0000, 559697.5639, 0.0000, CAST(0x00009E5A00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (275, 2, 300000.0000, 4100.0000, 0.0120, 3763178.1787, 1750406.4785, CAST(0x00009EED00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (276, 4, 250000.0000, 2000.0000, 0.0150, 4251368.5497, 1439156.0291, CAST(0x00009EED00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (277, 3, 250000.0000, 2500.0000, 0.0150, 3189418.3662, 1997186.2037, CAST(0x00009EED00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (278, 6, 250000.0000, 500.0000, 0.0100, 1453719.4653, 1620276.8966, CAST(0x00009EED00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (279, 5, 300000.0000, 6700.0000, 0.0100, 2315185.6110, 1849640.9418, CAST(0x00009EED00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (280, 1, 250000.0000, 5000.0000, 0.0100, 1352577.1325, 1927059.1780, CAST(0x00009EED00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (281, 4, 250000.0000, 3550.0000, 0.0100, 2458535.6169, 2073505.9999, CAST(0x00009EED00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (282, 6, 250000.0000, 5000.0000, 0.0150, 2604540.7172, 2038234.6549, CAST(0x00009EED00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (283, 1, 250000.0000, 3500.0000, 0.0120, 1573012.9383, 1371635.3158, CAST(0x00009EED00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (284, 1, 300000.0000, 3900.0000, 0.0190, 1576562.1966, 0.0000, CAST(0x0000A0D500000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (285, NULL, NULL, 0.0000, 0.0000, 172524.4512, 0.0000, CAST(0x0000A17A00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (286, 9, 250000.0000, 5650.0000, 0.0180, 1421810.9242, 2278548.9776, CAST(0x0000A1C700000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (287, NULL, NULL, 0.0000, 0.0000, 519905.9320, 0.0000, CAST(0x0000A02E00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (288, 8, 250000.0000, 75.0000, 0.0180, 1827066.7118, 1307949.7917, CAST(0x0000A1C700000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (289, 10, 250000.0000, 5150.0000, 0.0200, 4116871.2277, 1635823.3967, CAST(0x0000A05A00000000 AS DateTime))
INSERT [dbo].[salesperson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommissionPct], [SalesYTD], [SalesLastYear], [ModifiedDate]) VALUES (290, 7, 250000.0000, 985.0000, 0.0160, 3121616.3202, 2396539.7601, CAST(0x0000A05A00000000 AS DateTime))


create table salesperson(
BusinessEntityID int primary key,
TerritoryID int NULL,
SalesQuota money NULL,
Bonus money NOT NULL,
CommissionPct smallmoney not null,
SalesYTD money not null,
SalesLastYear money not null,
ModifiedDate datetime not null
)
select * from salesperson
where Bonus = 500 

 select * from salesperson

 select * from employee

create table employee(
BussinessEntityID int primary key,
NationalIDNumber  nvarchar(250) not null,
OrganizationNode nvarchar(250) null,
OrganizationLevel int null,
JobTitle nvarchar(250) not null,
BirthDate datetime not null,
MaritalStatus char(1) not null,
Gender char(1) not null,
HireDate datetime not null,
SalariedFlag int not null,
VacationHours int not null,
SickLeaveHours int not null,
CurrentFlag int not null,
ModifiedDate datetime not null
)
select * from employee




--farkli bir data verisini farkli bir data verisine aktariyoruz
-- ilk once inner joinle cekmek istedigimiz bilgileri cagirdik daha sonra bu tablolarda olmayan  email ve getdate gibi verileri ekleyip 
-- insert into ile ekledik
insert into personeller(id,isim,soyisim,emailadres,cinsiyet,olusturmatarih)
select 
PP.BusinessEntityID,
PP.FirstName,
PP.LastName,

(LOWER(PP.FirstName) + '.' + LOWER(pp.LastName)+'@abc.com') as emailadres,  
HRE.Gender,
GETDATE() as tarih

from AdventureWorks2017.Person.Person PP
inner join AdventureWorks2017.HumanResources.Employee HRE on PP.BusinessEntityID = HRE.BusinessEntityID

select * from personeller

create proc PersonelEkle 
(@id int,
@isim nvarchar(50),
@soyisim nvarchar(50),
@emailadres nvarchar(50),
@cinsiyet nchar(1),
@olusturmatarih datetime,
@durum bit
)
with encryption
as 
begin
insert into personeller(id,isim,soyisim,emailadres,cinsiyet,olusturmatarih,durum)
values(@id,@isim,@soyisim,@emailadres,@cinsiyet,@olusturmatarih,@durum)
return @@rowcount
end

create proc PersonelDuzenle 
(@id int,
@isim nvarchar(50),
@soyisim nvarchar(50),
@emailadres nvarchar(50)
)
with encryption
as 
begin
update personeller
set
isim=@isim,
soyisim = @soyisim,
emailadres = @emailadres
where
id=@id
return @@rowcount
end

create proc PersonelSil
(@id int
)
with encryption
as 
begin
delete personeller 
where
id=@id
return @@rowcount
end

create proc PersonelGetir
as 
begin
select * from personeller
end


create proc PersonelAraEmailAdres
(
@email nvarchar(200)
)
as 
begin
select * from personeller where emailadres=@email
end


--min max kullanimi 
select 
min(SafetyStockLevel) EnKucukDeger,
max(SafetyStockLevel) EnBuyukDeger,
Color
from Production.Product
group by Color

-- count 

select 
Color,
COUNT(*) as ToplamMiktar
from Production.Product
where color is not null group by Color
