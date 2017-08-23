drop database if exists Hospital;

create database Hospital;

use Hospital;

create table Patient
(
	PatientID varchar(9) primary key,
    patientName varchar(45),
    dob DATE,
    gender varchar(6)
)engine = innoDB;


create table Referral
(
	ReferralNo int(10) primary key,
    patientName varchar(45),
    referredFrom varchar(13),
    referralDate date,
    referredBy varchar(45),
    healthTargetEligeble varchar(3),
    patient varchar(10),
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
    addedToWaitList date,
    departmentid varchar(15),
    foreign key(departmentid) references Department(DepartmentID)
)engine = innoDB;

create table Appointment 
(
	AppointmentID varchar(10) primary key,
    fSADate date,
    addedToWaitList date,
    surgeonid varchar(15),
    foreign key(surgeonid) references Surgeon(SurgeonID)
)engine = innoDB;
