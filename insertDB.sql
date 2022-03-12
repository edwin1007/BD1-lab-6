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
