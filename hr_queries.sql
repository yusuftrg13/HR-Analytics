--Use the Database
use HumanResources
GO

--Tabloyu s�rala
Select * From HR_capstone


--Belirli Alanlar� Al
SELECT Department, salary, satisfaction_level FROM HR_capstone;


--Total �al��an Say�s�n� Al
SELECT COUNT(*) AS Toplam_Calisan FROM HR_capstone;


--Departman Bazl� �al��an Say�s�n� Al
SELECT Department, COUNT(*) AS Calisan_Sayisi
FROM HR_capstone
GROUP BY Department;

--Tabloyu incele
sp_help HR_capstone;


--Memnuniyet Ortalamas�
SELECT AVG(CAST(satisfaction_level AS FLOAT)) AS Ortalama_Memnuniyet
FROM HR_capstone;

--Maa� Seviyesine G�re Memnuniyet
SELECT salary,AVG(CAST(satisfaction_level AS FLOAT)) AS Ortalama_Memnuniyet
FROM HR_capstone
GROUP BY salary;

--Departman Baz�nda Ortalama Memnuniyet ve Ayr�lma Oran�
SELECT 
    Department,
    AVG(CAST(satisfaction_level AS FLOAT)) AS Ortalama_Memnuniyet,
    AVG(CAST([left] AS FLOAT)) * 100 AS Ayrilma_Orani
FROM HR_capstone
GROUP BY Department
ORDER BY Ayrilma_Orani DESC;


--Maa� Seviyesine G�re Ayr�lma Oran� ve Ortalama �al��ma Saati
SELECT 
    salary,
    AVG(CAST([left] AS FLOAT)) * 100 AS Ayrilma_Orani,
    AVG(CAST(average_montly_hours AS FLOAT)) AS Ortalama_Calisma_Saati
FROM HR_capstone
GROUP BY salary
ORDER BY Ayrilma_Orani DESC;

--�al��anlar�n �irkette Ge�irdi�i Y�llar

SELECT 
    time_spend_company AS Yil,
    COUNT(*) AS Calisan_Sayisi,
    SUM(CAST([left] AS INT)) AS Ayrilan_Sayisi,
    AVG(CAST([left] AS FLOAT)) * 100 AS Ayrilma_Orani
FROM HR_capstone
GROUP BY time_spend_company
ORDER BY Yil;

--Terfi Alan ve Almayanlar�n Ayr�lma Oran�
SELECT 
    promotion_last_5years,
    COUNT(*) AS Calisan_Sayisi,
    SUM(CAST([left] AS INT)) AS Ayrilan_Sayisi,
    AVG(CAST([left] AS FLOAT)) * 100 AS Ayrilma_Orani
FROM HR_capstone
GROUP BY promotion_last_5years;

--En �ook Ayr�lan 5
SELECT TOP 5
    Department,
    SUM(CAST([left] AS INT)) AS Ayrilan_Sayisi
FROM HR_capstone
GROUP BY Department
ORDER BY Ayrilan_Sayisi DESC;

--Pivot Table:Departman ve Maa� Bazl� Ayr�lma
SELECT 
    Department,
    salary,
    AVG(CAST([left] AS FLOAT)) * 100 AS Ayrilma_Orani
FROM HR_capstone
GROUP BY Department, salary
ORDER BY Department, salary;

--�al��anlar�n Ortalama Performans De�erlendirmesi
SELECT 
    AVG(CAST(last_evaluation AS FLOAT)) AS Ortalama_Performans
FROM HR_capstone;