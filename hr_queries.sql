--Use the Database
use HumanResources
GO

--Tabloyu sýrala
Select * From HR_capstone


--Belirli Alanlarý Al
SELECT Department, salary, satisfaction_level FROM HR_capstone;


--Total Çalýþan Sayýsýný Al
SELECT COUNT(*) AS Toplam_Calisan FROM HR_capstone;


--Departman Bazlý Çalýþan Sayýsýný Al
SELECT Department, COUNT(*) AS Calisan_Sayisi
FROM HR_capstone
GROUP BY Department;

--Tabloyu incele
sp_help HR_capstone;


--Memnuniyet Ortalamasý
SELECT AVG(CAST(satisfaction_level AS FLOAT)) AS Ortalama_Memnuniyet
FROM HR_capstone;

--Maaþ Seviyesine Göre Memnuniyet
SELECT salary,AVG(CAST(satisfaction_level AS FLOAT)) AS Ortalama_Memnuniyet
FROM HR_capstone
GROUP BY salary;

--Departman Bazýnda Ortalama Memnuniyet ve Ayrýlma Oraný
SELECT 
    Department,
    AVG(CAST(satisfaction_level AS FLOAT)) AS Ortalama_Memnuniyet,
    AVG(CAST([left] AS FLOAT)) * 100 AS Ayrilma_Orani
FROM HR_capstone
GROUP BY Department
ORDER BY Ayrilma_Orani DESC;


--Maaþ Seviyesine Göre Ayrýlma Oraný ve Ortalama Çalýþma Saati
SELECT 
    salary,
    AVG(CAST([left] AS FLOAT)) * 100 AS Ayrilma_Orani,
    AVG(CAST(average_montly_hours AS FLOAT)) AS Ortalama_Calisma_Saati
FROM HR_capstone
GROUP BY salary
ORDER BY Ayrilma_Orani DESC;

--Çalýþanlarýn Þirkette Geçirdiði Yýllar

SELECT 
    time_spend_company AS Yil,
    COUNT(*) AS Calisan_Sayisi,
    SUM(CAST([left] AS INT)) AS Ayrilan_Sayisi,
    AVG(CAST([left] AS FLOAT)) * 100 AS Ayrilma_Orani
FROM HR_capstone
GROUP BY time_spend_company
ORDER BY Yil;

--Terfi Alan ve Almayanlarýn Ayrýlma Oraný
SELECT 
    promotion_last_5years,
    COUNT(*) AS Calisan_Sayisi,
    SUM(CAST([left] AS INT)) AS Ayrilan_Sayisi,
    AVG(CAST([left] AS FLOAT)) * 100 AS Ayrilma_Orani
FROM HR_capstone
GROUP BY promotion_last_5years;

--En Çook Ayrýlan 5
SELECT TOP 5
    Department,
    SUM(CAST([left] AS INT)) AS Ayrilan_Sayisi
FROM HR_capstone
GROUP BY Department
ORDER BY Ayrilan_Sayisi DESC;

--Pivot Table:Departman ve Maaþ Bazlý Ayrýlma
SELECT 
    Department,
    salary,
    AVG(CAST([left] AS FLOAT)) * 100 AS Ayrilma_Orani
FROM HR_capstone
GROUP BY Department, salary
ORDER BY Department, salary;

--Çalýþanlarýn Ortalama Performans Deðerlendirmesi
SELECT 
    AVG(CAST(last_evaluation AS FLOAT)) AS Ortalama_Performans
FROM HR_capstone;