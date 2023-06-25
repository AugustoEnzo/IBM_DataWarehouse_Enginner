SELECT
	dd.year,
	dc.country,
	AVG(fs.amount) averagesales
FROM FACTSALES fs
JOIN DIMCOUNTRY dc ON dc.COUNTRYID = fs.COUNTRYID
JOIN DIMDATE dd ON dd.dateid = fs.dateid
GROUP BY CUBE (dd.year, dc.country)