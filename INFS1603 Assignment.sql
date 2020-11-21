-- Creating departments table 
DROP TABLE departments;

CREATE TABLE departments (
    Department_ID NUMBER(3,0)
        CONSTRAINT department_ID_pk
        PRIMARY KEY,
    Dep_Location VARCHAR2(3),
    Dep_Name VARCHAR2(50),
    Dep_Facilities VARCHAR2(50),
    Dep_Description VARCHAR2(150),
        CONSTRAINT department_ID_range
        CHECK (department_ID BETWEEN 100 AND 999)
);

-- Inputting all of the entries into departments
INSERT INTO departments (Department_ID, Dep_Location, Dep_Name, Dep_Facilities, Dep_Description)
VALUES (101, 'A5', 'Accident and Emergency (A and E)', 'Day Surgery Unit, Birth centres', 'For patients arriving by ambulance or currently in an emergency situation');
INSERT INTO departments (Department_ID, Dep_Location, Dep_Name, Dep_Facilities, Dep_Description)
VALUES (102, 'A5', 'Admissions', NULL, 'Patients will provide personal information and sign consent forms - done by patient or family member');
INSERT INTO departments (Department_ID, Dep_Location, Dep_Name, Dep_Facilities, Dep_Description)
VALUES (103, 'A5', 'Anesthetics', 'Medical offices', 'Doctors in the Anesthetics department will give anesthetic for operations and procedures');
INSERT INTO departments (Department_ID, Dep_Location, Dep_Name, Dep_Facilities, Dep_Description)
VALUES (104, 'D18', 'Breast Screening', 'Clinics, Education centres', 'Screening women for breast cancer');
INSERT INTO departments (Department_ID, Dep_Location, Dep_Name, Dep_Facilities, Dep_Description)
VALUES (105, 'A7', 'Burn Center (Burn Unit)', 'Clinics', 'Specialises in the treatment of burns - for treatment/recovery of patients with severe burns');
INSERT INTO departments (Department_ID, Dep_Location, Dep_Name, Dep_Facilities, Dep_Description)
VALUES (106, 'A5', 'Cardiology', 'Day Surgery Unit', 'For patients with problems with their heart or circulation');
INSERT INTO departments (Department_ID, Dep_Location, Dep_Name, Dep_Facilities, Dep_Description)
VALUES (107, 'D18','Gynecology', 'Clinics, Education centres', 'Treats problems relating to the female urinary tract and reproductive organs');
INSERT INTO departments (Department_ID, Dep_Location, Dep_Name, Dep_Facilities, Dep_Description)
VALUES (108, 'A6', 'General Surgery', 'Day Surgery Unit', 'Covers wide range of types of surgery and procedures on patients');
INSERT INTO departments (Department_ID, Dep_Location, Dep_Name, Dep_Facilities, Dep_Description)
VALUES (109, 'B10', 'Coronary Care Unit (CCU)', 'Medical offices, Education centres', 'Specialises in care of patients with cardiac conditions that require continuous monitoring and treatment - like heart attacks'); 
INSERT INTO departments (Department_ID, Dep_Location, Dep_Name, Dep_Facilities, Dep_Description)
VALUES (110, 'H8', 'Elderly Services', 'Clinics, Medical offices', 'Covers and assists with a wide range of issues associated with seniors');

SELECT * FROM departments; -- Check output

-- Creating workers table
DROP TABLE workers;

CREATE TABLE workers (
    Worker_ID NUMBER(4,0)
        CONSTRAINT worker_ID_pk
        PRIMARY KEY,
    Department_ID NUMBER(3,0),
        CONSTRAINT workers_department_ID_fk
        FOREIGN KEY (department_id)
        REFERENCES departments (department_id),
    Date_Hired DATE DEFAULT SYSDATE,
    Phone# CHAR(10),
    Wkr_Type VARCHAR2(2),
        CHECK (wkr_type IN ('GS', 'SW', 'S')),
    Wkr_Fname VARCHAR2(20),
    Wkr_Lname VARCHAR2(20),
    Street_No NUMBER(3,0),
    Street VARCHAR2(100),
    Suburb VARCHAR2(100),
    State VARCHAR2(3),
    Postcode NUMBER(4,0),
        CONSTRAINT worker_ID_range
        CHECK (worker_ID BETWEEN 1000 AND 9999), 
        CONSTRAINT postcode_range
        CHECK (postcode BETWEEN 1000 AND 9999)
);

-- Inputting all of the entries into workers
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1011, 102, '0412345678', TO_DATE('01/01/2015', 'dd/mm/yy'), 'GS', 'Jo', 'Marcello', 49, 'Elizabeth St.', 'Widgee Crossing North', 'QLD', 4570);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1021, 103, '0412345678', TO_DATE('01/02/2018', 'dd/mm/yy'),'GS', 'Tulisa', 'Benitez', 68, 'Savages Rd.', 'Tarragindi', 'QLD', 4121);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1031, 105, '0412345678', TO_DATE('01/05/2020', 'dd/mm/yy'), 'GS', 'Harun', 'Boyer', 18, 'Wright St.', 'Noosaville DC', 'QLD', 4566);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1041, 107, '0412345678', TO_DATE('01/07/2012', 'dd/mm/yy'), 'GS', 'Milan', 'Crawford', 67, 'Glen William Rd.', 'Esmerelda', 'QLD', 4871);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1053, 110, '0412345678', TO_DATE('01/05/2011', 'dd/mm/yy'), 'GS', 'Kien', 'Alston', 66, 'Foreshore Rd.', 'Koondoola', 'WA', 6064);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1064, 102, '0412345678', TO_DATE('01/12/2017', 'dd/mm/yy'), 'GS', 'Jo', 'Marcello', 64, 'Carolina Park Rd.', 'Fountaindale', 'NSW', 2258);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1077, 101, '0412345678', TO_DATE('01/11/2014', 'dd/mm/yy'), 'GS', 'Tulisa', 'Benitez', 15, 'Woodlands Av.', 'Harris Park', 'NSW', 2150);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1080, 106, '0412345678', TO_DATE('01/10/2017', 'dd/mm/yy'), 'GS', 'Harun', 'Boyer', 13, 'Derry St.', 'Strathpine', 'QLD', 4500);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1091, 108, '0412345678', TO_DATE('01/01/2016', 'dd/mm/yy'), 'GS', 'Milan', 'Crawford', 11, 'Bungana Dr.', 'Gillentown', 'SA', 5453);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1105, 104, '0412345678', TO_DATE('01/09/2019', 'dd/mm/yy'), 'GS', 'Kien', 'Alston', 14, 'Faulkner St.', 'Puddledock', 'NSW', 2350);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (2471, 105, '0423456789', TO_DATE('01/08/2020', 'dd/mm/yy'), 'SW', 'Jason', 'Nigel', 16, 'Pipeclay Rd.', 'Rosewood', 'NSW', 2446);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1232, 103, '0467890123', TO_DATE('01/02/2019', 'dd/mm/yy'), 'SW', 'Shawn', 'Ryan', 49, 'Elizabeth St.', 'Widgee Crossing North', 'QLD', 4570);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (7493, 102, '0478901234', TO_DATE('01/04/2019', 'dd/mm/yy'), 'SW', 'Michael', 'Mendoza', 55, 'Forrest Rd.', 'Leadville', 'NSW', 2844);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (8014, 107, '0434567890', TO_DATE('01/10/2017', 'dd/mm/yy'), 'SW', 'Liz', 'Zlatica', 36, 'Campbells River Rd.', 'Cobar', 'NSW', 2835);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (6715, 110, '0445678901', TO_DATE('01/06/2018', 'dd/mm/yy'), 'SW', 'Janet', 'Leondria', 7, 'Capper St.', 'Blairmore', 'QLD', 4625);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1876, 106, '0489012345', TO_DATE('01/05/2018', 'dd/mm/yy'), 'S', 'Febreeze', 'Richards', 43, 'Souttar Te.', 'Herdsman', 'WA', 6017);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1337, 109, '0456789012', TO_DATE('01/03/2010', 'dd/mm/yy'), 'S', 'X-AE-A12', 'Musk', 56, 'Marion St.', 'East Point', 'NT', 5820);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (1929, 110, '0490123456', TO_DATE('01/04/2013', 'dd/mm/yy'), 'S', 'Bob', 'Robbins', 54, 'Old Gayndah Rd.', 'Telgalla Weir', 'QLD', 4650);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (7948, 101, '0401234567', TO_DATE('01/02/2015', 'dd/mm/yy'), 'S', 'Phil', 'Malone', 70, 'Border Dr.', 'Euberta', 'NSW', 2650);
INSERT INTO workers (Worker_ID, Department_ID, Phone#, Date_Hired, Wkr_Type, Wkr_Fname, Wkr_Lname, Street_no, street, suburb, state, postcode)
VALUES (7890, 104, '0412389002', TO_DATE('01/01/2019', 'dd/mm/yy'), 'S', 'Tamanna', 'Hart', 44, 'Isaac Rd.', 'Butlers Gorge', 'TAS', 7140);

SELECT * FROM workers; -- Check output

-- Creating general_staff table
DROP TABLE general_staff; 

CREATE TABLE general_staff (
    GS_WorkerID NUMBER(4,0)
        CONSTRAINT gs_worker_ID_pk
        PRIMARY KEY,
        CONSTRAINT gs_worker_ID_fk
        FOREIGN KEY (gs_WorkerID)
        REFERENCES workers (worker_ID),
    GS_Type VARCHAR2(2),
        CHECK (gs_type IN ('N', 'T', 'GD', 'AS'))
);

-- Inputting all of the entries into general_staff
INSERT INTO general_staff (GS_WorkerID, GS_Type)
VALUES (1011, 'N');
INSERT INTO general_staff (GS_WorkerID, GS_Type)
VALUES (1021, 'T');
INSERT INTO general_staff (GS_WorkerID, GS_Type)
VALUES (1031, 'GD');
INSERT INTO general_staff (GS_WorkerID, GS_Type)
VALUES (1041, 'AS');
INSERT INTO general_staff (GS_WorkerID, GS_Type)
VALUES (1053, 'N');
INSERT INTO general_staff (GS_WorkerID, GS_Type)
VALUES (1064, 'T');
INSERT INTO general_staff (GS_WorkerID, GS_Type)
VALUES (1077, 'GD');
INSERT INTO general_staff (GS_WorkerID, GS_Type)
VALUES (1080, 'AS');
INSERT INTO general_staff (GS_WorkerID, GS_Type)
VALUES (1091, 'N');
INSERT INTO general_staff (GS_WorkerID, GS_Type)
VALUES (1105, 'T');

SELECT * FROM general_staff; -- Check output

-- Creating social_workers table
DROP TABLE social_workers;

CREATE TABLE social_workers (
    SW_WorkerID NUMBER(4,0)
        CONSTRAINT sw_worker_ID_pk
        PRIMARY KEY,
        CONSTRAINT sw_worker_ID_fk
        FOREIGN KEY (sw_WorkerID)
        REFERENCES workers (worker_ID),
    SW_Skills VARCHAR2(100),
    SW_Affiliation VARCHAR2(100)
);

-- Inputting all of the entries into social_workers
INSERT INTO social_workers (SW_WorkerID, SW_Skills, SW_Affiliation)
VALUES (2471, 'Online counselling, Automated e-mailing', 'University of New South Wales');
INSERT INTO social_workers (SW_WorkerID, SW_Skills, SW_Affiliation)
VALUES (1232, 'Videoconferencing, Spreadsheets, In-person counselling', 'University of Sydney');
INSERT INTO social_workers (SW_WorkerID, SW_Skills, SW_Affiliation)
VALUES (7493, 'Spreadsheets, Telephone counselling', 'Deakin University');
INSERT INTO social_workers (SW_WorkerID, SW_Skills, SW_Affiliation)
VALUES (8014, 'Online counselling, Telephone counselling', 'TAFE NSW');
INSERT INTO social_workers (SW_WorkerID, SW_Skills, SW_Affiliation)
VALUES (6715, 'Spreadsheets, Automated e-mailing, Database management', 'University of New South Wales');

SELECT * FROM social_workers; -- Check output

-- Creating specialists table
DROP TABLE specialists;

CREATE TABLE specialists (
    Spec_WorkerID NUMBER(4,0) 
        CONSTRAINT spec_worker_ID_pk
        PRIMARY KEY,
        CONSTRAINT spec_worker_ID_fk
        FOREIGN KEY (spec_WorkerID)
        REFERENCES workers (worker_ID),
    Specialty VARCHAR(50)
);

-- Inputting all of the entries into specialists
INSERT INTO specialists (Spec_WorkerID, specialty)
VALUES (1876, 'Emergency medicine');
INSERT INTO specialists (Spec_WorkerID, specialty)
VALUES (1337, 'Dermatology');
INSERT INTO specialists (Spec_WorkerID, specialty)
VALUES (1929, 'Cardiovascular Disease');
INSERT INTO specialists (Spec_WorkerID, specialty)
VALUES (7948, 'Internal medicine');
INSERT INTO specialists (Spec_WorkerID, specialty)
VALUES (7890, 'Diagnostic radiology');

SELECT * FROM specialists; -- Check output

-- Creating technicians table
DROP TABLE technicians;

CREATE TABLE technicians (
    T_WorkerID NUMBER(4,0)
        CONSTRAINT t_gs_workerID_pk
        PRIMARY KEY,
        CONSTRAINT t_gs_workerID_fk
        FOREIGN KEY (t_workerID)
        REFERENCES general_staff (gs_workerID),
    Technical_Skill VARCHAR(100)
);

-- Inputting all of the entries into technician
INSERT INTO technicians (T_WorkerID, Technical_Skill)
VALUES (1021, 'Lab tests');
INSERT INTO technicians (T_WorkerID, Technical_Skill)
VALUES (1064, 'Record maintenance, Drug dispensing');
INSERT INTO technicians (T_WorkerID, Technical_Skill)
VALUES (1105, 'Lab tests, Record maintenance');

SELECT * FROM technicians; -- Check output

-- Creating laboratory table
DROP TABLE laboratory;

CREATE TABLE laboratory (
    Lab_Name VARCHAR2(100)
        CONSTRAINT laboratory_pk
        PRIMARY KEY,
    Location VARCHAR2(3)
);

-- Inputting all of the entries into laboratory
INSERT INTO laboratory (Lab_Name, Location)
VALUES ('Surgical Pathology Lab', 'A5');
INSERT INTO laboratory (Lab_Name, Location)
VALUES ('Sepsis Lab', 'F17');
INSERT INTO laboratory (Lab_Name, Location)
VALUES ('Chemistry Lab', 'E12');

SELECT * FROM laboratory; -- Check output

-- Creating allocated table
DROP TABLE allocated;

CREATE TABLE allocated (
    T_WorkerID NUMBER(4,0),
        CONSTRAINT allocated_T_workerID_fk
        FOREIGN KEY (t_workerid)
        REFERENCES technicians (t_workerid),
    Lab_Name VARCHAR2(50),
        CONSTRAINT allocated_lab_name_fk
        FOREIGN KEY (lab_name)
        REFERENCES laboratory (lab_name),
        CONSTRAINT allocated_pk
        PRIMARY KEY (T_workerID, lab_name)
);

-- Inputting all of the entries into allocated
INSERT INTO allocated (T_WorkerID, Lab_Name)
VALUES (1021, 'Surgical Pathology Lab');
INSERT INTO allocated (T_WorkerID, Lab_Name)
VALUES (1064, 'Sepsis Lab');
INSERT INTO allocated (T_WorkerID, Lab_Name)
VALUES (1105, 'Chemistry Lab');

SELECT * FROM allocated; -- Check output

-- Creating general_doctor table
DROP TABLE general_doctor;

CREATE TABLE general_doctor (
    GD_WorkerID NUMBER(4,0)
        CONSTRAINT general_doctor_pk
        PRIMARY KEY,
        CONSTRAINT general_doctor_fk
        FOREIGN KEY (GD_WorkerID)
        REFERENCES general_staff (gs_workerID),
    MBBS_Degree VARCHAR(100)
);

-- Inputting all of the entries into general_doctor
INSERT INTO general_doctor (GD_WorkerID, MBBS_Degree)
VALUES (1031, 'University of New South Wales, 2007');
INSERT INTO general_doctor (GD_WorkerID, MBBS_Degree)
VALUES (1077, 'University of Sydney, 2004');

SELECT * FROM general_doctor; -- Check output

-- Creating administration_staff table
DROP TABLE administration_staff;

CREATE TABLE administration_staff (
    AS_WorkerID NUMBER(4,0)
        CONSTRAINT administration_staff_pk
        PRIMARY KEY,
        CONSTRAINT administration_staff_fk
        FOREIGN KEY (AS_WorkerID)
        REFERENCES general_staff (gs_workerID),
    Admin_level VARCHAR(20)
);

-- Inputting all of the entries into administration_staff
INSERT INTO administration_staff (AS_WorkerID, Admin_level)
VALUES (1041, 'Manager');
INSERT INTO administration_staff (AS_WorkerID, Admin_level)
VALUES (1080, 'Assistant');

SELECT * FROM administration_staff; -- Check output

-- Creating nurses table
DROP TABLE nurses;

CREATE TABLE nurses (
    Nur_WorkerID NUMBER(4,0)
        CONSTRAINT nurses_pk
        PRIMARY KEY,
        CONSTRAINT nurses_fk
        FOREIGN KEY (Nur_WorkerID)
        REFERENCES general_staff (gs_workerID),
    Certificate_Index VARCHAR2(50)
);

-- Inputting all of the entries into nurse
INSERT INTO nurses (Nur_WorkerID, certificate_index)
VALUES (1011, 'Nursing Assistant (CNA)');
INSERT INTO nurses (Nur_WorkerID, certificate_index)
VALUES (1053, 'Registered Nurse (RN)');
INSERT INTO nurses (Nur_WorkerID, certificate_index)
VALUES (1091, 'Advanced Practice Registered Nurse (APRN)');

SELECT * FROM nurses; -- Check output

-- Creating shifts table
DROP TABLE shifts;

CREATE TABLE shifts (
    Shift_ID CHAR(5)
        CONSTRAINT shifts_pk
        PRIMARY KEY,
    Shift_time VARCHAR(20)
);

-- Inputting all of the entries into shifts
INSERT INTO shifts (shift_id, shift_time)
VALUES ('MON-1', 'Monday 9am-11am');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('MON-2', 'Monday 1pm-3pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('MON-3', 'Monday 3pm-5pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('TUE-1', 'Tuesday 9am-11am');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('TUE-2', 'Tuesday 1pm-3pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('TUE-3', 'Tuesday 3pm-5pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('WED-1', 'Wednesday 9am-11am');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('WED-2', 'Wednesday 1pm-3pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('WED-3', 'Wednesday 3pm-5pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('THU-1', 'Thursday 9am-11am');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('THU-2', 'Thursday 1pm-3pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('THU-3', 'Thursday 3pm-5pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('FRI-1', 'Friday 9am-11am');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('FRI-2', 'Friday 1pm-3pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('FRI-3', 'Friday 3pm-5pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('SAT-1', 'Saturday 9am-11am');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('SAT-2', 'Saturday 1pm-3pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('SAT-3', 'Saturday 3pm-5pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('SUN-1', 'Sunday 9am-11am');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('SUN-2', 'Sunday 1pm-3pm');
INSERT INTO shifts (shift_id, shift_time)
VALUES ('SUN-3', 'Sunday 3pm-5pm');

SELECT * FROM shifts; -- Check output

-- Creating delegated table
DROP TABLE delegated;

CREATE TABLE delegated (
    SW_WorkerID NUMBER(4,0),
        CONSTRAINT delegated_sw_workerid_fk
        FOREIGN KEY (SW_WorkerID)
        REFERENCES social_workers (SW_WorkerID),
    Shift_ID CHAR(5),
        CONSTRAINT delegated_shift_id_fk
        FOREIGN KEY (shift_id)
        REFERENCES shifts (shift_id),
        CONSTRAINT delegated_pk
        PRIMARY KEY (SW_WorkerID, Shift_ID)
);

-- Inputting all of the entries into shifts
INSERT INTO delegated (sw_workerid, shift_id) VALUES (2471, 'MON-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (2471, 'MON-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (2471, 'TUE-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (2471, 'TUE-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (2471, 'WED-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (2471, 'WED-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (2471, 'THU-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (2471, 'THU-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (2471, 'FRI-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (2471, 'FRI-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (1232, 'MON-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (1232, 'MON-3');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (1232, 'TUE-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (1232, 'TUE-3');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (1232, 'WED-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (1232, 'WED-3');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (1232, 'THU-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (1232, 'THU-3');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (1232, 'SAT-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (1232, 'SAT-3');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (7493, 'TUE-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (7493, 'TUE-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (7493, 'WED-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (7493, 'WED-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (7493, 'THU-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (7493, 'THU-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (7493, 'FRI-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (7493, 'FRI-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (7493, 'SAT-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (7493, 'SAT-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (8014, 'SUN-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (8014, 'SUN-3');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (8014, 'WED-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (8014, 'WED-3');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (8014, 'THU-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (8014, 'THU-3');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (8014, 'FRI-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (8014, 'FRI-3');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (8014, 'SAT-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (8014, 'SAT-3');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (6715, 'WED-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (6715, 'WED-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (6715, 'THU-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (6715, 'THU-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (6715, 'FRI-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (6715, 'FRI-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (6715, 'SAT-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (6715, 'SAT-2');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (6715, 'SUN-1');
INSERT INTO delegated (sw_workerid, shift_id) VALUES (6715, 'SUN-2');

SELECT * FROM delegated; -- Check output

-- Creating patients table
DROP TABLE patients;

CREATE TABLE patients (
    Patient_ID NUMBER(5,0)
        CONSTRAINT patients_pk
        PRIMARY KEY,
    Patient_type VARCHAR2(20),
    Patient_Fname VARCHAR2(20),
    Patient_Lname VARCHAR2(20),
    age NUMBER(3,0),
    Gender CHAR(1),
        CHECK (gender IN ('M', 'F')),
    Street_No NUMBER(3,0),
    Street VARCHAR2(100),
    Suburb VARCHAR2(100),
    State VARCHAR2(3),
    Postcode NUMBER(4,0),
        CHECK (postcode BETWEEN 1000 AND 9999),
    Registration_Date DATE DEFAULT SYSDATE,
    Room_Preference VARCHAR2(40),
    Health_Fund VARCHAR2(20),
    Discount_Rate NUMBER(4,2),
    Spec_workerID NUMBER(4,0),
        CONSTRAINT patients_fk
        FOREIGN KEY (spec_workerID)
        REFERENCES specialists (spec_workerID),
        CONSTRAINT patient_id_range
        CHECK (patient_id BETWEEN 10000 AND 99999)
);

-- Inputting all of the entries into patients
INSERT INTO patients (patient_ID, patient_type, patient_fname, patient_lname, age, gender,
    street_no, street, suburb, state, postcode, registration_date, room_preference, health_fund, discount_rate, spec_workerid)
VALUES (12356, 'Resident', 'Thomas', 'Koon', 60, 'M', 73, 'Villeneuve St.', 'Hidden Valley', 'VIC', 3756,
    TO_DATE('04/10/2019', 'dd/mm/yy'), 'Room w/ 1 Bed', 'Apia', 10.00, 1876);
INSERT INTO patients (patient_ID, patient_type, patient_fname, patient_lname, age, gender,
    street_no, street, suburb, state, postcode, registration_date, room_preference, health_fund, discount_rate, spec_workerid)
VALUES (51637, 'Resident', 'Ariadne', 'Shea', 34, 'F', 95, 'Gaggin St.', 'Stockrington', 'NSW', 2322,
    TO_DATE('05/12/2019', 'dd/mm/yy'), 'Room w/ 1 Bed', 'Apia', 4.00, 1337);
INSERT INTO patients (patient_ID, patient_type, patient_fname, patient_lname, age, gender,
    street_no, street, suburb, state, postcode, registration_date, room_preference, health_fund, discount_rate, spec_workerid)
VALUES (12362, 'Day-surgery', 'Jaime', 'Whittington', 25, 'M', 17, 'Round Dr.', 'Toronto', 'NSW', 2283,
    TO_DATE('12/05/2020', 'dd/mm/yy'), 'Room w/ 1 Bed, Living Room', 'Allianz', 8.00, 1876);
INSERT INTO patients (patient_ID, patient_type, patient_fname, patient_lname, age, gender,
    street_no, street, suburb, state, postcode, registration_date, room_preference, health_fund, discount_rate, spec_workerid)
VALUES (14276, 'Resident', 'Ariana', 'Knight', 67, 'F', 65, 'Fernleigh Av.', 'Neilrex', 'NSW', 2831,
    TO_DATE('02/03/2020', 'dd/mm/yy'), 'Room w/ 2 Beds', 'Allianz', 2.00, 1876);
INSERT INTO patients (patient_ID, patient_type, patient_fname, patient_lname, age, gender,
    street_no, street, suburb, state, postcode, registration_date, room_preference, health_fund, discount_rate, spec_workerid)
VALUES (56348, 'Day-surgery', 'Joanne', 'Reader', 31, 'F', 49, 'Friar John Way', 'LEDA', 'WA', 6170,
    TO_DATE('10/03/2020', 'dd/mm/yy'), 'Room w/ 1 Bed', 'ACA Health', 4.00, 1929);
INSERT INTO patients (patient_ID, patient_type, patient_fname, patient_lname, age, gender,
    street_no, street, suburb, state, postcode, registration_date, room_preference, health_fund, discount_rate, spec_workerid)
VALUES (62537, 'Resident', 'Homer', 'Liu', 16, 'M', 73, 'Villeneuve St.', 'Hidden Valley', 'VIC', 3756,
    TO_DATE('24/04/2020', 'dd/mm/yy'), 'Room w/ 2 Beds', 'Bupa', 8.00, 1929);
INSERT INTO patients (patient_ID, patient_type, patient_fname, patient_lname, age, gender,
    street_no, street, suburb, state, postcode, registration_date, room_preference, health_fund, discount_rate, spec_workerid)
VALUES (25687, 'Day-surgery', 'Subhan', 'Dolan', 18, 'M', 88, 'Glenpark Rd.', 'Minnie Water', 'NSW', 2462,
    TO_DATE('15/02/2020', 'dd/mm/yy'), 'Room w/ 2 Beds', 'Bupa', 2.00, 1337);
INSERT INTO patients (patient_ID, patient_type, patient_fname, patient_lname, age, gender,
    street_no, street, suburb, state, postcode, registration_date, room_preference, health_fund, discount_rate, spec_workerid)
VALUES (26458, 'Resident', 'Julia', 'Connolly', 35, 'F', 51, 'Patton St.', 'Beenak', 'VIC', 3139,
    TO_DATE('29/12/2019', 'dd/mm/yy'), 'Room w/ 1 Bed, Living Room', 'Suncorp', 6.00, 7890);
INSERT INTO patients (patient_ID, patient_type, patient_fname, patient_lname, age, gender,
    street_no, street, suburb, state, postcode, registration_date, room_preference, health_fund, discount_rate, spec_workerid)
VALUES (93674, 'Day-surgery', 'Tyrique', 'Read', 42, 'M', 71, 'McGregor St.', 'Kambah', 'ACT', 2902,
    TO_DATE('17/05/2019', 'dd/mm/yy'), 'Room w/ 1 Bed, Living Room', 'AHM', 2.00, 1337);
INSERT INTO patients (patient_ID, patient_type, patient_fname, patient_lname, age, gender,
    street_no, street, suburb, state, postcode, registration_date, room_preference, health_fund, discount_rate, spec_workerid)
VALUES (17634, 'Day-surgery', 'Janes', 'Bond', 53, 'F', 72, 'Plug St.', 'Black Mountain', 'NSW', 2365,
    TO_DATE('15/10/2020', 'dd/mm/yy'), 'Room w/ 2 Beds', 'Suncorp', 10.00, 7890);

SELECT * FROM patients; -- Check output

-- Creating buildings table
DROP TABLE buildings;

CREATE TABLE buildings (
    Building_ID NUMBER(2,0)
        CONSTRAINT buildings_pk
        PRIMARY KEY, 
    Location VARCHAR(3),
    Name VARCHAR(50)
);

-- Inputting all of the entries into building
INSERT INTO buildings (building_ID, location, name)
VALUES (1, 'C2', 'Resident Building A');
INSERT INTO buildings (building_ID, location, name)
VALUES (3, 'C4', 'Resident Building B');
INSERT INTO buildings (building_ID, location, name)
VALUES (6, 'C9', 'Resident Building F');
INSERT INTO buildings (building_ID, location, name)
VALUES (15, 'D16', 'Cancer Treatment Resident Building');

SELECT * FROM buildings; -- Check output

-- Creating rooms table
DROP TABLE rooms;

CREATE TABLE rooms (
    Room_Number NUMBER(3,0),
    Building_ID NUMBER(2,0),
        CONSTRAINT rooms_fk
        FOREIGN KEY (building_id)
        REFERENCES buildings (building_id),
    Floor NUMBER(1,0),
    Room_Type VARCHAR2(40),
        CHECK (room_type IN ('Room w/ 1 Bed', 'Room w/ 2 Beds', 'Room w/ 1 Bed, Living Room')),
    Room_Status VARCHAR2(10),
        CHECK (room_status IN ('Occupied', 'Vacant')),
    Charges_per_day NUMBER(5,2),
        CONSTRAINT rooms_pk
        PRIMARY KEY (room_number, building_id)
);

-- Inputting all of the entries into rooms
INSERT INTO rooms (building_ID, room_number, floor, room_type, room_status, charges_per_day)
VALUES (1, 004, 0, 'Room w/ 1 Bed, Living Room', 'Occupied', 150.00);
INSERT INTO rooms (building_ID, room_number, floor, room_type, room_status, charges_per_day)
VALUES (1, 005, 0, 'Room w/ 1 Bed, Living Room', 'Occupied', 153.00);
INSERT INTO rooms (building_ID, room_number, floor, room_type, room_status, charges_per_day)
VALUES (3, 201, 2, 'Room w/ 2 Beds', 'Occupied', 110.00);
INSERT INTO rooms (building_ID, room_number, floor, room_type, room_status, charges_per_day)
VALUES (6, 305, 3, 'Room w/ 1 Bed', 'Occupied', 131.50);

SELECT * FROM rooms; -- Check output

-- Creating beds table
DROP TABLE beds;

CREATE TABLE beds (
    Bed_ID NUMBER(3,0)
        CONSTRAINT beds_pk
        PRIMARY KEY,
    Room_Number NUMBER(3,0),
    Building_ID NUMBER(2,0),
        CONSTRAINT beds_fk
        FOREIGN KEY (room_number, building_id)
        REFERENCES rooms (room_number, building_id),
        CONSTRAINT bed_id_range
        CHECK (bed_id BETWEEN 100 AND 999)
);

-- Inputting all of the entries into beds
INSERT INTO beds (bed_id, room_number, building_id)
VALUES (100, 004, 1);
INSERT INTO beds (bed_id, room_number, building_id)
VALUES (411, 005, 1);
INSERT INTO beds (bed_id, room_number, building_id)
VALUES (412, 201, 3);
INSERT INTO beds (bed_id, room_number, building_id)
VALUES (317, 305, 6);
INSERT INTO beds (bed_id, room_number, building_id)
VALUES (303, 201, 3);

SELECT * FROM beds;

-- Creating residents table
DROP TABLE residents;

CREATE TABLE residents (
    Patient_ID NUMBER(5,0)
        CONSTRAINT residents_pk
        PRIMARY KEY,
        CONSTRAINT residents_patient_id_fk
        FOREIGN KEY (patient_ID)
        REFERENCES patients (patient_ID),
    Bed_ID NUMBER(3,0),
        CONSTRAINT residents_bed_id_fk
        FOREIGN KEY (bed_id)
        REFERENCES beds (bed_id),
    Date_Admitted DATE DEFAULT SYSDATE,
    Payable_amount NUMBER(6,2),
    Payment_due NUMBER(6,2),
    Date_paid DATE
);

-- Inputting all of the entries into residents
INSERT INTO residents (patient_ID, bed_ID, date_admitted, payable_amount, payment_due, date_paid)
VALUES (12356, 100, TO_DATE('07/10/2019', 'dd/mm/yy'), 2000.00, 0, TO_DATE('05/01/2020', 'dd/mm/yy'));
INSERT INTO residents (patient_ID, bed_ID, date_admitted, payable_amount, payment_due, date_paid)
VALUES (51637, 303, TO_DATE('06/12/2019', 'dd/mm/yy'), 590.00, 0, TO_DATE('07/01/2020', 'dd/mm/yy'));
INSERT INTO residents (patient_ID, bed_ID, date_admitted, payable_amount, payment_due, date_paid)
VALUES (14276, 411, TO_DATE('15/03/2020', 'dd/mm/yy'), 1342.00, 142.00, NULL);
INSERT INTO residents (patient_ID, bed_ID, date_admitted, payable_amount, payment_due, date_paid)
VALUES (62537, 412, TO_DATE('10/05/2020', 'dd/mm/yy'), 4580.00, 342.00, NULL);
INSERT INTO residents (patient_ID, bed_ID, date_admitted, payable_amount, payment_due, date_paid)
VALUES (26458, 317, TO_DATE('30/12/2019', 'dd/mm/yy'), 1690.00, 0, TO_DATE('11/01/2020', 'dd/mm/yy'));

SELECT * FROM residents; -- Check output

-- Creating tasks table
DROP TABLE tasks;

CREATE TABLE tasks (
    Patient_ID NUMBER(5,0),
    Task_Timestamp TIMESTAMP,
    Task_Type VARCHAR2(3),
        CHECK (task_type IN ('TRT', 'CU')),
        CONSTRAINT tasks_pk
        PRIMARY KEY (patient_ID, task_timestamp),
        CONSTRAINT tasks_fk
        FOREIGN KEY (patient_id)
        REFERENCES patients (patient_id)
);

-- Inputting all of the entries into task
INSERT INTO tasks (patient_ID, task_timestamp, task_type)
VALUES (12356, TO_DATE('04/10/2019 17:00:00', 'dd/mm/yy HH24:MI:SS'), 'CU');
INSERT INTO tasks (patient_ID, task_timestamp, task_type)
VALUES (12356, TO_DATE('05/10/2019 10:00:00', 'dd/mm/yy HH24:MI:SS'), 'TRT');
INSERT INTO tasks (patient_ID, task_timestamp, task_type)
VALUES (51637, TO_DATE('08/12/2019 17:00:00', 'dd/mm/yy HH24:MI:SS'), 'CU');
INSERT INTO tasks (patient_ID, task_timestamp, task_type)
VALUES (56348, TO_DATE('24/03/2020 11:00:00', 'dd/mm/yy HH24:MI:SS'), 'TRT');
INSERT INTO tasks (patient_ID, task_timestamp, task_type)
VALUES (12356, TO_DATE('06/10/2019 19:00:00', 'dd/mm/yy HH24:MI:SS'), 'CU');
INSERT INTO tasks (patient_ID, task_timestamp, task_type)
VALUES (62537, TO_DATE('24/04/2020 21:00:00', 'dd/mm/yy HH24:MI:SS'), 'CU');
INSERT INTO tasks (patient_ID, task_timestamp, task_type)
VALUES (93674, TO_DATE('19/05/2020 11:00:00', 'dd/mm/yy HH24:MI:SS'), 'TRT');
INSERT INTO tasks (patient_ID, task_timestamp, task_type)
VALUES (12356, TO_DATE('08/10/2019 13:00:00', 'dd/mm/yy HH24:MI:SS'), 'CU');
INSERT INTO tasks (patient_ID, task_timestamp, task_type)
VALUES (93674, TO_DATE('19/05/2020 10:00:00', 'dd/mm/yy HH24:MI:SS'), 'CU');
INSERT INTO tasks (patient_ID, task_timestamp, task_type)
VALUES (17634, TO_DATE('16/10/2020 8:00:00', 'dd/mm/yy HH24:MI:SS'), 'CU');

SELECT * FROM tasks; -- Check output

-- Creating treatment table
DROP TABLE treatment;

CREATE TABLE treatment (
    Patient_ID NUMBER(5,0),
    Treatment_timestamp TIMESTAMP,
    Spec_WorkerID NUMBER(4,0),
    Treatment_Given VARCHAR2(100),
    Treatment_Advice VARCHAR2(100),
    Payable_amount NUMBER(7,2),
    Payment_due NUMBER(7,2),
    Date_paid DATE,
    Payment_Mode VARCHAR(15),
        CONSTRAINT treatment_pk
        PRIMARY KEY (patient_id, treatment_timestamp),
        CONSTRAINT treatment_task_fk
        FOREIGN KEY (patient_id, treatment_timestamp)
        REFERENCES tasks (patient_id, task_timestamp),
        CONSTRAINT treatment_specialist_fk
        FOREIGN KEY (spec_workerid)
        REFERENCES specialists (spec_workerid)
);

-- Inputting all of the entries into treatment
INSERT INTO treatment (patient_ID, treatment_timestamp, spec_workerID, treatment_given,
    treatment_advice, payable_amount, payment_due, date_paid, payment_mode)
VALUES (12356, TO_DATE('05/10/2019 10:00:00', 'dd/mm/yy HH24:MI:SS'), 1929, 'Heart surgery',
    'Take prescribed medicine as indicated, frequent check-ups during the day',
    150.00, 0, TO_DATE('05/10/2019', 'dd/mm/yy'), 'CASH');
INSERT INTO treatment (patient_ID, treatment_timestamp, spec_workerID, treatment_given,
    treatment_advice, payable_amount, payment_due, date_paid, payment_mode)
VALUES (56348, TO_DATE('24/03/2020 11:00:00', 'dd/mm/yy HH24:MI:SS'), 1337, 'Specialist examination of skin', 
    'Use cream twice a day for one month, then check-in with assigned specialist',
    225.00, 0, TO_DATE('27/03/2020', 'dd/mm/yy'), 'DEBIT');
INSERT INTO treatment (patient_ID, treatment_timestamp, spec_workerID, treatment_given,
    treatment_advice, payable_amount, payment_due, date_paid, payment_mode)
VALUES (93674, TO_DATE('19/05/2020 11:00:00', 'dd/mm/yy HH24:MI:SS'), 7890, 'Thyroid day-surgery',
    'Take rest and try eat solid foods to avoid infection, before next check-up',
    5617.00, 117.00, NULL, 'CREDIT');
    
SELECT * FROM treatment; -- Check output

-- Creating checkup table
DROP TABLE checkup;

CREATE TABLE checkup (
    Patient_ID NUMBER(5,0),
    Checkup_timestamp TIMESTAMP,
    Nur_workerid NUMBER(4,0),
        CONSTRAINT checkup_pk
        PRIMARY KEY (patient_id, checkup_timestamp),
        CONSTRAINT checkup_task_fk
        FOREIGN KEY (patient_id, checkup_timestamp)
        REFERENCES tasks (patient_id, task_timestamp),
        CONSTRAINT checkup_nurse_id_fk
        FOREIGN KEY (Nur_workerid)
        REFERENCES nurses (Nur_workerid)
);

-- Inputting all of the entries into checkup
INSERT INTO checkup (patient_ID, Checkup_timestamp, Nur_workerid)
VALUES (12356, TO_DATE('04/10/2019 17:00:00', 'dd/mm/yy HH24:MI:SS'), 1011);
INSERT INTO checkup (patient_ID, Checkup_timestamp, Nur_workerid)
VALUES (51637, TO_DATE('08/12/2019 17:00:00', 'dd/mm/yy HH24:MI:SS'), 1011);
INSERT INTO checkup (patient_ID, Checkup_timestamp, Nur_workerid)
VALUES (12356, TO_DATE('06/10/2019 19:00:00', 'dd/mm/yy HH24:MI:SS'), 1053);
INSERT INTO checkup (patient_ID, Checkup_timestamp, Nur_workerid)
VALUES (62537, TO_DATE('24/04/2020 21:00:00', 'dd/mm/yy HH24:MI:SS'), 1053);
INSERT INTO checkup (patient_ID, Checkup_timestamp, Nur_workerid)
VALUES (12356, TO_DATE('08/10/2019 13:00:00', 'dd/mm/yy HH24:MI:SS'), 1091);
INSERT INTO checkup (patient_ID, Checkup_timestamp, Nur_workerid)
VALUES (93674, TO_DATE('19/05/2020 10:00:00', 'dd/mm/yy HH24:MI:SS'), 1091);
INSERT INTO checkup (patient_ID, Checkup_timestamp, Nur_workerid)
VALUES (17634, TO_DATE('16/10/2020 8:00:00', 'dd/mm/yy HH24:MI:SS'), 1091);

SELECT * FROM checkup; -- Check output

-- Creating day_surgery table
DROP TABLE day_surgery;

CREATE TABLE day_surgery (
    Patient_ID NUMBER(5,0),
    DS_Timestamp TIMESTAMP,
    Payment_amount NUMBER(7,2),
    Payment_due NUMBER(7,2),
    Date_paid DATE,
    Payment_mode VARCHAR2(10),
        CONSTRAINT day_surgery_fk
        FOREIGN KEY (patient_id)
        REFERENCES patients (patient_id),
        CONSTRAINT day_surgery_pk
        PRIMARY KEY (patient_id, ds_timestamp)
);

-- Inputting all of the entries into day_surgery
INSERT INTO day_surgery (patient_ID, DS_timestamp, payment_amount, payment_due, date_paid, payment_mode) 
VALUES (12362, TO_DATE('12/05/2020 23:00:00', 'dd/mm/yy HH24:MI:SS'), 225.00, 0, 
    TO_DATE('12/05/2020', 'dd/mm/yy'), 'CASH');
INSERT INTO day_surgery (patient_ID, DS_timestamp, payment_amount, payment_due, date_paid, payment_mode) 
VALUES (56348, TO_DATE('15/03/2020 11:00:00', 'dd/mm/yy HH24:MI:SS'), 225.00, 0, 
    TO_DATE('19/05/2020', 'dd/mm/yy'), 'CREDIT');
INSERT INTO day_surgery (patient_ID, DS_timestamp, payment_amount, payment_due, date_paid, payment_mode) 
VALUES (25687, TO_DATE('16/02/2020 15:00:00', 'dd/mm/yy HH24:MI:SS'), 225.00, 0, 
    TO_DATE('25/03/2020', 'dd/mm/yy'), 'CREDIT');
INSERT INTO day_surgery (patient_ID, DS_timestamp, payment_amount, payment_due, date_paid, payment_mode) 
VALUES (93674, TO_DATE('19/05/2020 14:00:00', 'dd/mm/yy HH24:MI:SS'), 225.00, 0, 
    TO_DATE('23/05/2020', 'dd/mm/yy'), 'DEBIT');
INSERT INTO day_surgery (patient_ID, DS_timestamp, payment_amount, payment_due, date_paid, payment_mode) 
VALUES (17634, TO_DATE('16/10/2020 7:00:00', 'dd/mm/yy HH24:MI:SS'), 225.00, 67.00, 
    NULL, 'DEBIT');

SELECT * FROM day_surgery; -- Check output

-- Creating visits table
DROP TABLE visits;

CREATE TABLE visits (
    visit_id NUMBER(8,0) NOT NULL,
    Visit_timestamp TIMESTAMP DEFAULT SYSDATE,
    Patient_ID NUMBER(5,0),
        CONSTRAINT visits_fk
        FOREIGN KEY (patient_id)
        REFERENCES patients (patient_id),
    Visit_Type VARCHAR2(3),
        CHECK (visit_type IN ('GV', 'PCI')),
        CONSTRAINT visits_pk
        PRIMARY KEY (visit_id)
);

DROP SEQUENCE seq_visit_id;

CREATE SEQUENCE seq_visit_id
START WITH 10000000
INCREMENT BY 1
MAXVALUE 99999999
NOCACHE
NOCYCLE;

-- Inputting all of the entries into visits
INSERT INTO visits (visit_id, Visit_timestamp,  patient_Id, visit_type)
VALUES (seq_visit_id.nextval, TO_DATE('13/05/2020 10:04:41', 'dd/mm/yy HH24:MI:SS'), 12362, 'GV');
INSERT INTO visits (visit_id, Visit_timestamp,  patient_Id, visit_type)
VALUES (seq_visit_id.nextval, TO_DATE('16/03/2020 11:50:52', 'dd/mm/yy HH24:MI:SS'), 56348, 'GV');
INSERT INTO visits (visit_id, Visit_timestamp,  patient_Id, visit_type)
VALUES (seq_visit_id.nextval, TO_DATE('23/04/2020 10:12:34', 'dd/mm/yy HH24:MI:SS'), 56348, 'PCI');
INSERT INTO visits (visit_id, Visit_timestamp,  patient_Id, visit_type)
VALUES (seq_visit_id.nextval, TO_DATE('20/06/2019 12:23:14', 'dd/mm/yy HH24:MI:SS'), 93674, 'PCI');
INSERT INTO visits (visit_id, Visit_timestamp,  patient_Id, visit_type)
VALUES (seq_visit_id.nextval, TO_DATE('27/02/2020 13:25:13', 'dd/mm/yy HH24:MI:SS'), 25687, 'PCI');
INSERT INTO visits (visit_id, Visit_timestamp,  patient_Id, visit_type)
VALUES (seq_visit_id.nextval, TO_DATE('18/02/2020 13:12:13', 'dd/mm/yy HH24:MI:SS'), 25687, 'PCI');
INSERT INTO visits (visit_id, Visit_timestamp,  patient_Id, visit_type)
VALUES (seq_visit_id.nextval, TO_DATE('19/05/2020 15:09:25', 'dd/mm/yy HH24:MI:SS'), 93674, 'GV');
INSERT INTO visits (visit_id, Visit_timestamp,  patient_Id, visit_type)
VALUES (seq_visit_id.nextval, TO_DATE('20/05/2020 12:43:24', 'dd/mm/yy HH24:MI:SS'), 93674, 'GV');
INSERT INTO visits (visit_id, Visit_timestamp,  patient_Id, visit_type)
VALUES (seq_visit_id.nextval, TO_DATE('17/02/2020 12:23:51', 'dd/mm/yy HH24:MI:SS'), 25687, 'GV');
INSERT INTO visits (visit_id, Visit_timestamp,  patient_Id, visit_type)
VALUES (seq_visit_id.nextval, TO_DATE('17/10/2020 16:53:12', 'dd/mm/yy HH24:MI:SS'), 17634, 'GV');
INSERT INTO visits (visit_id, Visit_timestamp,  patient_Id, visit_type)
VALUES (seq_visit_id.nextval, TO_DATE('30/10/2020 16:12:00', 'dd/mm/yy HH24:MI:SS'), 17634, 'PCI');

SELECT * FROM visits; -- Check output

-- Creating guest_visit table
DROP TABLE guest_visit;

CREATE TABLE guest_visit (
    GV_visit_id NUMBER(8,0),
    Guest_fname VARCHAR2(20),
    Guest_lname VARCHAR2(20),
    Guest_contact CHAR(10),
    Guest_street_no NUMBER(3,0),
    Guest_street VARCHAR2(100),
    Guest_suburb VARCHAR2(100),
    Guest_state VARCHAR2(3),
    Guest_postcode NUMBER(4,0),
        CONSTRAINT guest_visit_pk
        PRIMARY KEY (gv_visit_id),
        CONSTRAINT guest_visit_fk
        FOREIGN KEY (gv_visit_id)
        REFERENCES visits (visit_id)
);

-- Inputting all of the entries into guest_visit
INSERT INTO guest_visit (gv_visit_id, guest_fname, guest_lname, 
    guest_street_no, guest_street, guest_suburb, guest_state, guest_postcode, guest_contact)
VALUES (10000000, 'Jason', 'Khu', 
    64, 'Armstrong St.', 'Kamarooka', 'VIC', 3570, '0411111111');
INSERT INTO guest_visit (gv_visit_id, guest_fname, guest_lname, 
    guest_street_no, guest_street, guest_suburb, guest_state, guest_postcode, guest_contact)
VALUES (10000001, 'Jacky', 'Li', 
    8, 'Timms Dr.', 'Wallaga Lake Heights', 'NSW', 2546, '0422222222');
INSERT INTO guest_visit (gv_visit_id, guest_fname, guest_lname, 
    guest_street_no, guest_street, guest_suburb, guest_state, guest_postcode, guest_contact)
VALUES (10000006, 'Chloe', 'Tam', 
    44, 'Carolina Park Rd.', 'Palm Grove', 'NSW', 2258, '0433333333');
INSERT INTO guest_visit (gv_visit_id, guest_fname, guest_lname, 
    guest_street_no, guest_street, guest_suburb, guest_state, guest_postcode, guest_contact)
VALUES (10000007, 'Wendy', 'Chau', 
    61, 'Panorama Rd.', 'Dungowan', 'NSW', 2340, '0444444444');
INSERT INTO guest_visit (gv_visit_id, guest_fname, guest_lname, 
    guest_street_no, guest_street, guest_suburb, guest_state, guest_postcode, guest_contact)
VALUES (10000008, 'Johnnie', 'Pham', 
    12, 'Taltarni Rd.', 'Darkbonee', 'VIC', 3478, '0455555555');
INSERT INTO guest_visit (gv_visit_id, guest_fname, guest_lname, 
    guest_street_no, guest_street, guest_suburb, guest_state, guest_postcode, guest_contact)
VALUES (10000009, 'Maruigi', 'Powser', 
    77, 'Souttar Te.', 'Wembley Downs', 'WA', 6019, '0499999999');

SELECT * FROM guest_visit; -- Check output

-- Creating patient_checkin table
DROP TABLE patient_checkin;

CREATE TABLE patient_checkin (
    PCI_visit_id NUMBER(8,0)
        CONSTRAINT patient_checkin_pk
        PRIMARY KEY,
    Spec_WorkerID NUMBER(4,0),
        CONSTRAINT patient_checkin_visits_fk
        FOREIGN KEY (PCI_visit_id)
        REFERENCES visits (visit_id),
        CONSTRAINT patient_checkin_spec_fk
        FOREIGN KEY (spec_workerID)
        REFERENCES specialists (spec_workerID)
);

-- Inputting all of the entries into patient_checkin
INSERT INTO patient_checkin (PCI_visit_id, spec_workerID)
VALUES (10000002, 7948);
INSERT INTO patient_checkin (PCI_visit_id, spec_workerID)
VALUES (10000003, 7890);
INSERT INTO patient_checkin (PCI_visit_id, spec_workerID)
VALUES (10000004, 7890);
INSERT INTO patient_checkin (PCI_visit_id, spec_workerID)
VALUES (10000005, 7948);
INSERT INTO patient_checkin (PCI_visit_id, spec_workerID)
VALUES (10000010, 1337);

SELECT * FROM patient_checkin; -- Check output

-- Creating results table
DROP TABLE results;

CREATE TABLE results (
    visit_id NUMBER(8,0)
        CONSTRAINT results_pk
        PRIMARY KEY,
    cleared_positive VARCHAR2(3)
        CHECK (cleared_positive IN ('YES', 'NO')),
    close_contact_1 VARCHAR2(3)
        CHECK (close_contact_1 IN ('YES', 'NO')),
    close_contact_2 VARCHAR2(3)
        CHECK (close_contact_2 IN ('YES', 'NO')),
    symptoms VARCHAR2(3)
        CHECK (symptoms IN ('YES', 'NO')),
    hotspot_or_dtravel VARCHAR2(3)
        CHECK (hotspot_or_dtravel IN ('YES', 'NO')),
        CONSTRAINT results_fk
        FOREIGN KEY (visit_id)
        REFERENCES visits (visit_id)
);

INSERT INTO results (visit_id, cleared_positive, close_contact_1, close_contact_2, symptoms, hotspot_or_dtravel)
VALUES (10000000, 'YES', 'NO', 'NO', 'NO', 'NO');
INSERT INTO results (visit_id, cleared_positive, close_contact_1, close_contact_2, symptoms, hotspot_or_dtravel)
VALUES (10000001, 'YES', 'NO', 'NO', 'NO', 'NO');
INSERT INTO results (visit_id, cleared_positive, close_contact_1, close_contact_2, symptoms, hotspot_or_dtravel)
VALUES (10000002, 'YES', 'NO', 'NO', 'NO', 'NO');
INSERT INTO results (visit_id, cleared_positive, close_contact_1, close_contact_2, symptoms, hotspot_or_dtravel)
VALUES (10000003, 'YES', 'NO', 'NO', 'YES', 'NO');
INSERT INTO results (visit_id, cleared_positive, close_contact_1, close_contact_2, symptoms, hotspot_or_dtravel)
VALUES (10000004, 'YES', 'NO', 'NO', 'NO', 'NO');
INSERT INTO results (visit_id, cleared_positive, close_contact_1, close_contact_2, symptoms, hotspot_or_dtravel)
VALUES (10000005, 'YES', 'NO', 'NO', 'NO', 'NO');
INSERT INTO results (visit_id, cleared_positive, close_contact_1, close_contact_2, symptoms, hotspot_or_dtravel)
VALUES (10000006, 'YES', 'NO', 'NO', 'NO', 'NO');
INSERT INTO results (visit_id, cleared_positive, close_contact_1, close_contact_2, symptoms, hotspot_or_dtravel)
VALUES (10000007, 'YES', 'NO', 'YES', 'NO', 'NO');
INSERT INTO results (visit_id, cleared_positive, close_contact_1, close_contact_2, symptoms, hotspot_or_dtravel)
VALUES (10000008, 'YES', 'YES', 'NO', 'NO', 'NO');
INSERT INTO results (visit_id, cleared_positive, close_contact_1, close_contact_2, symptoms, hotspot_or_dtravel)
VALUES (10000009, 'YES', 'NO', 'NO', 'NO', 'NO');
INSERT INTO results (visit_id, cleared_positive, close_contact_1, close_contact_2, symptoms, hotspot_or_dtravel)
VALUES (10000010, 'YES', 'NO', 'NO', 'NO', 'NO');

select * from results;

-- Check all tables: departments, workers, general_staff, social_workers, specialists,
    -- technicians, allocated, laboratory, general_doctor, administration_staff,
    -- nurses, shifts, patients, residents, beds, rooms, buildings, tasks, treatment
    -- checkup, day_surgery, guest_visit, patient_checkin
select * from departments;
select * from workers;
select * from general_staff;
select * from social_workers;
select * from specialists;
select * from technicians;
select * from allocated;
select * from laboratory;
select * from general_doctor;
select * from administration_staff;
select * from nurses;
select * from shifts;
select * from patients;
select * from residents;
select * from beds;
select * from rooms;
select * from buildings;
select * from tasks;
select * from treatment;
select * from checkup;
select * from day_surgery;
select * from visits;
select * from guest_visit;
select * from patient_checkin;
select * from results;

-- SQL Queries for the assignment

--1: List all patients (name, personID, address) whose most recent visit is after 01-01-2020
SELECT patient_ID AS "Person ID", patient_fname || ' ' || patient_lname AS "Full Name",
    street_no || ' ' || street || ', ' || suburb || ', ' || state || ', ' || postcode AS "Address"
FROM patients
WHERE patient_ID IN 
(   SELECT DISTINCT patient_ID
    FROM visits
    WHERE visit_type = 'PCI' AND visit_timestamp > '01/JAN/2020'
);

--2: Display the information of departments employing technicians who are working
    --for the lab called 'Sepsis Lab'

SELECT department_ID AS "Department ID", 
    Dep_location AS "Location", 
    Dep_name AS "Name", 
    Dep_facilities AS "Facilities", 
    Dep_description AS "Description"
FROM departments
WHERE department_ID IN
(   SELECT department_id
    FROM workers 
    WHERE worker_id IN 
    (   SELECT t_workerid
        FROM allocated
        WHERE lab_name = 'Sepsis Lab'
    )
);
    
--3: List the person ID, phone# of all specialists who given treatment advice to
    --a patient whose name is "Thomas Koon"

SELECT worker_ID AS "Person ID", phone# 
FROM workers
WHERE worker_id IN 
(   SELECT spec_workerid
    FROM treatment
    WHERE patient_ID IN 
    (   SELECT patient_ID
        FROM patients
        WHERE patient_fname = 'Thomas' AND patient_lname = 'Koon' 
    )
);

--4: List all resident patients (ID, name, discount_rate) who have received treatment 
    --from specialists with the specialty “cardiovascular disease.”
    
SELECT patient_id AS "ID", patient_fname || ' ' || patient_lname AS "Name", discount_rate AS "Discount Rate"
FROM patients
WHERE patient_id IN
(   SELECT patient_id 
    FROM residents
    WHERE patient_id IN
    (   SELECT patient_id 
        FROM treatment
        WHERE spec_workerID IN 
        (   SELECT spec_workerID
            FROM specialists
            WHERE specialty = 'Cardiovascular Disease'
        )
    )
);

--5: List all visits of day-surgery and their activities in 2020.

SELECT t.patient_ID AS "Patient ID", 
    ds.ds_timestamp AS "Visit Timestamp", 
    t.task_timestamp AS "Activity",
    t.task_type AS "Activity Type"
FROM tasks t
INNER JOIN day_surgery ds
ON t.patient_ID = ds.patient_ID
WHERE t.task_timestamp > '31/DEC/2019' AND t.task_timestamp < '01/JAN/2021';

--6: Count the total number of rooms accommodating patients who made their 
    --payments between “01-01-2020” and “01-12-2020”

SELECT COUNT(DISTINCT(room_number || '-' || building_id)) AS "Room Count"
FROM beds
WHERE bed_id IN
(   SELECT bed_id 
    FROM residents
    WHERE payment_due = 0 AND date_paid >= '01/JAN/2020' AND date_paid <= '12/JAN/2020'
);

--7: List all the visitors or patients who went through the screening process during their visit to SGH.

SELECT guest_fname || ' ' || guest_lname AS "Guest Name", 
    guest_contact AS "Guest Contact"
FROM guest_visit
WHERE gv_visit_id IN
(   SELECT visit_id
    FROM visits
    WHERE visit_type = 'GV' AND visit_id IN
    (   SELECT visit_id 
        FROM results
    )
);

SELECT visit_id
    FROM visits
    WHERE visit_type = 'GV' AND visit_id IN
    (   SELECT visit_id 
        FROM results
    );

--8: Display the total amount of treatment payments for each female patient 
    --whose age is over 30.

SELECT p.patient_id AS "Patient ID", 
    SUM(t.payable_amount - t.payment_due) AS "Total Treatment Payments"
FROM patients p
INNER JOIN treatment t
ON p.patient_id = t.patient_id
WHERE p.age > 30 AND p.gender = 'F'
GROUP BY p.patient_id;

-- Remember to:

COMMIT;
