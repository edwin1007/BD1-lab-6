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

create table Neighborhood(
    NID serial primary key,
    N_Name varchar(20) not null,
    City varchar(20) not null
);

create table HireInfo(
    BID int,
    SID int,
    HireDate date,
    PRIMARY KEY (BID, SID),
    foreign key (BID) references Builder(BID),
    foreign key (SID) references SubContractor(SID)
);

create table House(
    HID serial primary key,
    H_Name varchar(20) not null,
    FinishDate date not null,
    Price money not null,
    BID int,
    NID int,
    foreign key (BID) references Builder(BID),
    foreign key (NID) references Neighborhood(NID)
);

