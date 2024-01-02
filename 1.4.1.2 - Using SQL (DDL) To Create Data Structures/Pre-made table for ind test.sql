CREATE TABLE Diploma
(
    Student_Id      INTEGER,
    Name_of_Subject VARCHAR(25) NOT NULL,
    Total_Hours     INTEGER CHECK (Total_Hours > 30),
    Grade           Integer CHECK (Grade IN (3, 4, 5)),
    Teacher_Name    VARCHAR(50),
    PRIMARY KEY (Student_Id, Name_of_Subject)
);