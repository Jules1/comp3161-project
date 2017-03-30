CREATE DATABASE patientInfo;
USE patientInfo;


/* Creating the main tables */
CREATE TABLE patient(
	patient_id varchar(5) not null,
	fname varchar(20),
	lname varchar(20),
	address varchar(20),
	dob date,
	phone varchar(8),
	primary key(patient_id) 
);

CREATE TABLE medicine(
	med_id varchar(5) not null,
	name varchar(20),
	measurement varchar(4),
	unit varchar(2),
	administration varchar(2), /* Code to show mode of administration - O = Oral, A = Anal, IV = Intravenous IM = Intramuscular.*/
	primary key(med_id)
);

CREATE TABLE doctor(
	doctor_id varchar(5) not null,
	fname varchar(20),
	lname varchar(20),
	dob date,
	address varchar(30),
	phone varchar(8),

)

CREATE TABLE nurse(
	nurse_id varchar(5) not null,
	fname varchar(20),
	lname varchar(20),
	dob date,
	address varchar(30),
	phone varchar(8),
	primary key(nurse_id)
);

CREATE TABLE vitals(
	vital_id varchar(5) not null,
	value varchar(7),
	unit varchar(5),
	primary key(vital_id)
);

CREATE TABLE diagnosis(
	diagnosis_id varchar(5) not null,
	description varchar(50),
	primary key(diagnosis_id)
);

CREATE TABLE procedure(
	prodecure_id varchar(5) not null,
	name varchar(50),
	primary key(procedure_id)
);

CREATE TABLE step(
	step_id varchar(5) not null,
	order varchar(30),
	instruction varchar(30),
	primary key(step_id)
);

CREATE TABLE treatment(
	treatment_id varchar(5) not null,
	name varchar(50),
	primary key(treatment_id)
);

CREATE TABLE result(
	result_id varchar(5) not null,
	scans varchar(30),
	name varchar(30),
	primary key(result_id)
);


