 --    select * from Person.Person -- its allow us to bring our all relative tables and exacute.

select 
Name,ProductNumber,Color,ProductID


from Production.Product

--to merge all columns we use + operator
select Title, FirstName + ' ' + LastName from Person.Person

--to rename the things we use;
select Title as Baslik, FirstName + ' ' + LastName  [isim soyisim]from Person.Person
-- to show first 10 rows we use top 10 method.
select top 10  Title as unvan , FirstName + ' ' + LastName [tam isim] from Person.Person

-- this is how to use "where" 
select * from Person.Person where FirstName = 'Ken'
select Name,ProductNumber,Color from Production.Product where Color = 'Black'

-- and operator is use as "and" 
select * from Production.Product where Color = 'Black' and SafetyStockLevel = 500

-- or operator is use as "or"
select * from Production.Product where Color = 'Black' or SafetyStockLevel = 500

-- > greater operator
select * from Production.Product where SafetyStockLevel > 500

-- >= greater and equels operator
select * from Production.Product where SafetyStockLevel >= 500

-- < less operator
select * from Production.Product where SafetyStockLevel < 500

-- <= less and equels operator
select * from Production.Product where SafetyStockLevel <= 500

-- != not equels operator
select * from Production.Product where SafetyStockLevel != 500

select  * from Production.Product
-- Freestyle worksheet
select top 10 * from Production.Product where Color = 'Yellow' or Color = 'Black'  
select Color,ProductID ,Name+ '      ' + ProductNumber as [Name ProductNumber]	 from Production.Product where Color = 'Multi' and StandardCost > 6
select top 10 percent * from Production.Product where ListPrice > 0


--- Like 
--- name of colomn like '%a' means bring me the list of whatever first letters are but last letter must be a 
--- name of colomn like 'a%' means bring me the list of whatever last letters are but first letter must be a
--- name of colomn like '%a%' means bring me the list of whatever last and first letters are but it  must be contains a in it
--- name of the colomn like '_a' means bring me the list of whatever first letter is but second letter must be a 

--- like '%a'
select ProductNumber, Name,ProductID from Production.Product where ProductNumber like '%1'
--- like b%
select ProductNumber, Name,ProductID from Production.Product where ProductNumber like '1%'
--- like %R%
select ProductNumber, Name,ProductID from Production.Product where ProductNumber like '%R%'
---- like _K
select ProductNumber, Name,ProductID from Production.Product where ProductNumber like '_K-_64Y-40'


--- Freestyle Worksheet 2 ------
select * from HumanResources.Employee where NationalIDNumber like '%96%' and JobTitle like 'Research%' and Gender = 'M'

select * from sales.SalesOrderDetail where ProductID > 100 and ProductID < 1000 and CarrierTrackingNumber like '%AE'

--- using In and Not In 
select * from Production.Product where ProductNumber In('AR-5381','BA-8327', 'BE-2349') 
select * from Production.Product where ProductNumber Not In ( 'CN-6137','CB-2901')

--- using order by 
select * from Production.Product  order by ProductID desc --desc -- orders our list reverse 
select * from Production.Product order by ProductID

---using group by 
select Color, SUM(SafetyStockLevel) as SafetyStockLevelSum, AVG(ListPrice) ListPriceAvg  from Production.Product
where Color is not null and Color != 'Black' 
group by Color


--using group by having
select Color, SUM(SafetyStockLevel) as safetystocklevelSum , AVG(ListPrice) listpriceAvg from Production.Product
group by Color
having Color is not null

--using distinct
select * from Production.Product -- it shows us all colors in one colomn and just for once

select ProductID, ProductNumber, Name,  Color from Production.Product
where ProductID in(
select distinct ProductID from Sales.SalesOrderDetail
) -- we actually merge to 2 different values of tables in here.

select  Color, SUM(ListPrice)as listpriceSum from Production.Product
where ProductID in(
select distinct ProductID from Sales.SalesOrderDetail
)
group by Color

--using between method, it shows us between 1 and 500 
select * from Production.Product where ProductID between 1 and 500

--using inner join on method
select * from Person.Person inner join HumanResources.Employee on Person.BusinessEntityID = Employee.BusinessEntityID

--Here we recalled our tables as PP and HRE, We bring requested columns from PP and HRE.
select PP.BusinessEntityID, PP.FirstName,PP.LastName,PP.PersonType,HRE.BirthDate,HRE.JobTitle,HRE.MaritalStatus
from Person.Person as PP inner join HumanResources.Employee HRE on PP.BusinessEntityID = HRE.BusinessEntityID

--using left join
select PP.ProductID, PP.Name, PP.ProductNumber, ssd.*
from Production.Product as PP left join Sales.SalesOrderDetail SSD 
on PP.ProductID = SSD.ProductID

select PP.Color, SUM(SSD.UnitPrice) [Toplam satis] from Production.Product PP left join Sales.SalesOrderDetail SSD 
on pp.ProductID = ssd.ProductID
group by Color

--freestyle worksheet 3---
select   ProductCategoryName,
ProductSubCategoryName, 
count(ProductID) ProductCount,
SUM(ListPrice) ProductListPriceSum
from(
select
PP.ProductID, PP.Name ProductName, PP.Color ProductColor, PC.Name ProductCategoryName, PSC.Name ProductSubCategoryName, PP.ListPrice
from
Production.Product PP
left join Production.ProductSubcategory PSC
on PP.ProductSubcategoryID = PSC.ProductSubcategoryID --inner ile sadece birbirleri ile uyusan degerleri cagirdim
left join Production.ProductCategory PC
on psc.ProductCategoryID = PC.ProductCategoryID)ResulTable
group by ProductCategoryName,
ProductSubCategoryName 
having 
ProductCategoryName is not null







