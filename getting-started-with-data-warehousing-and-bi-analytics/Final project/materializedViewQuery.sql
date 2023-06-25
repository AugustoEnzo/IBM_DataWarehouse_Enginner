CREATE TABLE max_waste_stats AS (
	SELECT
		ds.city,
		ds.stationid,
		dt.trucktype,
		SUM(fact.wastecollected) AS waste_collected
	FROM
		FACTTRIPS fact,
		DIMTRUCK dt,
		DIMSTATION ds
	WHERE
		fact.stationid = ds.stationid
		AND fact.truckid = dt.truckid
) data initially deferred refresh immediate