DROP TABLE DoneTask;
DROP TABLE Replacement;
DROP TABLE Record;
DROP TABLE Possession;
DROP TABLE Task;
DROP TABLE SparePart;
DROP TABLE Motorcycle;
DROP TABLE Customer;

CREATE TABLE Customer (
    ID NUMBER ,
    CustomerName VARCHAR(250),
    PRIMARY KEY (ID)
);

CREATE TABLE Motorcycle (
    VIN VARCHAR(100),
    Make VARCHAR(100) ,
    Model VARCHAR(100) ,
    Year NUMBER(4) ,
    Capacity NUMBER,
    PRIMARY KEY (VIN)
);

CREATE TABLE SparePart (
    PartName VARCHAR(100),
    Price NUMBER(10, 2),
    PRIMARY KEY (PartName, Price)
);

CREATE TABLE Task (
    Task VARCHAR(100) ,
    HourlyRate NUMBER(10, 2) ,
    PRIMARY KEY (Task)
);

CREATE TABLE Possession (
    ID NUMBER,
    VIN VARCHAR(100),
    PRIMARY KEY (ID, VIN),
    FOREIGN KEY (ID) REFERENCES Customer(ID),
    FOREIGN KEY (VIN) REFERENCES Motorcycle(VIN)
);

CREATE TABLE Record (
    ID NUMBER,
    VIN VARCHAR(100),
    RDate DATE,
    Location VARCHAR(100) ,
    TotalCost NUMBER(10, 2) ,
    PRIMARY KEY (ID, VIN, RDate),
    FOREIGN KEY (ID, VIN) REFERENCES Possession(ID, VIN)
);

CREATE TABLE Replacement (
    ID NUMBER,
    VIN VARCHAR(100),
    RDate DATE,
    PartName VARCHAR(100),
    Price NUMBER(10, 2),
    Quantity NUMBER ,
    ReplaceCost NUMBER(10, 2) ,
    PRIMARY KEY (ID, VIN, RDate, PartName, Price),
    FOREIGN KEY (ID, VIN, RDate) REFERENCES Record(ID, VIN, RDate),
    FOREIGN KEY (PartName, Price) REFERENCES SparePart(PartName, Price)
);

CREATE TABLE DoneTask (
    ID NUMBER,
    VIN VARCHAR(100),
    RDate DATE,
    Task VARCHAR(100),
    Time_Taken NUMBER ,
    Task_Cost NUMBER(10, 2) ,
    PRIMARY KEY (ID, VIN, RDate, Task),
    FOREIGN KEY (ID, VIN, RDate) REFERENCES Record(ID, VIN, RDate),
    FOREIGN KEY (Task) REFERENCES Task(Task)
);