CREATE DATABASE BBlood_Donation3;

----omar-------
CREATE TABLE Branch (
    Branch_ID    VARCHAR(20) NOT NULL,
    BranchName   VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Contact VARCHAR(15) NOT NULL,
    CONSTRAINT Branch_PK PRIMARY KEY (Branch_ID)
);

INSERT INTO Branch (Branch_ID, BranchName, Address, Contact) 
VALUES 
('B001', 'Cairo Central', '12 Nile St, Cairo', '0123456789'),
('B002', 'Alexandria Main', '45 Corniche St, Alexandria', '0134567890'),
('B003', 'Giza West', '78 Pyramids Rd, Giza', '0145678901'),
('B004', 'Luxor East', '23 Karnak St, Luxor', '0156789012'),
('B005', 'Aswan South', '56 Nile View, Aswan', '0167890123');

CREATE TABLE Donor (
    Donor_ID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    BloodType VARCHAR(5) NOT NULL,
    Contact VARCHAR(15) NOT NULL,
    CONSTRAINT Donor_PK PRIMARY KEY (Donor_ID)
);
INSERT INTO Donor (Donor_ID, Name, DOB, Gender, BloodType, Contact)
VALUES
(101, 'Hassan Mostafa', '1985-02-15', 'Male', 'A+', '0123456789'),
(102, 'Mona Farouk', '1990-07-10', 'Female', 'O-', '0134567890'),
(103, 'Tamer Youssef', '1988-11-25', 'Male', 'B+', '0145678901'),
(104, 'Dina Kamal', '1992-03-12', 'Female', 'AB+', '0156789012'),
(105, 'Karim Adel', '1980-06-18', 'Male', 'O+', '0167890123');



CREATE TABLE Donation (
    Donation_ID INT NOT NULL,
    Donor_ID INT NOT NULL,
    Branch_No VARCHAR(20) NOT NULL,
    DonationDate DATE NOT NULL,
    Quantity INT NOT NULL,

    CONSTRAINT Donation_PK PRIMARY KEY (Donation_ID),
    CONSTRAINT Donation_Donor_fk FOREIGN KEY (Donor_ID)
        REFERENCES Donor(Donor_ID),
    CONSTRAINT Donation_Branch_fk FOREIGN KEY (Branch_No)
        REFERENCES Branch(Branch_ID)
);

--------HABIBA HASSAN--------

CREATE TABLE Staff (
    Staff_ID INT NOT NULL,
    staff_Name VARCHAR(50) NOT NULL,
    staff_Bdate DATE,
    staff_email VARCHAR(100),
    staff_Role VARCHAR(30),
    staff_Address VARCHAR(100) NOT NULL,
    staff_Shift_Timing VARCHAR(10),
    staff_Hire_Date DATE NOT NULL,
    Staff_extra_INFO   TEXT,
    branch_no    VARCHAR(20),
    staff_salary INT,

    CONSTRAINT Staff_PK PRIMARY KEY (Staff_ID),
    CONSTRAINT Staff_Branch_fk FOREIGN KEY (branch_no)
        REFERENCES Branch(Branch_ID)
);

ALTER TABLE Staff
ALTER COLUMN staff_email VARCHAR (100);



INSERT INTO Staff 
VALUES
(101, 'Ahmed Salah', '1985-01-10', 'ahmed.salah@email.com', 'Manager', '12 Nile St, Cairo', '09:00-17', '2010-05-01', 'Experienced in hospital management', 'B001', 2000),
(102, 'Sara Youssef', '1990-03-15', 'sara.youssef@email.com', 'Nurse', '45 Corniche St, Alexandria', '08:00-16', '2015-06-10', 'Specialist in pediatrics', 'B002', 1500),
(103, 'Mohamed Adel', '1988-07-20', 'mohamed.adel@email.com', 'Technician', '78 Pyramids Rd, Giza', '10:00-18', '2012-09-12', 'Lab technician for blood tests', 'B003', 1400),
(104, 'Laila Nabil', '1992-12-05', 'laila.nabil@email.com', 'Doctor', '23 Karnak St, Luxor', '09:00-17', '2018-03-01', 'Handles patient registration', 'B004', 1200),
(105, 'Omar Hassan', '1980-06-18', 'omar.hassan@email.com', 'Driver', '56 Nile View, Aswan', '07:00-15', '2008-11-20', 'Responsible for transport', 'B005', 1300),
(106, 'Mona Farid', '1987-04-22', 'mona.farid@email.com', 'Event Organizer', '12 Nile St, Cairo', '09:00-17', '2016-08-15', 'Organizes hospital events and campaigns', 'B001', 1700),
(107, 'Dr. Tamer Khaled', '1978-09-12', 'tamer.khaled@email.com', 'Doctor', '45 Corniche St, Alexandria', '08:00-16', '2005-02-10', 'Specialist in internal medicine', 'B002', 3000);





CREATE TABLE Staff_contact (
    S_ID INT NOT NULL,
    S_PhoneNumber VARCHAR(20) NOT NULL,

    CONSTRAINT Staff_contact_PK PRIMARY KEY (S_ID, S_PhoneNumber),
    CONSTRAINT Staff_contact_fk FOREIGN KEY (S_ID)
        REFERENCES Staff(Staff_ID)
);

INSERT INTO Staff_contact  VALUES
(101, '2012345678'),
(101, '201098765'),
(102, '201112223'),
(103, '201223344'),
(103, '201556677'),
(104, '20133445'),
(105, '201445566'),
(106, '201556677'),
(107, '201551117');




CREATE TABLE Trans (
    Trans_ID INT NOT NULL,
    Trans_Quantity INT,
    Trans_Status VARCHAR(20),
    Transaction_Date DATE,
    Staff_No INT,

    CONSTRAINT Trans_PK PRIMARY KEY (Trans_ID),
    CONSTRAINT Trans_Staff_fk FOREIGN KEY (Staff_No)
        REFERENCES Staff(Staff_ID)
        ON UPDATE CASCADE
);

INSERT INTO Trans VALUES
(301, 15, 'Completed', '2025-12-01', 103);

INSERT INTO Trans VALUES
(302, 20, 'Pending', '2025-12-03', 107);

INSERT INTO Trans VALUES
(303, 14, 'Completed', '2025-12-05', 103);

INSERT INTO Trans VALUES
(304, 11, 'Cancelled', '2025-12-07', 107);

INSERT INTO Trans VALUES
(305, 12, 'Completed', '2025-12-10', 102);

INSERT INTO Trans VALUES
(306, 17, 'Pending', '2025-12-12', 103);


CREATE TABLE Recipient (
    Recipient_ID INT NOT NULL,
    Recipient_Name VARCHAR(50) NOT NULL,
    Recipient_Gender CHAR(1),
    Recipient_Bdate DATE,
    Registration_Date DATE NOT NULL,
    Blood_Type_Required VARCHAR(3) NOT NULL,
    Emergency_Level VARCHAR(10) NOT NULL,
    Recipient_City VARCHAR(30),
    Recipient_Street VARCHAR(50),
    Recipient_Zip VARCHAR(10),

    CONSTRAINT Recipient_PK PRIMARY KEY (Recipient_ID)
);

INSERT INTO Recipient VALUES
(201, 'Ahmed Ali', 'M', '1992-03-12', '2025-01-10', 'A+', 'High', 'Cairo', '12 Nile St', '11511');

INSERT INTO Recipient VALUES
(202, 'Sara Khaled', 'F', '1988-07-25', '2025-02-05', 'O-', 'Medium', 'Giza', '45 Tahrir St', '12522');

INSERT INTO Recipient VALUES
(203, 'Omar Hassan', 'M', '1995-11-10', '2025-03-12', 'B+', 'Low', 'Alexandria', '5 Ramses St', '21533');

INSERT INTO Recipient VALUES
(204, 'Mona Farid', 'F', '1990-01-20', '2025-01-30', 'AB-', 'High', 'Cairo', '44 El-Mokattam', '11544');

INSERT INTO Recipient VALUES
(205, 'Youssef Samir', 'M', '1987-09-05', '2025-02-15', 'O+', 'Medium', 'Giza', '88 Heliopolis', '12555');



---------LAMIS MOHAMED--------
CREATE TABLE Dependent (
    Staff_ID INT NOT NULL,
    Dependent_ID INT NOT NULL,
    Dependent_fname VARCHAR(10) NOT NULL,
    Dependent_lname VARCHAR(10) NOT NULL,
    DateOfBirth_day INT,
    DateOfBirth_month INT,
    DateOfBirth_year INT,
    Gender CHAR(1),
    Relationship_to_staff VARCHAR(20),
    Insurance_coverage_level VARCHAR(20),

    CONSTRAINT Dependent_PK PRIMARY KEY (Staff_ID, Dependent_ID),
    CONSTRAINT Dependent_Staff_fk FOREIGN KEY (Staff_ID)
        REFERENCES Staff(Staff_ID)
);

INSERT INTO Dependent VALUES
(101, 1, 'Sara', 'Ali', 5, 6, 2000, 'F', 'Daughter', 'Full'),
(102, 2, 'Omar', 'Ali', 12, 7, 2002, 'M', 'Son', 'Partial'),
(103, 3, 'Mona', 'Hassan', 20, 3, 1999, 'F', 'Spouse', 'Full'),
(104, 4, 'Ahmed', 'Khaled', 15, 11, 2001, 'M', 'Son', 'Full'),
(105, 5, 'Laila', 'Tarek', 30, 9, 2005, 'F', 'Daughter', 'Partial');


CREATE TABLE Blood_Request (
    Request_ID INT NOT NULL,
    Date_day INT,
    Date_month INT,
    Date_year INT,
    Request_status VARCHAR(10) NOT NULL,
    Quantity INT NOT NULL,
    Request_type VARCHAR(20),
    Request_description VARCHAR(50),
    Blood_type_required VARCHAR(3) NOT NULL,
    Recipient_fk INT NOT NULL,

    CONSTRAINT Blood_Request_PK PRIMARY KEY (Request_ID),
    CONSTRAINT Request_Recipient_fk FOREIGN KEY (Recipient_fk)
        REFERENCES Recipient(Recipient_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Blood_Request 
VALUES
(101, 10, 12, 2025, 'Pending', 2, 'Emergency', 'Surgery', 'A+', 201),
(102, 11, 12, 2025, 'Approved', 1, 'Routine', 'Donation', 'B+', 202),
(103, 12, 12, 2025, 'Rejected', 3, 'Emergency', 'Accident', 'O-', 203),
(104, 13, 12, 2025, 'Pending', 2, 'Routine', 'Donation', 'AB-', 204), 
(105, 14, 12, 2025, 'Approved', 4, 'Emergency', 'Transfusion', 'A-', 205);




CREATE TABLE Event (
    Event_id INT NOT NULL,
    Event_name VARCHAR(20) NOT NULL,
    Event_location VARCHAR(20),
    Event_type VARCHAR(20),
    Expected_donors INT,
    Event_day INT,
    Event_month INT,
    Event_year INT,

    CONSTRAINT Event_PK PRIMARY KEY (Event_id)
);

INSERT INTO Event VALUES
(221, 'Blood Drive 1', 'Cairo', 'Donation', 50, 20, 12, 2025),
(222, 'Health Camp', 'Alexandria', 'Health', 30, 21, 12, 2025),
(223, 'Blood Awareness', 'Giza', 'Awareness', 40, 22, 12, 2025),
(224, 'Donation Camp', 'Cairo', 'Donation', 60, 23, 12, 2025),
(225, 'Medical Checkup', 'Sharm', 'Health', 25, 24, 12, 2025);

CREATE TABLE Event_contact (
    Event_contact VARCHAR(20) NOT NULL,
    Event_no INT NOT NULL,

    CONSTRAINT Event_contact_PK PRIMARY KEY (Event_contact),
    CONSTRAINT Event_contact_fk FOREIGN KEY (Event_no)
        REFERENCES Event(Event_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Event_contact VALUES
('0111111111', 221),
('0122222222', 222),
('0133333333', 223),
('0144444444', 223),
('0155555555', 225);


CREATE TABLE Organizes (
    Organizer_id INT NOT NULL,
    Event_id INT NOT NULL,
    Organizer_role VARCHAR(20),

    CONSTRAINT Organizes_PK PRIMARY KEY (Organizer_id, Event_id),
    CONSTRAINT Organizes_Staff_fk FOREIGN KEY (Organizer_id)
        REFERENCES Staff(Staff_ID),
    CONSTRAINT Organizes_Event_fk FOREIGN KEY (Event_id)
        REFERENCES Event(Event_id)
);

INSERT INTO Organizes VALUES
(106, 221, 'Coordinator'),
(106, 222, 'Volunteer'),
(106, 223, 'Manager'),
(106, 224, 'Assistant'),
(106, 225, 'Lead Organizer');


------FARAH EL SAYED-----

CREATE TABLE Storage (
    Storage_id INT NOT NULL,
    Current_units INT NOT NULL,
    Status VARCHAR(20),
    Shelf VARCHAR(20) NOT NULL,
    Room VARCHAR(20) NOT NULL,
    Building VARCHAR(20) NOT NULL,
    Blood_type_supported VARCHAR(20) NOT NULL,
    Manager_id INT,

    CONSTRAINT Storage_PK PRIMARY KEY (Storage_id),
    CONSTRAINT Storage_Manager_fk FOREIGN KEY (Manager_id)
        REFERENCES Staff(Staff_ID)
        ON DELETE SET NULL
);

 INSERT INTO Storage
  VALUES ( 1,50,'Available', 'S1','R1','B1', 'A+',101),

          ( 2,20,'Low', 'S2','R2','B2', 'O-',101),

          ( 3,30,'Full', 'S3','R3','B3', 'B+',101),

          ( 4,10,'Critical', 'S4','R4','B3', 'AB-',101),

          ( 5,40,'Available', 'S5','R5','B2', 'O+',101),

           ( 6,40,'Available', 'S5','R5','B2', 'O+',101);




CREATE TABLE Emergency_case (
    Emergency_id INT NOT NULL,
    Priority_level VARCHAR(20),
    Units_required INT NOT NULL,
    ERecipient_id INT NOT NULL,
    Case_description VARCHAR(30),
    Requested_at DATETIME,
    Hospital_Name VARCHAR(20) NOT NULL,
    Hospital_Location VARCHAR(30) NOT NULL,

    CONSTRAINT Emergency_case_PK PRIMARY KEY (Emergency_id),
    CONSTRAINT Emergency_Recipient_fk FOREIGN KEY (ERecipient_id)
        REFERENCES Recipient(Recipient_ID)
);

INSERT INTO Emergency_case VALUES
(1, 'High', 2, 201, 'Car accident', '2025-12-18 08:00', 'Al Salam Hospital', 'Cairo'),
(2, 'Medium', 1, 202, 'Surgery', '2025-12-18 09:30', 'El Nasr Hospital', 'Giza'),
(3, 'Critical', 3, 203, 'Severe trauma', '2025-12-18 10:15', 'Cairo Univ Hosp', 'Cairo'),
(4, 'Low', 1, 204, 'Routine transfusion', '2025-12-18 11:00', 'Kasr Al Ainy', 'Cairo'),
(5, 'High', 2, 205, 'Emergency surgery', '2025-12-18 12:00', 'Dar Al Fouad', 'Giza'),
(6, 'High', 2, 205, 'Emergency surgery', '2025-12-18 12:00', 'Dar Al Fouad', 'Giza');


-----DALIA MOHAMED-------

CREATE TABLE BloodBag (
    Bag_ID INT NOT NULL,
    Bag_Status VARCHAR(20) NOT NULL,
    Collection_Date DATETIME NOT NULL,
    Volume FLOAT CHECK (Volume BETWEEN 250 AND 500),
    Blood_Type VARCHAR(10) NOT NULL,
    Storage_num INT NOT NULL,
    Emergency_ID INT NOT NULL,
    Expiry_Date AS DATEADD(DAY, 30, Collection_Date),

    CONSTRAINT BloodBag_PK PRIMARY KEY (Bag_ID),
    CONSTRAINT BloodBag_Storage_fk FOREIGN KEY (Storage_num)
        REFERENCES Storage(Storage_id),
    CONSTRAINT BloodBag_Emergency_fk FOREIGN KEY (Emergency_ID)
        REFERENCES Emergency_case(Emergency_id)
);

INSERT INTO BloodBag(Bag_Status , Collection_Date , Bag_ID , Volume , Blood_Type , Storage_num , Emergency_ID )
VALUES
('Available' , '1/12/2025' , 1 , 450 ,'A+' , 1 , 5 ),
('USed' , '11/11/2025' , 2 , 500 ,'O-' , 2 , 5 ),
('Reserved' , '7/10/2025' , 3 , 350 ,'B-' , 3 , 2 ),
('Available' , '5/12/2025' , 4 , 400 ,'AB-' , 4 , 5 ),
('Reserved' , '8/9/2025' , 5 , 360.23 ,'B-' , 4 , 3 ),
('Available' , '10/12/2025' , 6 , 275.60 ,'O+' , 4 , 5 );


CREATE TABLE BloodBag_Component (
    Bag_id INT NOT NULL,
    Component VARCHAR(20) NOT NULL,

    CONSTRAINT BloodBag_Component_PK PRIMARY KEY (Bag_id, Component),
    CONSTRAINT BloodBag_Component_fk FOREIGN KEY (Bag_id)
        REFERENCES BloodBag(Bag_ID)
);

-------INSERT BLOOD BAG COMPONENT DATA---------
INSERT INTO BloodBag_Component(Bag_id , Component )
VALUES
(1 , 'Plasma' ),
(1 , 'Platelets' ),
(1 , 'Red Blood Cells' ),
(4 , 'Plasma' ),
(4 , 'Platelets' ),
(2 , 'Red Blood Cells' ),
(3 , 'Plasma' );

CREATE TABLE BloodTest (
    Test_ID INT NOT NULL,
    Test_Date DATETIME NOT NULL,
    Bag_num INT NOT NULL,
    Doctor_ID INT,

    CONSTRAINT BloodTest_PK PRIMARY KEY (Test_ID),
    CONSTRAINT BloodTest_Bag_fk FOREIGN KEY (Bag_num)
        REFERENCES BloodBag(Bag_ID),
    CONSTRAINT BloodTest_Staff_fk FOREIGN KEY (Doctor_ID)
        REFERENCES Staff(Staff_ID)
        ON UPDATE CASCADE
);

-----WHEN THE DOCTOR_ID IS DELETED THE VALUE FOR ALL THE BLOOD TEST RELATED TO HIM WILL BE NULL-----
--ALTER TABLE BloodTest 
--DROP CONSTRAINT BloodTest_Staff;


--ALTER TABLE BloodTest 
--ADD CONSTRAINT BloodTest_Staff
--FOREIGN KEY (Doctor_ID) REFERENCES Staff (Staff_ID)
--ON UPDATE CASCADE;

-------EDITE DATATYPE OF TEST_ID------
--ALTER TABLE BloodTest 
--ALTER COLUMN Test_Date DATETIME NOT NULL;
-------BLOOD TEST Values---------
INSERT INTO BloodTest(Test_Date , Bag_num , Test_ID , Doctor_ID )
VALUES
('2025-01-05 09:30' , 1 , 10 , 107 ),
('2025-01-06 10:00', 2 ,11 , 107 ),
('2025-01-07 11:15' , 3 , 12 , 104 ),
('2025-01-08 12:45' , 4 , 13 , 104 ),
('2025-01-09 14:00' , 5 , 14 , 107 ),
('2025-01-10 15:30', 6 , 25 , 104 );


CREATE TABLE BloodTest_Result (
    Test_num INT NOT NULL,
    Test_Name VARCHAR(20) NOT NULL,
    Result VARCHAR(20) NOT NULL,

    CONSTRAINT BloodTest_Result_PK PRIMARY KEY (Test_num, Test_Name),
    CONSTRAINT BloodTest_Result_fk FOREIGN KEY (Test_num)
        REFERENCES BloodTest(Test_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-------INSERT BLOOD TEST RESULT DATA---------
INSERT INTO BloodTest_Result(Test_num , Test_Name , Result )
VALUES
(10 , 'Hemoglobin' ,'Normal' ),
(10, 'WBC' , 'Normal' ),

(11 , 'Hemoglobin' , 'Normal' ),
(11 , 'WBC' , 'Abnormal' ),

(13 , 'HIV' , 'Negative' ),
(14 , 'Hepatitis B' , 'Negative' ); 

------DELETE ALL THE RESULTS RELATED TO THE TEST FK IF DELETED--------
--ALTER TABLE BloodTest_Result
--DROP CONSTRAINT BloodTest_Result_fk;

--ALTER TABLE BloodTest_Result
--ADD CONSTRAINT BloodTest_Result_fk
--FOREIGN KEY (Test_num) REFERENCES BloodTest (Test_ID)
--ON DELETE CASCADE
--ON UPDATE CASCADE;


CREATE TABLE Appointment (
    Appointment_ID INT NOT NULL,
    APT_Status VARCHAR(20) DEFAULT 'Pending',
    Purpose VARCHAR(20),
    Appointment_Time TIME NOT NULL,
    Appointment_Date DATE NOT NULL,
    Note VARCHAR(100),

    CONSTRAINT Appointment_PK PRIMARY KEY (Appointment_ID)
);
DROP TABLE Appointment;

CREATE TABLE Appoint (
    APT_Status            VARCHAR(20),
    Appointment_NO        INT           NOT NULL,
    Purpose               VARCHAR(20),
    Appointment_Time      TIME           NOT NULL,
    Appointment_Date      Date           NOT NULL,

CONSTRAINT Appoint_PK
PRIMARY KEY (Appointment_NO)
);

INSERT INTO Appoint(APT_Status , Appointment_NO , Purpose , Appointment_Time , Appointment_Date )
VALUES
('Completed' , 301 , 'Blood Donation' , '10:00' , '5/1/2025'  ),
('Completed' , 302 , 'Blood Donation' , '11:00' , '6/1/2025'  ),
('Cancelled' , 303 , 'Check Up' , '12:00' , '7/1/2025'  ), 
('Completed' , 304 , 'Blood Donation' , '9:30' , '8/1/2025'   ),
('Pending' , 305 , 'Consulation' , '13:45' , '9/1/2025' ),
('Completed' , 306 , 'Blood Donation' , '1400' , '10/1/2025'  );



CREATE TABLE Uses (
    Transaction_num INT NOT NULL,
    Bag_no INT NOT NULL,
    Quantity FLOAT NOT NULL,

    CONSTRAINT Uses_PK PRIMARY KEY (Transaction_num, Bag_no),
    CONSTRAINT Uses_Trans_fk FOREIGN KEY (Transaction_num)
        REFERENCES Trans(Trans_ID),
    CONSTRAINT Uses_Bag_fk FOREIGN KEY (Bag_no)
        REFERENCES BloodBag(Bag_ID)
);

INSERT INTO Uses(Transaction_num , Bag_no , Quantity )
VALUES
(301 , 5 , 200 ),
(301 , 3 , 150 ),
(304 , 4 , 500 ),
(303 , 4 , 250 ),
(305 , 1 , 300 ),
(306 , 3 , 237 );


CREATE TABLE Makes (
    Appointment_num INT NOT NULL,
    Donor_num INT NOT NULL,
    Donor_Status VARCHAR(20),

    CONSTRAINT Makes_PK PRIMARY KEY (Appointment_num, Donor_num),
    CONSTRAINT Makes_Appointment_fk FOREIGN KEY (Appointment_num)
        REFERENCES Appoint(Appointment_NO)
        ON DELETE CASCADE,
    CONSTRAINT Makes_Donor_fk FOREIGN KEY (Donor_num)
        REFERENCES Donor(Donor_ID)
);

-------MAKES Value---------
--INSERT INTO Makes(Appointment_num , Donor_num , Donor_Status )
--VALUES
--(301 , 101 , 'Attended' ),
--(301 , 102 , 'Attended' ),

--(301 , 103 , 'Absent' ),
--(302 , 104 , 'Attended' ),

--(303 , 104 , 'Pending' ),
--(304 , 105 , 'Attended' );



CREATE TABLE Works_in (
    Manager_num INT NOT NULL,
    Storage_num INT NOT NULL,
    Assigned_date DATE NOT NULL,

    CONSTRAINT Works_PK PRIMARY KEY (Manager_num, Storage_num),
    CONSTRAINT Works_Staff_fk FOREIGN KEY (Manager_num)
        REFERENCES Staff(Staff_ID)
        ON DELETE CASCADE,
    CONSTRAINT Works_Storage_fk FOREIGN KEY (Storage_num)
        REFERENCES Storage(Storage_id)
);

INSERT INTO Works_in
 VALUES(101, 1, '2023-01-15'),
       (106, 2, '2023-01-16'),
       (101, 3, '2023-01-16'),
       (106, 4, '2023-01-16'),
       (101, 5, '2023-01-16'),
       (106, 6, '2023-01-16');


------farah el sayed --------
CREATE TABLE Delivery (
    Delivery_id INT NOT NULL,
    Driver_id INT NOT NULL,
    Dispatched_time DATETIME,
    Arrival_time DATETIME,
    Dbag_id INT NOT NULL,

    CONSTRAINT Delivery_PK PRIMARY KEY (Delivery_id),
    CONSTRAINT Delivery_Bag_fk FOREIGN KEY (Dbag_id)
        REFERENCES BloodBag(Bag_ID)
);


INSERT INTO Delivery

VALUES(1, 105, '2025-12-18 07:30', '2025-12-18 08:00', 1),

(2, 105, '2025-12-18 08:45', '2025-12-18 09:15', 2),

(3, 105, '2025-12-18 09:00', '2025-12-18 09:40', 3),

(4, 105, '2025-12-18 10:30', '2025-12-18 11:00', 4),

(5, 105, '2025-12-18 11:15', '2025-12-18 11:45', 5),
(6, 105, '2025-12-18 12:15', '2025-12-18 12:45', 6);

----ALTERS
--------(HABIBA HASSAN 257334)--

----EDIT STAFF EMAIL DATA_TYPE--

--ALTER TABLE Staff
--ALTER COLUMN staff_email VARCHAR (100);

----ADD CONSTRAINT FOREIGN KEY IN TRANACTION--
--ALTER TABLE Trans 
--ADD CONSTRAINT Trans_fk
--FOREIGN KEY  (Staff_No) REFERENCES Staff (Staff_ID)
--ON UPDATE CASCADE;

----ADD UNIQUE CONSTRAINT FOR EMAIL--
--ALTER TABLE Staff
--ADD CONSTRAINT unique_emai
--UNIQUE (staff_email);


-----DALIA MOHAMED 250686----
-----ADD NOTE ATTRIBUTE AND SET A PENDING DEFAULT FOR APPOINTMENT STATUS-------
--ALTER TABLE Appointment
--ADD 
--Note VARCHAR(100),
--CONSTRAINT default_APT_Status 
--DEFAULT 'Pending' FOR APT_Status;

----DROP THE OLD FK THEN ADD A NEW FK TO DELETE THE RELATION BETWEEN THE TRANSACTION WHEN THE FK APPOINTMEWNT DELETED--------
--ALTER TABLE Makes
--DROP CONSTRAINT APT_Makes_fk;

--ALTER TABLE Makes
--ADD CONSTRAINT APT_Makes_fk
--FOREIGN KEY (Appointment_num) REFERENCES Appointment (Appointment_ID)
--ON DELETE CASCADE;

-------DELETE ALL THE RESULTS RELATED TO THE TEST FK IF DELETED--------
--ALTER TABLE BloodTest_Result
--DROP CONSTRAINT BloodTest_Result_fk;

--ALTER TABLE BloodTest_Result
--ADD CONSTRAINT BloodTest_Result_fk
--FOREIGN KEY (Test_num) REFERENCES BloodTest (Test_ID)
--ON DELETE CASCADE
--ON UPDATE CASCADE;

-----WHEN THE DOCTOR_ID IS DELETED THE VALUE FOR ALL THE BLOOD TEST RELATED TO HIM WILL BE NULL-----
--ALTER TABLE BloodTest 
--DROP CONSTRAINT BloodTest_Staff;

--ALTER TABLE BloodTest 
--ADD CONSTRAINT BloodTest_Staff
--FOREIGN KEY (Doctor_ID) REFERENCES Staff (Staff_ID)
--ON UPDATE CASCADE;

-------EDITE DATATYPE OF TEST_ID------
--ALTER TABLE BloodTest 
--ALTER COLUMN Test_Date DATETIME NOT NULL;

-------FARAH EL SAYED 257276-----
--ALTER TABLE Storage
--ADD CONSTRAINT Staff_storage_fk
--FOREIGN KEY(Manager_id)
--REFERENCES Staff(Staff_id)
--ON DELETE SET null;

--ALTER TABLE Works_in
--DROP CONSTRAINT Staff_works_fk

--ALTER TABLE Works_in
--ADD CONSTRAINT Staff_works_fk
--FOREIGN KEY(Manager_num)
--REFERENCES Staff(Staff_ID)
--ON DELETE  CASCADE;

---------LAMIS ESMAT 260087------
--ALTER TABLE Blood_Request
--DROP CONSTRAINT Request_Recipint_fk;
--ALTER TABLE Blood_Request
--ADD CONSTRAINT Request_Recipint_fk
--FOREIGN KEY (Recipient_fk)
--REFERENCES Recipient(Recipient_ID)
--ON DELETE CASCADE
--ON UPDATE CASCADE;

--ALTER TABLE Event_contact
--DROP CONSTRAINT Event_contact_fk;
--ALTER TABLE Event_contact
--ADD CONSTRAINT Event_contact_fk
--FOREIGN KEY (Event_no)
--REFERENCES Event(Event_id)
--ON DELETE CASCADE
--ON UPDATE CASCADE;

-----LAMIS MOHAMED 260087------
SELECT Request_ID
FROM Blood_Request
WHERE Quantity > (
    SELECT AVG(Quantity)
    FROM Blood_Request
);

SELECT Event_name
FROM Event
WHERE Event_year = (
    SELECT Event_year
    FROM Event
    WHERE Expected_donors = (
        SELECT MAX(Expected_donors)
        FROM Event
    )
);

SELECT Request_ID, Request_status, Quantity, Blood_type_required
FROM Blood_Request
WHERE Request_type = 'Emergency';

SELECT br.Request_type, MAX(br.Quantity) AS Max_Quantity
FROM Blood_Request br
GROUP BY br.Request_type;

SELECT e.Event_name, e.Event_day, e.Event_month, e.Event_year, 
       (SELECT COUNT(*) 
        FROM Blood_Request br 
        WHERE br.Date_day = e.Event_day 
          AND br.Date_month = e.Event_month 
          AND br.Date_year = e.Event_year) AS Requests_on_Event_Day
FROM Event e
WHERE e.Expected_donors = (SELECT MAX(Expected_donors) FROM Event);


SELECT AVG(Dependent_Count) AS Avg_Dependents
FROM (
    SELECT s.Staff_ID, COUNT(d.Dependent_ID) AS Dependent_Count
    FROM Staff s
    JOIN Dependent d ON s.Staff_ID = d.Staff_ID
    WHERE s.Staff_ID NOT IN (
        SELECT s.Staff_ID
        FROM Staff s
        JOIN Recipient r ON 1=1
        WHERE r.Recipient_ID IN (
            SELECT br.Recipient_fk
            FROM Blood_Request br
            WHERE br.Request_type = 'Emergency'
        )
    )
    GROUP BY s.Staff_ID
) AS SubQuery;


CREATE VIEW TotalRequestsPerEvent AS
SELECT 
    e.Event_location,
    br.Request_type,
    SUM(br.Quantity) AS Total_Requested_Units,
    COUNT(br.Request_ID) AS Number_of_Requests
FROM Event e
LEFT JOIN Blood_Request br
    ON br.Date_day = e.Event_day
    AND br.Date_month = e.Event_month
    AND br.Date_year = e.Event_year
LEFT JOIN Recipient r
    ON br.Recipient_fk = r.Recipient_ID
GROUP BY e.Event_location, br.Request_type;


----habiba hassan -------
SELECT s.staff_Name, t.Trans_Quantity
FROM Staff s
JOIN Trans t ON s.Staff_ID = t.Staff_No
WHERE t.Trans_Quantity >
(
    SELECT AVG(Trans_Quantity)
    FROM Trans
);

SELECT s.staff_Name, t.Trans_Quantity
FROM Staff s
JOIN Trans t ON s.Staff_ID = t.Staff_No
WHERE t.Trans_Quantity =
(
    SELECT MIN(Trans_Quantity)
    FROM Trans
);

SELECT s.staff_Name
FROM Staff s
WHERE s.Staff_ID IN
(
    SELECT t.Staff_No
    FROM Trans t
    GROUP BY t.Staff_No
    HAVING COUNT(t.Trans_ID) >
    (
        SELECT AVG(cnt)
        FROM (
            SELECT COUNT(Trans_ID) AS cnt
            FROM Trans
            GROUP BY Staff_No
        ) AS AvgTable
    )
);

CREATE VIEW V_Staff_Trans AS
SELECT 
    s.Staff_ID,
    s.staff_Name,
    t.Trans_ID,
    t.Trans_Quantity
FROM Staff s
JOIN Trans t ON s.Staff_ID = t.Staff_No;

SELECT staff_Name, Trans_Quantity
FROM V_Staff_Trans
WHERE Trans_Quantity >
(
    SELECT AVG(Trans_Quantity)
    FROM V_Staff_Trans
);

SELECT staff_Name,
       MIN(Trans_Quantity) AS Min_Quantity,
       MAX(Trans_Quantity) AS Max_Quantity
FROM V_Staff_Trans
GROUP BY staff_Name;

------dalia mohamed------
SELECT Blood_Type, COUNT(Bag_ID) AS Num_of_Bags, SUM(Volume) AS Total_Volume
FROM BloodBag
GROUP BY Blood_Type
HAVING COUNT(Bag_ID) > 1;


SELECT Trans_ID, Transaction_Date, SUM(Quantity) AS Total_Blood_Used
FROM Trans 
JOIN Uses 
ON Trans_ID = Transaction_num
GROUP BY Trans_ID, Transaction_Date
ORDER BY Total_Blood_Used DESC;




SELECT Bag_ID, Blood_Type, Volume
FROM BloodBag 
WHERE NOT EXISTS (
    SELECT *
    FROM Uses 
    WHERE Bag_no = Bag_ID
);



SELECT Bag_ID, Blood_Type, Volume
FROM BloodBag 
WHERE NOT EXISTS (
    SELECT *
    FROM BloodTest 
    WHERE Bag_num = Bag_ID
    AND EXISTS (
        SELECT *
        FROM BloodTest_Result 
        WHERE Test_num = Test_ID
        AND Result != 'Negative'
    )
);


SELECT DISTINCT Component
FROM BloodBag_Component bbc
WHERE Bag_id IN (
    SELECT Bag_no
    FROM Uses 
);

--CREATE VIEW Available_BloodBags AS
--SELECT Bag_ID, Blood_Type, Volume, Storage_num, Expiry_Date
--FROM BloodBag
--WHERE Bag_Status = 'Available';
--SELECT * FROM Available_BloodBags;

-----farah el sayed --------
SELECT Priority_level, COUNT(*) AS Cases_Count
FROM Emergency_case
GROUP BY Priority_level;

--SELECT Recipient_Name, Priority_level
--FROM Recipient
--WHERE Recipient_ID IN (
--    SELECT ERecipient_id
--    FROM Emergency_case
--    WHERE Priority_level = 'High'
--);

SELECT Delivery_id, Driver_id
FROM Delivery
WHERE Dbag_id IN (
    SELECT Emergency_id
    FROM Emergency_case
    WHERE Priority_level = 'Critical'
);

SELECT Storage_id, Current_units, Blood_type_supported
FROM Storage
WHERE Blood_type_supported IN (
    SELECT Blood_type_supported
    FROM Emergency_case
    WHERE Priority_level = 'High'
);



SELECT Storage_id, Current_units, Status
FROM Storage
WHERE Status = 'Available';

CREATE VIEW Emergency_Cases_Summary AS
SELECT 
    Emergency_id,
    Priority_level,
    Units_required,
    Hospital_Name,
    Hospital_Location
FROM Emergency_case;

SELECT 
    Priority_level,
    MIN(CAST(Units_required AS INT)) AS Min_Units_Required
FROM Emergency_case
GROUP BY Priority_level;

-------omar--------
CREATE VIEW Donation_info
(Donation_Date, No_of_Donations, Total_Quantity)
AS
SELECT DonationDate, COUNT(*), SUM(Quantity)
FROM Donation
GROUP BY DonationDate;

SELECT 
Donation_Date AS 'Donation Date',
No_of_Donations AS 'Total Donations',
Total_Quantity AS 'Total Blood Quantity'
FROM Donation_info;

ALTER TABLE Donor
ADD Email VARCHAR(100);

ALTER TABLE Donor
ADD Address VARCHAR(255);

ALTER TABLE Donor
ADD DonorType VARCHAR(20);
