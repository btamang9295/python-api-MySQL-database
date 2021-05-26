   -- Script name: inserts.sql
   -- Author:      Bikram Tamang
   -- Purpose:     insert sample data to test the integrity of this database system

USE jivana_db;

INSERT INTO user (user_id, name, last_name, email, password) VALUES
(1, 'Alice', 'wu', 'Alice@gogo.com', 12345),
(2, 'Bob', 'pi ', 'Bod@gogo.com', 234567),
(3, 'Trudi', 'ge', 'Truth@gogo.com', 34567),
(4, 'Andy', 'uon','Andy@google.com',  12322),
(5, 'Bunu', 'lin ', 'bunbun@gogo.com', 32111),
(6, 'Trina', 'rin', 'Trappy@gogo.com',  33112);


-- SELECT * FROM user;

 -- 17:08:15	INSERT INTO User (user_id, name, ssn) VALUES (1, 'Alice wu', 7564), (2, 'Bob pi', 9876), (3, 'Trudi gu', 9076)	Error Code: 1364. Field 'last_name' doesn't have a default value	0.0020 sec
-- 17:10:04	INSERT INTO User (user_id, full_name, ssn) VALUES (1, 'Alice', 7564), (2, 'Bob', 9876), (3, 'Trudi', 9076)	Error Code: 3105. The value specified for generated column 'full_name' in table 'user' is not allowed.	0.00050 sec
-- 17:12:13	INSERT INTO User (user_id, full_name, ssn) VALUES (1, 'Alice', 'wu', 7564), (2, 'Bob', 'pi ', 9876), (3, 'Trudi', 'ge', 9076)	Error Code: 1136. Column count doesn't match value count at row 1	0.00077 sec

INSERT INTO account (account_id, username, password,  email, created, user_id) VALUES
( 1, 'Alicee', 12345, 'Alice@gogo.com', 12321231, 1),
( 2, 'Bobby', 23456, 'Bod@gogo.com', 12321116, 2),
( 3, 'Trudie95', 34567, 'Truth@gogo.com', 12320908, 3),
( 4, 'Andy69', 45678, 'Andy@google.com', 12320608, 4),
( 5, 'Bunny95', 56789,'bunbun@gogo.com', 12320708, 5),
( 6, 'Trapstar5', 67890, 'Trappy@gogo.com', 12320808, 6);

INSERT INTO appointments ( appointment_id, name, last_name,  appointment_for, appointment_date ) VALUES
 (102, 'Alice', 'wu', 'covid-19', 12321231),
 ( 32, 'Bob', 'pi', 'surgery', 19890416),
 ( 66, 'Trudi', 'gi', 'delivery', 20010109);

INSERT INTO hospital (reg_no, name, address, city, zip, state, estd) VALUES
 (1, 'life in christ', '12th ave', 'El cerrito', 94530 , 'CA', 1988),
 (2, 'kayzor', '112 rick boulavard', 'Oakland', 99332 , 'CA', 1960),
 (3, 'Angel', '3425 Grand Ave', 'El sobrante', 94804 , 'NY', 1995);

INSERT INTO department (department_id, department_name, type, reg_no) VALUES
(1, 'Burn Unit' , 'Emergency', 3),
(2, 'ICU' , 'Urgent care', 2),
(3, 'Child delivery' , 'Maternal', 1);

INSERT INTO employee (employee_id, name, last_name, ssn, date_of_birth, reg_no)
VALUES (1, 'Osin', 'Sherpa', 1846284099, 19941208, 3),
(2, 'Nawang', 'Limbu', 1923384412, 19910812, 2),
(3, 'Leela', 'Lama', 1093328812, 19930312, 1),
(4, 'Nong', 'sandu', 1923324412, 19960810, 2),
(5, 'Penra', 'yuman', 1923354412, 19880815, 2),
(6, 'bishal', 'dong', 1911364412, 19910215, 2),
(7, 'liam', 'ghi', 1963384412, 19910801, 2);

INSERT INTO doctor (liscence_no, name, last_name, type, employee_id)
VALUES (1111, 'Dina', 'tanu', 'suergon', 3),
(2222, 'Romey ', 'talker', 'neurologist', 2),
(3333, 'jojo', 'lecia', 'physician', 1);

INSERT INTO nurse (liscence_no, type, shift, employee_id)
VALUES (1112, 'General', 'night', 4),
(1113, 'Registered', 'Day', 5),
(1114, 'Supervisor', 'night', 6);

INSERT INTO insurance (insurance_id, insurance_type, created_date, user_id)
VALUES (1, 'general', 20121109, 1),
(2, 'Dental', 20161001, 2),
(3, 'vision', 20150409, 3);

INSERT INTO patient(patient_id, name, last_name, insurance_id, room_no, reg_no)
 VALUES (1, 'Lily', 'gupta', 1, 248, 1),
 (2, 'Ram', 'Luther', 2, 116,  1),
 (3, 'Gunther', 'nade', 3, NULL,  1),
 (4, 'Andy', 'uon', 1, 211, 2),
 (5, 'Bunu', 'Lin', 2, 117,  2),
 (6, 'lina', 'jade', 3, NULL,  3);

INSERT INTO medical_record (name, last_name, medical_record_no, height, weight, sex, age, race, blood_type, blood_preassure, patient_id)
 VALUES ('lily', 'gupta', 1, 6.2, 110, 'female', 33, 'Asian', 'B +', 90, 1),
 ('Ram', 'luther', 2, 5.2, 120, 'male', 43, 'Hispanic', 'O + ', 80, 2),
 ('Gunther', 'nade', 3, 6.7, 125, 'male', 23, 'Latino', 'B +', 96, 3);

INSERT INTO visitor (visitor_id, name, last_name, time_stamp) VALUES
 (1, 'Rama', 'sunar', 19990812),
 (2, 'kito', 'jike', 19980601),
 (3, 'pari', 'tuir', 20030802);

INSERT INTO reception (name, last_name, patient_id, visitor_id, time_stamp)
VALUES ('Lu', 'shang', 1, 1, 20010101 ),
		('Sri','cham', 2, 2, 20090909),
        ('Don', 'sha', 3, 3, 20190814);

INSERT INTO technical_dpt (department_id, equipment_info, maintainence_record, maintainence_date)
VALUES (1, 'X-RAY machine', 'fixed-off switch', 20110405),
		(2, 'C-T scan machine', 'light-bulb changed', 20140401),
        (3, 'Robotic surgueon arm', 'program rebooted', 20210911);

 INSERT INTO test (test_id, test_type, test_date) VALUES
				  (1, 'blood sample', 20190714),
				  (2, 'PAP test', 20110412),
                  (3, 'Spinal fluid', 20180819);


INSERT INTO prescription (prescription_id, patient_id, dosage, prescribed_date) VALUES
					(1, 1, '200 mg - 4 weeks', 20200908),
                    (2, 2, '500 mg - 8 weeks', 20110917),
                    (3, 3, '600 mg - 1 week', 20050924),
                    (4, 4, '200 mg - 4 weeks', 20210908),
                    (5, 5, '500 mg - 8 weeks', 20120917),
                    (6, 6, '600 mg - 1 week', 20090924);


 INSERT INTO pharmacy (pharmacy_id, prescription_id, order_id, department_id, drug_info ) VALUES
					  (1, 1, 1, 1, 'paracetamol 200mg'),
                      (2, 2, 2 ,2,  'Ibuprofin. 500mg'),
                      (3, 3, 3, 3,  'Azetemax 3000, 300mg');

INSERT INTO lab(lab_id, patient_id, order_id, department_id, test_info, test_result ) VALUES
				(1 , 1, 1 , 1, 'HIV', 'positive'),
                (2, 2, 2,  2,  'COVID-20', 'negative'),
                (3, 3, 3, 3,   'migrane', 'positive');




