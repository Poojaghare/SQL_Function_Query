--Fuctions
--Build in fuctions
--Customer Defind Fuctions

--------------------(1)Build In FUCNTIONS IN SQL----------------------------

--We have 'networking' we want 'working' name frome column so write SUBSTRING Query

select SUBSTRING(Empdesignation,1,3)as Test from Emp where EmpId=10

--'CONCAT' used to two name add

select CONCAT(EmpName,'  ',Empdesignation) as ConcatData from Emp

--'len' used to count length of given column name string

select EmpName, len(EmpName) as 'length of name' from Emp

--'Rtrim' remove right space
--'Ltrim' remove right space

select Rtrim(EmpName) from Emp where EmpId=11
select Ltrim(EmpName) from Emp where EmpId=13

--remove space from left and right side

select trim(EmpName) from Emp

--REVERSE used to reverse string

select REVERSE(EmpName) from Emp

--REPLACE string alphabate given name

select*from Emp

select REPLACE(EmpName,'v','t') from Emp where EmpId=4

-- instr is used to find the occourance of given char in a string

select charindex('i',EmpName) from Emp where EmpId=7

--User defined functions in SQL

create function Addition(@a int,@b int)
returns int
as 
begin
declare @c int
set @c=@a+@b
return @c
end

select dbo.Addition(10,20) as result

---------Task Even Or Odd-----

create function EvenOrOdd(@num int)
returns varchar(10)
as begin
declare @functionIs varchar(10)
set @functionIs = ''
if( @num%2=0)
 set @functionIs='Even' 
else
 set @functionIs='odd'
return @functionIs
end

select dbo.EvenOrOdd(6) as result

--record set / returns the table / table valued function
create function getAllEmp(@id int)
returns table
as
return (select * from Emp where EmpId=@id)
end
select * from MyDatabase.dbo.getallemp(103);

--scalar function
create function getnamefromemp2()
returns varchar(50)
as
begin
return (select EmpName from Emp where EmpId=6)
end;

select MyDatabase.dbo.getnamefromemp2() as ename;

----------Task Find Greater Then or Less Then value using Gucntion

alter FUNCTION is_greater
	( 
		@a AS INT,
		@b AS INT
	)
	RETURNS VARCHAR(30)
	AS
	BEGIN
	RETURN( 'A is ' + 
	CASE
		-- Case 1
		WHEN @a > @b THEN 'Greater than'
		-- Case 2
		WHEN @a < @b THEN 'Smaller than'
		ELSE 'Equal to'
	END
	+ ' B')
	END;

