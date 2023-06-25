SELECT
	fact.stationid,
	dt.trucktype,
	SUM(fact.wastecollected) AS total_wast_collected
FROM
	FACTTRIPS fact,
	DIMTRUCK dt
WHERE
	fact.truckid = dt.truckid
GROUP BY
GROUPING SETS(fact.stationid,
				dt.trucktype)