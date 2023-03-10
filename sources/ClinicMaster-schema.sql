USE CLINICMASTER	

-----------------------CREATE-----------------------
	
CREATE TABLE LEKARZ(
    ID_LEKARZA INT IDENTITY(1,1) PRIMARY KEY,
	IMIE VARCHAR(20) NOT NULL,
    NAZWISKO VARCHAR(20) NOT NULL,
    PESEL CHAR(11) CHECK(PESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
    SPECJALIZACJA VARCHAR(50) NOT NULL,
	ID_PRZYCHODNI INT NOT NULL,
	UNIQUE(PESEL) 
    );

CREATE TABLE PACJENT(
    ID_PACJENTA INT IDENTITY(1,1) PRIMARY KEY,
	IMIE VARCHAR(20) NOT NULL,
    NAZWISKO VARCHAR(20) NOT NULL,
    PESEL CHAR(11) CHECK(PESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
    LEKARZ_RODZINNY INT REFERENCES LEKARZ(ID_LEKARZA) NOT NULL,
	UNIQUE(PESEL)
    );

CREATE TABLE REJESTRATOR_MEDYCZNY(
    ID_REJESTRATORA INT IDENTITY(1,1) PRIMARY KEY,
	IMIE VARCHAR(20) NOT NULL,
    NAZWISKO VARCHAR(20) NOT NULL,
    PESEL CHAR(11) CHECK(PESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
    STAZ INT CHECK (STAZ  >=0 AND STAZ  <=30) NOT NULL ,
	UNIQUE(PESEL)
    );
	
CREATE TABLE REJESTRACJA(
    ID_REJESTRACJI INT IDENTITY(1,1) PRIMARY KEY,
    DATA_REJESTRACJI DATETIME NOT NULL,
    ID_PACJENTA INT REFERENCES PACJENT(ID_PACJENTA) NOT NULL,
	ID_REJESTRATORA INT REFERENCES REJESTRATOR_MEDYCZNY(ID_REJESTRATORA) NOT NULL,
	CZAS_TRWANIA_REJESTRACJI INT CHECK (CZAS_TRWANIA_REJESTRACJI  >=3 AND CZAS_TRWANIA_REJESTRACJI  <=20) NOT NULL
    );
	
CREATE TABLE WIZYTA(
	ID_WIZYTY INT IDENTITY(1,1) PRIMARY KEY,
	ID_REJESTRACJI INT REFERENCES REJESTRACJA(ID_REJESTRACJI) NOT NULL,
	ID_LEKARZA INT REFERENCES LEKARZ(ID_LEKARZA) NOT NULL,
	RODZAJ_WIZYTY VARCHAR(11) CHECK ( RODZAJ_WIZYTY IN ('REMOTE','STATIONARY'))NOT NULL,
	DATA_WIZYTY DATETIME NOT NULL,
	CZAS_TRWANIA_WIZYTY INT CHECK (CZAS_TRWANIA_WIZYTY  >=1 AND CZAS_TRWANIA_WIZYTY  <=10) NOT NULL,
	CENA INT CHECK (CENA  >=50 AND CENA  <=500) NOT NULL,
	OPINIA VARCHAR(20) CHECK (OPINIA IN ('VERY SATISFIED','SATISFIED','NEUTRAL','DISSATISFIED','VERY DISSATISFIED')) NOT NULL
);

USE CLINICMASTER	
DROP TABLE WIZYTA
DROP TABLE REJESTRACJA
DROP TABLE REJESTRATOR_MEDYCZNY
DROP TABLE PACJENT
DROP TABLE LEKARZ