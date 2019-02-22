CREATE DATABASE Causes
go

use Causes
go

CREATE TABLE TB_ROLES
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ROLE_NAME VARCHAR(20)
)
GO

INSERT INTO TB_ROLES(ROLE_NAME) 
VALUES
 ('User'),
 ('Admin')
 go

 CREATE TABLE TB_USERS
 (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	EMAIL VARCHAR(50) NOT NULL UNIQUE,
	PASSWORD_HASH VARCHAR(128) NOT NULL,
	PASSWORD_SALT VARCHAR(128) NOT NULL,
	CREATED_DATE DATETIME,
	LAST_LOGIN_DATE DATETIME,
	ROLE_ID INT FOREIGN KEY REFERENCES TB_ROLES(ID),
	FIRST_NAME VARCHAR(50),
	LAST_NAME VARCHAR(50)
 )
 go

CREATE TABLE TB_CAUSES
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TOPIC VARCHAR(100) NOT NULL,
	DESCRIPTION VARCHAR(MAX),
	IMG_URL VARCHAR(MAX),
	CREATED_BY INT FOREIGN KEY REFERENCES TB_USERS(ID) NOT NULL,
	CREATED_DATE DATETIME
)
go

CREATE TABLE TB_SIGNATURES
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CAUSE_ID INT FOREIGN KEY REFERENCES TB_CAUSES(ID) NOT NULL,
	USER_ID INT FOREIGN KEY REFERENCES TB_USERS(ID) NOT NULL,
	SIGNED_DATE DATETIME
)