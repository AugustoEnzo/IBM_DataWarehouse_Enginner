SELECT
	dc.country,
	dcat.category,
	SUM(fs.amount) totalsales
FROM FACTSALES fs
JOIN DIMCOUNTRY dc ON dc.COUNTRYID = fs.COUNTRYID
JOIN DIMCATEGORY dcat ON dcat.CATEGORYID = fs.CATEGORYID
GROUP BY 
	GROUPING SETS (
	(dc.country,
	dcat.category),
	(dc.country),
	(dcat.category)
)