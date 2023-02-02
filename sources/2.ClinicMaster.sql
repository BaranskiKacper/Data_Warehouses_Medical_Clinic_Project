USE CLINICMASTER

UPDATE REJESTRATOR_MEDYCZNY
SET NAZWISKO = 'BARANSKI'
WHERE ID_REJESTRATORA IN ( SELECT MIN(ID_REJESTRATORA) AS ID FROM REJESTRATOR_MEDYCZNY)

UPDATE PACJENT
SET NAZWISKO = 'BARANSKI'
WHERE ID_PACJENTA IN ( SELECT MIN(ID_PACJENTA) AS ID FROM PACJENT)

BULK INSERT LEKARZ FROM 'D:\studia\V_sem\Hurtownie_Danych\laby\lab05\sources\doctors2.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT PACJENT FROM 'D:\studia\V_sem\Hurtownie_Danych\laby\lab05\sources\patients2.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT REJESTRATOR_MEDYCZNY FROM 'D:\studia\V_sem\Hurtownie_Danych\laby\lab05\sources\ward_clerks2.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT REJESTRACJA FROM 'D:\studia\V_sem\Hurtownie_Danych\laby\lab05\sources\regs2.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT WIZYTA FROM 'D:\studia\V_sem\Hurtownie_Danych\laby\lab05\sources\visits2.bulk' WITH (FIELDTERMINATOR='|')

SELECT * FROM LEKARZ 
SELECT * FROM PACJENT WHERE (LEKARZ_RODZINNY > 0 AND LEKARZ_RODZINNY <= 300)
SELECT * FROM REJESTRATOR_MEDYCZNY
SELECT * FROM REJESTRACJA
SELECT * FROM WIZYTA