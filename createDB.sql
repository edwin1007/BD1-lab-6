/*

SubContractor (SID, S_Lname, S_Fname, Salary)
Builder (BID, B_Lname, B_Fname, License) 
Neighborhood  (NID, N_Name, City)
HireInfo (BID*, SID*, HireDate) 
House (HID, H_Name, FinishDate, Price, BID*, NID*) 

*/

create database company;

create table SubContractor(
    SID serial primary key,
    S_Lname varchar(20) not null,
    S_Fname varchar(20) not null,
    Salary money not null
);

create table Builder(
    BID serial primary key,
    B_Lname varchar(20) not null,
    B_Fname varchar(20) not null,
    License varchar(20) not null
);

