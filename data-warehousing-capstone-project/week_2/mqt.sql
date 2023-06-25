CREATE TABLE total_sales_per_country AS (
	SELECT
		dc.country,
		SUM(fs.amount) AS totalsales
	FROM
		FACTSALES fs,
		DIMCOUNTRY dc
	WHERE
		dc.COUNTRYID = fs.COUNTRYID
) data initially deferred refresh immediate;