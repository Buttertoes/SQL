drop database if exists Hospital2017;

create database Hospital2017;

use Hospital2017;



create table Department
(
	DepartmentID integer auto_increment primary key,
    departmentName varchar(35)
)engine = innoDB;

load data local infile'H:/Degree sem 3/BCPR203 - Database Management Systems/Assignment/Excel Stuff/Department.csv'
into table Department
fields terminated by ','
lines terminated by '\n'
(departmentName);
 



create table Surgeon
(
	SurgeonID integer auto_increment primary key,
    surgeonName varchar(45),
    departmentId integer,
    foreign key (departmentId) references Department(DepartmentID)
)engine = innoDB;

load data local infile 'H:/Degree sem 3/BCPR203 - Database Management Systems/Assignment/Excel Stuff/Surgeon.csv'
into table Surgeon
fields terminated by ','
lines terminated by '\n'
(surgeonName, departmentId);



create table Patient
(
	PatientID integer auto_increment primary key,
    nHI char(7),
    patientName varchar(45),
    dob DATE,
    gender varchar(6),
	healthTargetEligeble varchar(5),
    surgeonid integer,
     foreign key (surgeonid) references Surgeon(SurgeonID)
)engine = innoDB;


load data local infile'H:/Degree sem 3/BCPR203 - Database Management Systems/Assignment/Excel Stuff/Patient.csv'
into table Patient
fields terminated by ','
lines terminated by '\n'
(nHI, patientName, dob, gender, healthTargetEligeble,surgeonid);



create table Referral
(
	ReferralNo integer auto_increment primary key,
    patientName varchar(45),
    referredFrom varchar(13),
    referralDate date,
    referredBy varchar(45),
    patientId integer,
    addedToWaitList date,
    fSADate date,
    foreign key (patientId) references Patient(PatientID)
)engine = innoDB;

load data local infile'H:/Degree sem 3/BCPR203 - Database Management Systems/Assignment/Excel Stuff/Referral.csv'
into table Referral
fields terminated by ','
lines terminated by '\n'
(patientName, referredFrom, referralDate, referredBy,patientId , addedToWaitList, fSADate);






-- select * from Department;
-- select * from Surgeon;
-- select * from Referral;
 select * from Patient;