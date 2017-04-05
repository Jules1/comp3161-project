DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

/* Creating the main tables */
drop table if exists patient;
CREATE TABLE patient(
	patient_id varchar(5) not null,
	fname varchar(20),
	lname varchar(20),
	address varchar(30),
	dob date,
	phone varchar(8),
	primary key(patient_id) 
);

drop table if exists medicine;
CREATE TABLE medicine(
	med_id varchar(5) not null,
	name varchar(20),
	measurement varchar(4),
	unit varchar(2),
	administration varchar(10),
	primary key(med_id)
);

drop table if exists doctor;
CREATE TABLE doctor(
	doctor_id varchar(5) not null,
	doctype varchar(10),
	fname varchar(20),
	lname varchar(20),
	dob date,
	address varchar(30),
	phone varchar(8),
	primary key(doctor_id)
);

drop table if exists nurse;
CREATE TABLE nurse(
	nurse_id varchar(5) not null,
	nursetype varchar(10),
	fname varchar(20),
	lname varchar(20),
	dob date,
	address varchar(30),
	phone varchar(8),
	primary key(nurse_id)
);

drop table if exists vitals;
CREATE TABLE vitals(
	vital_id varchar(5) not null,
	value varchar(7),
	unit varchar(5),
	primary key(vital_id)
);

drop table if exists diagnosis;
CREATE TABLE diagnosis(
	diagnosis_id varchar(5) not null,
	description varchar(50),
	primary key(diagnosis_id)
);

drop table if exists medProcedure;
CREATE TABLE medProcedure(
	procedure_id varchar(5) not null,
	name varchar(50),
	primary key(procedure_id)
);

drop table if exists step;
CREATE TABLE step(
	step_id varchar(5) not null,
	step_order varchar(30),
	instruction varchar(30),
	primary key(step_id)
);

drop table if exists treatment;
CREATE TABLE treatment(
	treatment_id varchar(5) not null,
	name varchar(50),
	primary key(treatment_id)
);

drop table if exists result;
CREATE TABLE result(
	result_id varchar(5) not null,
	scans varchar(30),
	name varchar(30),
	primary key(result_id)
);

drop table if exists medical_rec;
CREATE TABLE medical_rec(
	record_id varchar(5),
	primary key(record_id)
);


/* INTERMEDIARY TABLES */

drop table if exists DPAttends;
CREATE TABLE DPAttends(
	doctor_id varchar(5),
	patient_id varchar(5),
	FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists NPAttends;
CREATE TABLE NPAttends(
	nurse_id varchar(5),
	patient_id varchar(5),
	FOREIGN KEY(nurse_id) REFERENCES nurse(nurse_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE ON UPDATE CASCADE

);

drop table if exists patientMedical;
CREATE TABLE patientMedical(
	record_id varchar(5),
	patient_id varchar(5),
	FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists patientRelation;
CREATE TABLE patientRelation(
	patient_id varchar(5),
	FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists retrieves;
CREATE TABLE retrieves(
	nurse_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(nurse_id) REFERENCES nurse(nurse_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists administers;
CREATE TABLE administers(
	nurse_id varchar(5),
	med_id varchar(5),
	FOREIGN KEY(nurse_id) REFERENCES nurse(nurse_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(med_id) REFERENCES medicine(med_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists medicineRecorded;
CREATE TABLE medicineRecorded(
	med_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(med_id) REFERENCES medicine(med_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists updateVital;
CREATE TABLE updateVital(
	vital_id varchar(5),
	nurse_id varchar(5),
	FOREIGN KEY(vital_id) REFERENCES vitals(vital_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(nurse_id) REFERENCES nurse(nurse_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists vitalRecorded;
CREATE TABLE vitalRecorded(
	vital_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(vital_id) REFERENCES vitals(vital_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists docManage;
CREATE TABLE docManage(
	doctor_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists diagRecorded;
CREATE TABLE diagRecorded(
	diagnosis_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(diagnosis_id) REFERENCES diagnosis(diagnosis_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists procedureRecorded;
CREATE TABLE procedureRecorded(
	procedure_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(procedure_id) REFERENCES medProcedure(procedure_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists procedureStep;
CREATE TABLE procedureStep(
	procedure_id varchar(5),
	step_id varchar(5),
	FOREIGN KEY(procedure_id) REFERENCES medProcedure(procedure_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(step_id) REFERENCES step(step_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists treatmentRecorded;
CREATE TABLE treatmentRecorded(
	treatment_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(treatment_id) REFERENCES treatment(treatment_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists resultRecorded;
CREATE TABLE resultRecorded(
	result_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(result_id) REFERENCES result(result_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

/* ALL ISA TABLES*/

drop table if exists intern;
CREATE TABLE intern(
	doctor_id varchar(5),
	FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id)
);

drop table if exists resident;
CREATE TABLE resident(
	doctor_id varchar(5),
	FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id)
);

drop table if exists consultant;
CREATE TABLE consultant(
	doctor_id varchar(5),
	specialization varchar(25),
	FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id)
);

drop table if exists midwife;
CREATE TABLE midwife(
	nurse_id varchar(5),
	FOREIGN KEY(nurse_id) REFERENCES nurse(nurse_id)
);

drop table if exists registered;
CREATE TABLE registered(
	nurse_id varchar(5),
	FOREIGN KEY(nurse_id) REFERENCES nurse(nurse_id)
);

drop table if exists enrolled;
CREATE TABLE enrolled(
	nurse_id varchar(5),
	FOREIGN KEY(nurse_id) REFERENCES nurse(nurse_id)
);