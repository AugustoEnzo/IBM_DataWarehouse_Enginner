SELECT
	dd.year,
	ds.city,
	ds.stationid,
	AVG(ROUND(fact.wastecollected, 2)) AS average_waste_collected
FROM
	FACTTRIPS fact,
	DIMDATE dd,
	DIMSTATION ds
WHERE
	fact.dateid = dd.dateid
	AND fact.stationid = ds.stationid
GROUP BY CUBE(dd.year, ds.city, ds.stationid)