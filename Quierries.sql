use Hospital2017;

select * from Department;
select * from Surgeon;
select * from Patient;
select * from Referral;

-- Q1
select count(healthTargetEligeble) as 'Number reffered to surgery'
from Patient
where healthTargetEligeble = 'Yes';

-- Q2
select departmentName as 'Department', round( avg( timestampdiff(DAY, referralDate, fSADate))) as 'Days taken to see a Surgeon'
from referral inner join patient
inner join surgeon
inner join department
where healthTargetEligeble = 'Yes'
group by Department.DepartmentID;


-- Q3

select surgeon.SurgeonName as 'Surgeon Name', patient.patientName as 'Patient Name', round( timestampdiff(DAY, referralDate, fSADate)) as 'Days taken to see a Surgeon'
from patient 
inner join surgeon on surgeon.surgeonID = patient.surgeonID
inner join Referral on referral.patientId = patient.PatientID
where healthTargetEligeble = 'Yes'
group by surgeon.SurgeonID;


-- Q4

select Department.departmentName as 'Department Name', patient.patientName as 'Patient Name', round( timestampdiff(DAY, dob, CURDATE())) as 'Age in Days'
from patient 
inner join surgeon on surgeon.surgeonID = patient.surgeonID
inner join department on department.DepartmentID = surgeon.DepartmentID
where healthTargetEligeble = 'Yes' and department.DepartmentID = 4
order by surgeon.SurgeonID