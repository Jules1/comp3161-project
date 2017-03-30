CREATE DATABASE patientInfo;
USE patientInfo;


/* Creating the main tables */
CREATE TABLE patient(
	patient_id varchar(5) not null,
	fname varchar(20),
	lname varchar(20),
	address varchar(30),
	dob date,
	phone varchar(8),
	primary key(patient_id) 
);

CREATE TABLE medicine(
	med_id varchar(5) not null,
	name varchar(20),
	measurement varchar(4),
	unit varchar(2),
	administration ENUM ('Oral', 'Topical', 'Intravenous', 'Intramuscular', 'Optic', 'Rectal', 'Vaginal', 'Nasal'),
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
	procedure_id varchar(5) not null,
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

CREATE TABLE medical_rec(
	record_id varchar(5),
	primary key(record_id)
);


/* INTERMEDIARY TABLES */

CREATE TABLE DPAttends(
	doctor_id varchar(5),
	patient_id varchar(5),
	FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE NPAttends(
	nurse_id varchar(5),
	patient_id varchar(5),
	FOREIGN KEY(nurse_id) REFERENCES nurse(nurse_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE patientMedical(
	record_id varchar(5),
	patient_id varchar(5),
	FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE patientRelation(
	patient_id varchar(5),
	FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE retrieves(
	nurse_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(nurse_id) REFERENCES nurse(nurse_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE administers(
	nurse_id varchar(5),
	med_id varchar(5),
	FOREIGN KEY(nurse_id) REFERENCES nurse(nurse_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(med_id) REFERENCES medicine(med_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE medicineRecorded(
	med_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(med_id) REFERENCES medicine(med_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE updateVital(
	vital_id varchar(5),
	nurse_id varchar(5),
	FOREIGN KEY(vital_id) REFERENCES vitals(vital_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(nurse_id) REFERENCES nurse(nurse_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE vitalRecorded(
	vital_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(vital_id) REFERENCES vitals(vital_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE docManage(
	doctor_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE diagRecorded(
	diagnosis_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(diagnosis_id) REFERENCES diagnosis(diagnosis_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE procedureRecorded(
	procedure_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(procedure_id) REFERENCES procedure(procedure_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE procedureStep(
	procedure_id varchar(5),
	step_id varchar(5),
	FOREIGN KEY(procedure_id) REFERENCES procedure(procedure_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(step_id) REFERENCES step(step_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE treatmentRecorded(
	treatment_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(treatment_id) REFERENCES treatment(treatment_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE resultRecorded(
	result_id varchar(5),
	record_id varchar(5),
	FOREIGN KEY(result_id) REFERENCES result(result_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(record_id) REFERENCES medical_rec(record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

/* ALL ISA TABLES*/
