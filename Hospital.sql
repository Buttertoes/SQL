drop database if exists Hospital;

create database Hospital;

use Hospital;

create table Patient
(
	PatientID varchar(9) primary key,
    nHI char(7),
    patientName varchar(45),
    dob DATE,
    gender varchar(6),
	healthTargetEligeble varchar(3)
)engine = innoDB;


create table Referral
(
	ReferralNo int(10) primary key,
    patientName varchar(45),
    referredFrom varchar(13),
    referralDate date,
    referredBy varchar(45),
    patient varchar(10),
    addedToWaitList date,
    fSADate date,
    foreign key (patient) references Patient(PatientID)
)engine = innoDB;

create table Department
(
	DepartmentID varchar(15) primary key,
    departmentName varchar(35)
)engine = innoDB;



create table Surgeon
(
	SurgeonID varchar(15) primary key,
    surgeonName varchar(45),
    departmentid varchar(15),
    foreign key(departmentid) references Department(DepartmentID)
)engine = innoDB;

