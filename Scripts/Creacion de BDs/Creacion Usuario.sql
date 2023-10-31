CREATE USER SARGUELLO FOR LOGIN SARGUELLO WITH PASSWORD = '4Dr14N$TecBD$';
EXEC sp_addrolemember 'db_datareader', 'SARGUELLO';
EXEC sp_addrolemember 'db_datawriter', 'SARGUELLO';
