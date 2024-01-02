DROP TABLE EXAM_RESULT;
DROP TABLE EXAM_SHEET;
DROP TABLE PHONE_LIST;
DROP TABLE STUDENTS;
DROP TABLE ST_GROUP;
DROP TABLE COURSE;
DROP TABLE TEACHER;

CREATE TABLE TEACHER
(
    TeacherId   integer     NOT NULL,
    TeacherName varchar(50) NOT NULL,
    "Position"  varchar(30) NOT NULL,
    CONSTRAINT teacher_pkey PRIMARY KEY (teacherid)
);
INSERT INTO TEACHER(TeacherId, TeacherName, "Position")
VALUES (1, 'Christopher Mills', 'Professor');
INSERT INTO TEACHER(TeacherId, TeacherName, "Position")
VALUES (2, 'Mary James', 'Assistant Professor');
INSERT INTO TEACHER(TeacherId, TeacherName, "Position")
VALUES (3, 'David Greenwood ', 'Assistant Professor');
INSERT INTO TEACHER(TeacherId, TeacherName, "Position")
VALUES (4, 'Paul Hill', 'Professor');
INSERT INTO TEACHER(TeacherId, TeacherName, "Position")
VALUES (5, 'Charles Spencer', 'Assistant Professor');


CREATE TABLE COURSE
(
    CourseId    integer     NOT NULL,
    CourseTitle varchar(50) NOT NULL,
    CONSTRAINT course_pkey PRIMARY KEY (courseid),
    CONSTRAINT course_coursetitle_key UNIQUE (coursetitle)
);

INSERT INTO COURSE(CourseId, CourseTitle)
VALUES (1, 'Data storage');
INSERT INTO COURSE(CourseId, CourseTitle)
VALUES (2, 'Machine Learning');
INSERT INTO COURSE(CourseId, CourseTitle)
VALUES (3, 'Data processing and analysis');
INSERT INTO COURSE(CourseId, CourseTitle)
VALUES (4, 'Artificial intelligence');
INSERT INTO COURSE(CourseId, CourseTitle)
VALUES (5, 'Image processing');
INSERT INTO COURSE(CourseId, CourseTitle)
VALUES (6, 'Text processing');
INSERT INTO COURSE(CourseId, CourseTitle)
VALUES (7, 'Information retrieval');

CREATE TABLE ST_GROUP
(
    GroupCode      varchar(32)  NOT NULL,
    Specialization varchar(100) NOT NULL,
    CONSTRAINT st_group_pkey PRIMARY KEY (groupcode)
);
INSERT INTO ST_GROUP(GroupCode, Specialization)
VALUES ('M2020_1', 'Nanotechnology');
INSERT INTO ST_GROUP(GroupCode, Specialization)
VALUES ('B2020_1', 'Health Research');
INSERT INTO ST_GROUP(GroupCode, Specialization)
VALUES ('B2020_2', 'Art&Science');

CREATE TABLE STUDENTS
(
    StudentId   integer      NOT NULL,
    StudentName varchar(100) NOT NULL,
    GroupCode   varchar(32),
    BirthDate   date,
    Address     varchar(100),
    CONSTRAINT students_pkey PRIMARY KEY (StudentId),
    CONSTRAINT group_st_fk FOREIGN KEY (GroupCode)
        REFERENCES st_group (GroupCode)
);


INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345567, 'John Smith', 'M2020_1', TO_DATE('1999-01-20', 'YYYY-MM-DD'), '711 Station Road, London N63 5SF');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345568, 'William Johnson', 'M2020_1', TO_DATE('1998-03-21', 'YYYY-MM-DD'), '47 Grove Road, London SW10 9KJ');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345569, 'Lily Brown', 'M2020_1', TO_DATE('1999-05-17', 'YYYY-MM-DD'), '23 York Road, London SW41 2KA');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345570, 'Dan Black', 'M2020_1', TO_DATE('1998-08-11', 'YYYY-MM-DD'), '701 Station Road, London N63 5SF');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345571, 'Matthew Wilson', 'M2020_1', TO_DATE('1999-07-12', 'YYYY-MM-DD'),
        '55 Springfield Road, London SE51 3ZU');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345572, 'Jack Lewis', 'M2020_1', TO_DATE('1999-11-24', 'YYYY-MM-DD'), '7 Albert Road, London E20 5DW');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345573, 'Cindy Clark', 'M2020_1', TO_DATE('1999-10-21', 'YYYY-MM-DD'), '63 Church Street, London W56 3JQ');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345574, 'Helen Larsson', 'B2020_1', TO_DATE('1999-03-15', 'YYYY-MM-DD'), '512 Station Road, London N63 5SF');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345575, 'Lucy Brooks', 'B2020_1', TO_DATE('1999-01-24', 'YYYY-MM-DD'), '55 Alexander Road, London EC78 5GI');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345576, 'Josie Reed', 'B2020_1', TO_DATE('1999-05-22', 'YYYY-MM-DD'), '47 Grange Road, London W07 1XW');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345577, 'Harry Morgan', 'B2020_1', TO_DATE('1999-09-03', 'YYYY-MM-DD'), '21 Springfield Road, London E42 9EO');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345578, 'Ethan Morris', 'B2020_1', TO_DATE('1998-02-06', 'YYYY-MM-DD'), '625 Queens Road, London N02 1QH');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345579, 'Michael Young', 'B2020_1', TO_DATE('1998-04-08', 'YYYY-MM-DD'), '29 The Crescent, London W20 9FK');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345580, 'Alexander Wright', 'B2020_1', TO_DATE('1998-03-29', 'YYYY-MM-DD'), '678 Queens Road, London N02 1QH');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345581, 'David Scott', 'B2020_2', TO_DATE('1998-11-21', 'YYYY-MM-DD'), '36 Chester Road, London E49 2QG');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345582, 'Charles Barnett', 'B2020_2', TO_DATE('1999-10-01', 'YYYY-MM-DD'), '31 North Road, London SW49 1ZF');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345583, 'Thomas Wood', 'B2020_2', TO_DATE('1999-09-12', 'YYYY-MM-DD'), '951 Highfield Road, London E16 2RI');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345584, 'George Jenkins', 'B2020_2', TO_DATE('1998-07-30', 'YYYY-MM-DD'), '7 Victoria Street, London SE83 7GD');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345585, 'Sara Murphy', 'B2020_2', TO_DATE('1998-06-12', 'YYYY-MM-DD'), '53 York Road, London SW41 2KA');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345586, 'Emily Perry', 'B2020_2', TO_DATE('1999-02-13', 'YYYY-MM-DD'), '19 George Street, London SE68 9ES');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345587, 'Megan Cooper', 'B2020_2', TO_DATE('1999-01-12', 'YYYY-MM-DD'), '843 Kings Road, London N87 2CL');
INSERT INTO STUDENTS(StudentId, StudentName, GroupCode, BirthDate, Address)
VALUES (345588, 'Barbara Nelson', 'B2020_2', NULL, '30 Mill Lane, London SE82 6KH');



CREATE TABLE PHONE_LIST
(
    StudentId integer       NOT NULL,
    PhoneType character(4),
    Phone     character(11) NOT NULL,
    CONSTRAINT st_ph_fk FOREIGN KEY (StudentId)
        REFERENCES STUDENTS (StudentId)
);

INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345567, 'cell', '07106667743');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345567, 'home', '02034657689');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345568, 'cell', '07107534674');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345571, 'cell', '07300678543');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345572, 'cell', '07305432543');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345573, 'cell', '07911123456');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345574, 'cell', '07921126756');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345575, 'cell', '07300563775');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345576, 'cell', '07301567487');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345577, 'cell', '07303567675');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345578, 'cell', '07304767687');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345579, 'cell', '07911365676');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345580, 'cell', '07921987989');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345581, 'cell', '07922657676');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345582, 'cell', '07926765656');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345583, 'cell', '07931676657');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345584, 'cell', '07922464664');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345585, 'cell', '07931657767');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345586, 'cell', '07931233444');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345587, 'cell', '07931676776');
INSERT INTO PHONE_LIST(StudentId, PhoneType, Phone)
VALUES (345588, 'cell', '07923756785');


CREATE TABLE EXAM_SHEET
(
    ExamSheetId integer     NOT NULL,
    GroupCode   varchar(32) NOT NULL,
    CourseId    integer     NOT NULL,
    TeacherId   integer,
    ClassRoom   integer,
    ExamDate    date,
    CONSTRAINT exam_sheet_pkey PRIMARY KEY (ExamSheetId),
    CONSTRAINT course_ex_sheet_fk FOREIGN KEY (CourseId)
        REFERENCES course (CourseId),
    CONSTRAINT group_ex_sheet_fk FOREIGN KEY (GroupCode)
        REFERENCES st_group (GroupCode),
    CONSTRAINT teacher_ex_sheet_fk FOREIGN KEY (TeacherId)
        REFERENCES teacher (TeacherId)
);

INSERT INTO EXAM_SHEET (ExamSheetId, GroupCode, CourseId, TeacherId, ClassRoom, ExamDate)
VALUES (1, 'M2020_1', 1, 1, 2408, TO_DATE('2020-01-25', 'YYYY-MM-DD'));
INSERT INTO EXAM_SHEET (ExamSheetId, GroupCode, CourseId, TeacherId, ClassRoom, ExamDate)
VALUES (2, 'M2020_1', 2, 2, 2408, TO_DATE('2020-01-27', 'YYYY-MM-DD'));
INSERT INTO EXAM_SHEET (ExamSheetId, GroupCode, CourseId, TeacherId, ClassRoom, ExamDate)
VALUES (3, 'M2020_1', 3, 3, 2410, TO_DATE('2020-01-28', 'YYYY-MM-DD'));
INSERT INTO EXAM_SHEET (ExamSheetId, GroupCode, CourseId, TeacherId, ClassRoom, ExamDate)
VALUES (4, 'B2020_1', 1, 4, 2411, TO_DATE('2020-01-26', 'YYYY-MM-DD'));
INSERT INTO EXAM_SHEET (ExamSheetId, GroupCode, CourseId, TeacherId, ClassRoom, ExamDate)
VALUES (5, 'B2020_1', 2, 5, 2412, TO_DATE('2020-01-24', 'YYYY-MM-DD'));
INSERT INTO EXAM_SHEET (ExamSheetId, GroupCode, CourseId, TeacherId, ClassRoom, ExamDate)
VALUES (6, 'B2020_1', 3, 1, 2410, TO_DATE('2020-01-25', 'YYYY-MM-DD'));
INSERT INTO EXAM_SHEET (ExamSheetId, GroupCode, CourseId, TeacherId, ClassRoom, ExamDate)
VALUES (7, 'B2020_1', 4, 2, 2410, TO_DATE('2020-01-27', 'YYYY-MM-DD'));
INSERT INTO EXAM_SHEET (ExamSheetId, GroupCode, CourseId, TeacherId, ClassRoom, ExamDate)
VALUES (8, 'B2020_2', 1, 3, 2410, TO_DATE('2020-01-27', 'YYYY-MM-DD'));
INSERT INTO EXAM_SHEET (ExamSheetId, GroupCode, CourseId, TeacherId, ClassRoom, ExamDate)
VALUES (9, 'B2020_2', 2, 3, 2411, TO_DATE('2020-01-28', 'YYYY-MM-DD'));
INSERT INTO EXAM_SHEET (ExamSheetId, GroupCode, CourseId, TeacherId, ClassRoom, ExamDate)
VALUES (10, 'B2020_2', 3, 4, NULL, TO_DATE('2020-01-28', 'YYYY-MM-DD'));

CREATE TABLE EXAM_RESULT
(
    StudentId   integer NOT NULL,
    ExamSheetId integer NOT NULL,
    Grade       integer,
    CONSTRAINT pk_exam_result PRIMARY KEY (StudentId, ExamSheetId),
    CONSTRAINT exr_ext_fk FOREIGN KEY (ExamSheetId)
        REFERENCES EXAM_SHEET (ExamSheetId),
    CONSTRAINT st_ex_fk FOREIGN KEY (StudentId)
        REFERENCES STUDENTS (StudentId),
    CONSTRAINT exam_result_grade_check CHECK (Grade > 0 AND Grade <= 5)
);

INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345567, 1, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345567, 3, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345568, 1, 3);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345568, 3, 4);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345569, 1, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345569, 3, 2);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345570, 2, 4);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345570, 3, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345571, 2, 3);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345571, 3, 2);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345572, 2, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345572, 1, 3);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345573, 1, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345573, 2, 4);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345574, 4, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345574, 5, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345575, 6, 3);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345575, 7, 4);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345576, 4, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345576, 5, 2);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345577, 6, 4);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345577, 7, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345578, 4, 3);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345578, 5, 2);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345579, 6, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345579, 7, 3);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345580, 4, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345580, 5, 4);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345581, 8, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345581, 9, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345582, 10, 3);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345582, 8, 4);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345583, 9, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345583, 10, 2);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345584, 8, 4);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345584, 9, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345585, 10, 3);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345585, 8, 2);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345586, 9, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345587, 10, 3);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345580, 8, 5);
INSERT INTO EXAM_RESULT(StudentId, ExamSheetId, Grade)
VALUES (345588, 9, 4);


