/*
SubContractor (SID, S_Lname, S_Fname, Salary)
Builder (BID, B_Lname, B_Fname, License) 
Neighborhood  (NID, N_Name, City)
HireInfo (BID*, SID*, HireDate) 
House (HID, H_Name, FinishDate, Price, BID*, NID*) 
*/

insert into SubContractor(S_Lname, S_Fname, Salary)
values ('lopez', 'maicol', 1000000),
        ('garcia', 'martha', 2000000),
        ('saverdra', 'nestor', 5000000),
        ('moreno', 'kike', 3500000),
        ('zarate', 'maria', 1800000),
        ('arelis', 'dario', 2500000),
        ('duarte', 'sandra', 6000000),
        ('perez', 'daniel', 4000000),
        ('arce', 'fernanda', 4500000),
        ('nuñez', 'gabriel', 3800000);
    
insert into Builder(B_Lname, B_Fname, License)
values ('puentes', 'yessica', '200101AB'),
        ('suarez', 'giberto', '200201AB'),
        ('aparicio', 'andres', '200501AB'),
        ('chavez', 'juliana', '200801AB'),
        ('torres', 'david', '200106AB'),
        ('molina', 'jennifer', '200111AB'),
        ('castillo', 'estefany', '200901AB'),
        ('navaja', 'pedro', '201808AB');

insert into Neighborhood(N_Name, City)
values ('Alameda', 'Cali'),
        ('San pablo', 'Medellin'),
        ('Restrepo', 'Bogota'),
        ('Santa maria', 'Bucaramanga'),
        ('Santa barbara', 'Cali'),
        ('bolivar', 'Bogota'),
        ('Caney', 'Cali'),
        ('Garzon', 'Huila'),
        ('Galapa', 'Barranquilla'),
        ('Santa ana', 'Manizales');

insert into HireInfo(BID, SID, HireDate) 
values (2, 3, '01-01-2015'),
        (8, 1, '01-01-2017'),
        (5, 9, '02-04-2011'),
        (7, 2, '12-09-2009'),
        (2, 8, '01-01-2019'),
        (1, 4, '11-07-2020'),
        (6, 7, '30-09-2000'),
        (7, 3, '25-10-2018'),
        (4, 10, '20-05-2021'),
        (3, 5, '12-08-2018');

insert into House(H_Name, FinishDate, Price, BID, NID)
values ('Casa moderna', '01-01-2017', 50000000, 2, 1),
        ('Casa Clasica', '09-04-2021', 60000000, 8, 2),
        ('Casa electrica', '10-11-2013', 80000000, 5, 3),
        ('Casa familiar', '20-08-2011', 90000000, 7, 4),
        ('Casa tecnologica', '30-05-2021', 70000000, 2, 5),
        ('Casa contemporanea', '15-07-2022', 150000000, 1, 6),
        ('Casa hotel', '10-09-2005', 230000000, 6, 7),
        ('Casa presidencial', '05-12-2021', 85000000, 7, 8),
        ('Casa artistica', '10-02-2022', 300000000, 4, 9),
        ('Casa de seguridad', '25-03-2020', 180000000, 3, 10);

--consultas 
select * from SubContractor;
select * from Builder;
select * from Neighborhood;
select * from HireInfo;
select * from House;

--Ejercicio No.1 Presente nombre completo de todos los subcontratistas 
--(SubContractor) que tengan un salario mayor a 3000000. Asegúrese de que se obtengan 5 registros.

select (S_Lname ||' '|| S_Fname) as full_name, Salary 
from SubContractor sb where sb.Salary::numeric > 30000000;

--Ejercicio No.2 Presente el nombre de los constructores (Builder) y 
--subcontratistas (SubContractor) que hayan sido contratados en el 2019

select (B_Lname ||' '|| B_Fname) as name_Builder, (S_Lname||' '||S_Fname) as name_SubContractor
from HireInfo join Builder(
    select * from HireInfo join SubContractor where HireDate = '2019';  
    );

--Ejercicio No.3 Presente de todos los constructores (Builder) que tiene casas en construcción, 
--el resultado en una sola columna llamada Full_Name especifica el nombre de estos constructores 
--que deben estar ordenados por apellido. Asegúrese de que se obtengan 8 registros.

