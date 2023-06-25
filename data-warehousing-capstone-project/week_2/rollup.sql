SELECT
	dd.year,
	dc.country,
	SUM(fs.amount) totalsales
FROM FACTSALES fs
JOIN DIMCOUNTRY dc ON dc.COUNTRYID = fs.COUNTRYID
JOIN DIMDATE dd ON dd.dateid = fs.dateid
GROUP BY ROLLUP (dd.year, dc.country)