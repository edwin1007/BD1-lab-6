/*
Laboratorio 6
Integrantes:
Edwin Leonardo Cuaran   1910252
Diego Fabián Ledesma    1928161
*/

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



--En pgAdmin:
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

/*En la versión contenerizada de Postgres, 
las fechas se introducen con otro formato: 
*/
insert into HireInfo(BID, SID, HireDate) 
values (2, 3, '01-01-2015'),
        (8, 1, '01-01-2017'),
        (5, 9, '04-02-2011'),
        (7, 2, '09-12-2009'),
        (2, 8, '01-01-2019'),
        (1, 4, '07-11-2020'),
        (6, 7, '09-30-2000'),
        (7, 3, '10-25-2018'),
        (4, 10, '05-20-2021'),
        (3, 5, '08-12-2018');





--en pgAdmin:

insert into House(H_Name, FinishDate, Price, BID, NID)
values ('Casa moderna', '01-01-2023', 50000000, 2, 1),
        ('Casa Clasica', '09-04-2024', 60000000, 8, 2),
        ('Casa electrica', '10-11-2022', 80000000, 5, 3),
        ('Casa familiar', '20-08-2022', 90000000, 7, 4),
        ('Casa tecnologica', '30-05-2024', 70000000, 2, 5),
        ('Casa contemporanea', '15-07-2025', 150000000, 1, 6),
        ('Casa hotel', '10-09-2025', 230000000, 6, 7),
        ('Casa presidencial', '05-12-2022', 85000000, 7, 8),
        ('Casa artistica', '10-02-2023', 300000000, 4, 9),
        ('Casa de seguridad', '25-03-2024', 180000000, 3, 10);


--en la versión contenerizada:
insert into House(H_Name, FinishDate, Price, BID, NID)
values ('Casa moderna', '01-01-2023', 50000000, 2, 1),
        ('Casa Clasica', '04-09-2024', 60000000, 8, 2),
        ('Casa electrica', '11-10-2022', 80000000, 5, 3),
        ('Casa familiar', '08-20-2022', 90000000, 7, 4),
        ('Casa tecnologica', '05-30-2024', 70000000, 2, 5),
        ('Casa contemporanea', '07-15-2025', 150000000, 1, 6),
        ('Casa hotel', '09-10-2025', 230000000, 6, 7),
        ('Casa presidencial', '12-05-2022', 85000000, 7, 8),
        ('Casa artistica', '02-10-2023', 300000000, 4, 9),
        ('Casa de seguridad', '03-25-2024', 180000000, 3, 10);



--consultas 
select * from SubContractor;
select * from Builder;
select * from Neighborhood;
select * from HireInfo;
select * from House;

--Ejercicio No.1 Presente nombre completo de todos los subcontratistas 
--(SubContractor) que tengan un salario mayor a 3000000. Asegúrese de que se obtengan 5 registros.

select (S_Lname ||' '|| S_Fname) as full_name, Salary 
from SubContractor sb where sb.Salary::numeric > 3000000;

--Ejercicio No.2 Presente el nombre de los constructores (Builder) y 
--subcontratistas (SubContractor) que hayan sido contratados en el 2019

select (B_Lname ||' '|| B_Fname) as name_Builder, (S_Lname||' '||S_Fname) as name_SubContractor
from Builder bl join (
    select * from HireInfo hi join SubContractor sc
    on hi.SID = sc.SID where hi.HireDate between '01-01-2019' and '31-12-2019'
    ) sb on bl.BID = sb.BID;

--En la versión contenerizada:
select (B_Lname ||' '|| B_Fname) as name_Builder, (S_Lname||' '||S_Fname) as name_SubContractor
from Builder bl join (
    select * from HireInfo hi join SubContractor sc
    on hi.SID = sc.SID where hi.HireDate between '01-01-2019' and '12-31-2019'
    ) sb on bl.BID = sb.BID;





--Ejercicio No.3 Presente de todos los constructores (Builder) que tiene casas en construcción, 
--el resultado en una sola columna llamada Full_Name especifica el nombre de estos constructores 
--que deben estar ordenados por apellido. Asegúrese de que se obtengan 8 registros.

select (B_Lname ||' '|| B_Fname) as Full_Name 
from Builder bl join House hs 
on bl.BID = hs.BID where FinishDate > now();

--modificacion de fechas de finalizacion para que sean mayores de la fecha actual.

update House set FinishDate = '01-01-2021' where NID = 1;
update House set FinishDate = '09-04-2024' where NID = 2;
update House set FinishDate = '10-11-2022' where NID = 3;
update House set FinishDate = '20-08-2022' where NID = 4;
update House set FinishDate = '30-05-2024' where NID = 5;
update House set FinishDate = '15-07-2025' where NID = 6;
update House set FinishDate = '10-09-2025' where NID = 7;
update House set FinishDate = '05-12-2022' where NID = 8;
update House set FinishDate = '10-02-2023' where NID = 9;
update House set FinishDate = '25-03-2020' where NID = 10;


--Ejercicio No.4: Presente todos los subcontratistas y los constructor que los contrató. Muestre los
--apellidos de los subcontratistas y los apellidos de los constructores junto con el salario de cada
--subcontratista. (Asegúrese de que se obtengan 11 registros)

--en la versión contenerizada:
insert into HireInfo(BID, SID, HireDate) values (2, 7, '08-08-2021');


SELECT /*BID,*/ B_Lname AS constructor, /*SID,*/ S_Lname AS subcontratista, Salary 
FROM SubContractor sc NATURAL JOIN 
(SELECT * FROM Builder b NATURAL JOIN HireInfo hi) jt; 


--Ejercicio No.5: Obtenga todos los constructores y las casas en construcción, el resultado
--presenta el apellido del constructor y el nombre de la casa ordenados por apellido. Algunos
--constructores no tienen casas en construcción deben estar incluidos. (Asegúrese de que se
--obtengan 14 registros).

insert into Builder(B_Lname, B_Fname, License)
values ('Hurtado', 'Paola', '200571AB'),
        ('Herrera', 'Jaime', '200196AB'),
        ('Real', 'Joe', '205111AB'),
        ('Jara', 'Katherine', '203201AB'),
        ('Marulanda', 'Armando', '202402AB');

SELECT B_Lname, H_Name 
FROM Builder bl LEFT OUTER JOIN 
(SELECT * FROM House where FinishDate > now()) h_in_cons ON bl.BID = h_in_cons.BID ORDER BY bl.B_Lname;


--Ejercicio No.6: Obtenga el nombre y el apellido en un solo campo llamado Full_name de los
--constructores de las casas llamadas "Nova" o "El cañaduzal". (5 registros)

--En docker
insert into House(H_Name, FinishDate, Price, BID, NID)
values ('Nova', '01-01-2021', 50000000, 2, 1),
        ('Nova', '04-09-2024', 60000000, 8, 2),
        ('El cañaduzal', '11-10-2019', 80000000, 5, 3),
        ('Nova', '08-20-2012', 90000000, 7, 4),
        ('El cañaduzal', '05-30-2014', 70000000, 2, 5),
        ('El cañaduzal', '07-15-2022', 150000000, 1, 6);

select (B_Fname ||' '|| B_Lname) as Full_name 
from Builder bl join House hs 
on bl.BID = hs.BID where H_Name = 'Nova' OR H_Name = 'El cañaduzal';


--Ejercicio No.7: Presente el nombres de todas las casas que han sido construidas por los
--constructores cuyo apellido comience con una 'P', el resultado debe incluir el nombre de estos
--constructores y sus apellidos

SELECT B_Lname AS apellido_constructor, B_Fname AS nombre_constructor, H_Name AS nombre_casa 
FROM Builder bd JOIN House h on bd.BID = h.BID 
WHERE bd.B_Lname LIKE 'P%' OR bd.B_Lname LIKE 'p%';



--Ejercicio No.8: Mostrar el nombre del barrio(s) y la ciudad que tiene una casa nombrada “Las
--consultas”. Asegúrese de que esta casa exista en sus registros y que existan registros coincidentes
--en Barrios (Neighborhood)

--en la versión contenerizada:
INSERT INTO House(H_Name, FinishDate, Price, BID, NID)
VALUES ('Las consultas', '01-01-2021', 50000000, 4, 3),
        ('Las consultas', '04-09-2024', 60000000, 7, 8),
        ('Las consultas', '11-10-2019', 80000000, 13, 9);

SELECT N_Name AS barrio, City AS ciudad FROM Neighborhood n JOIN House h ON n.NID = h.NID 
WHERE h.H_Name = 'Las consultas';


