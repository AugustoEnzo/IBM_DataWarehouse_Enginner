SELECT
	dd.year,
	ds.city,
	ds.stationid,
	SUM(fact.wastecollected) total_waste
FROM
	FACTTRIPS fact,
	DIMSTATION ds,
	DIMDATE dd
WHERE
	fact.dateid = dd.dateid
	AND fact.stationid = ds.stationid
GROUP BY ROLLUP (dd.year, ds.city, ds.stationid)