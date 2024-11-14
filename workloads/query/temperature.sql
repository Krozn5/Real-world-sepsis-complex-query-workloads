

SELECT 
 hadm_id, 
 (
	CASE
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_1",
(
	CASE
			WHEN n2 IS NOT NULL THEN n2
			WHEN n1 IS NOT NULL THEN n1  
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_2",
(
	CASE
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_3",
(
	CASE 
			WHEN n4 IS NOT NULL THEN n4
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_4",
(
	CASE 
			WHEN n5 IS NOT NULL THEN n5
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_5",
(
	CASE 
			WHEN n6 IS NOT NULL THEN n6
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_6",
(
	CASE 
			WHEN n8 IS NOT NULL THEN n8
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_8",
(
	CASE 
			WHEN n10 IS NOT NULL THEN n10
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_10",
(
	CASE 
			WHEN n12 IS NOT NULL THEN n12
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_12",
(
	CASE 
			WHEN n14 IS NOT NULL THEN n14
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_14",
(
	CASE 
			WHEN n16 IS NOT NULL THEN n16
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_16",
(
	CASE 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_18",
(
	CASE
			WHEN n20 IS NOT NULL THEN n20
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n22 IS NOT NULL THEN n22 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_20",
(
	CASE 
			WHEN n22 IS NOT NULL THEN n22
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_22",
(
	CASE 
			WHEN n24 IS NOT NULL THEN n24
			WHEN n1 IS NOT NULL THEN n1 
			WHEN n2 IS NOT NULL THEN n2 
			WHEN n3 IS NOT NULL THEN n3 
			WHEN n4 IS NOT NULL THEN n4 
			WHEN n5 IS NOT NULL THEN n5 
			WHEN n6 IS NOT NULL THEN n6 
			WHEN n8 IS NOT NULL THEN n8 
			WHEN n10 IS NOT NULL THEN n10 
			WHEN n12 IS NOT NULL THEN n12 
			WHEN n14 IS NOT NULL THEN n14 
			WHEN n16 IS NOT NULL THEN n16 
			WHEN n18 IS NOT NULL THEN n18 
			WHEN n20 IS NOT NULL THEN n20 
			WHEN n22 IS NOT NULL THEN n22
			WHEN n1 IS NULL AND n2 IS NULL AND n3 IS NULL AND n4 IS NULL AND n5 IS NULL AND n6 IS NULL AND n8 IS NULL AND n10 IS NULL AND n12 IS NULL AND n14 IS NULL AND n16 IS NULL AND n18 IS NULL AND n20 IS NULL AND n22 IS NULL AND n24 IS NULL THEN nafter24first
	END 
) AS "temperature_24"
FROM (
 SELECT 
  A1.hadm_id,
  CASE WHEN l1 < 36 THEN l1 ELSE h1 END as n1,
  CASE WHEN l2 < 36 THEN l2 ELSE h2 END as n2,
  CASE WHEN l3 < 36 THEN l3 ELSE h3 END as n3,
  CASE WHEN l4 < 36 THEN l4 ELSE h4 END as n4,
  CASE WHEN l5 < 36 THEN l5 ELSE h5 END as n5,
  CASE WHEN l6 < 36 THEN l6 ELSE h6 END as n6,
  CASE WHEN l8 < 36 THEN l8 ELSE h8 END as n8,
  CASE WHEN l10 < 36 THEN l10 ELSE h10 END as n10,
  CASE WHEN l12 < 36 THEN l12 ELSE h12 END as n12,
  CASE WHEN l14 < 36 THEN l14 ELSE h14 END as n14,
  CASE WHEN l16 < 36 THEN l16 ELSE h16 END as n16,
  CASE WHEN l18 < 36 THEN l18 ELSE h18 END as n18,
  CASE WHEN l20 < 36 THEN l20 ELSE h20 END as n20,
  CASE WHEN l22 < 36 THEN l22 ELSE h22 END as n22,
  CASE WHEN l24 < 36 THEN l24 ELSE h24 END as n24,
	nafter24first
 FROM (
(SELECT hadm_id, max(temperature) as h1, min(temperature)as l1  from public.temperatureview WHERE charttime <= (onsettime +  INTERVAL '1' HOUR) AND charttime >=onsettime GROUP BY hadm_id
 )AS A1
FULL JOIN(
SELECT hadm_id,  max(temperature) as h2, min(temperature)as l2 from public.temperatureview where charttime <= (onsettime +  INTERVAL '2' HOUR) AND charttime >=(onsettime +  INTERVAL '1' HOUR) GROUP BY hadm_id
) AS A2
ON A1.hadm_id = A2.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h3, min(temperature)as l3 from public.temperatureview where charttime <= (onsettime +  INTERVAL '3' HOUR) AND charttime >=(onsettime +  INTERVAL '2' HOUR) GROUP BY hadm_id
) AS A3
ON A1.hadm_id = A3.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h4, min(temperature)as l4 from public.temperatureview where charttime <= (onsettime +  INTERVAL '4' HOUR) AND charttime >=(onsettime +  INTERVAL '3' HOUR) GROUP BY hadm_id
) AS A4
ON A1.hadm_id = A4.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h5, min(temperature)as l5 from public.temperatureview where charttime <= (onsettime +  INTERVAL '5' HOUR) AND charttime >=(onsettime +  INTERVAL '4' HOUR) GROUP BY hadm_id
) AS A5
ON A1.hadm_id = A5.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h6, min(temperature)as l6 from public.temperatureview where charttime <= (onsettime +  INTERVAL '6' HOUR) AND charttime >=(onsettime +  INTERVAL '5' HOUR) GROUP BY hadm_id
) AS A6
ON A1.hadm_id = A6.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h8, min(temperature)as l8 from public.temperatureview where charttime <= (onsettime +  INTERVAL '8' HOUR) AND charttime >=(onsettime +  INTERVAL '6' HOUR) GROUP BY hadm_id
) AS A8
ON A1.hadm_id = A8.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h10, min(temperature)as l10 from public.temperatureview where charttime <= (onsettime +  INTERVAL '10' HOUR) AND charttime >=(onsettime +  INTERVAL '8' HOUR) GROUP BY hadm_id
) AS A10
ON A1.hadm_id = A10.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h12, min(temperature)as l12 from public.temperatureview where charttime <= (onsettime +  INTERVAL '12' HOUR) AND charttime >=(onsettime +  INTERVAL '10' HOUR) GROUP BY hadm_id
) AS A12
ON A1.hadm_id = A12.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h14, min(temperature)as l14 from public.temperatureview where charttime <= (onsettime +  INTERVAL '14' HOUR) AND charttime >=(onsettime +  INTERVAL '12' HOUR) GROUP BY hadm_id
) AS A14
ON A1.hadm_id = A14.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h16, min(temperature)as l16 from public.temperatureview where charttime <= (onsettime +  INTERVAL '16' HOUR) AND charttime >=(onsettime +  INTERVAL '14' HOUR) GROUP BY hadm_id
) AS A16
ON A1.hadm_id = A16.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h18, min(temperature)as l18 from public.temperatureview where charttime <= (onsettime +  INTERVAL '18' HOUR) AND charttime >=(onsettime +  INTERVAL '16' HOUR) GROUP BY hadm_id
) AS A18
ON A1.hadm_id = A18.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h20, min(temperature)as l20 from public.temperatureview where charttime <= (onsettime +  INTERVAL '20' HOUR) AND charttime >=(onsettime +  INTERVAL '18' HOUR) GROUP BY hadm_id
) AS A20
ON A1.hadm_id = A20.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h22, min(temperature)as l22 from public.temperatureview where charttime <= (onsettime +  INTERVAL '22' HOUR) AND charttime >=(onsettime +  INTERVAL '20' HOUR) GROUP BY hadm_id
) AS A22
ON A1.hadm_id = A22.hadm_id
FULL JOIN(
SELECT hadm_id,  max(temperature) as h24, min(temperature)as l24 from public.temperatureview where charttime <= (onsettime +  INTERVAL '24' HOUR) AND charttime >=(onsettime +  INTERVAL '22' HOUR) GROUP BY hadm_id
) AS A24
ON A1.hadm_id = A24.hadm_id
FULL JOIN(
with erqi_vitalsign AS(
	SELECT 
	hadm_id,temperature,charttime 
	FROM
		public.temperatureview where charttime > (onsettime +  INTERVAL '24' HOUR)
),
temp_first AS 
(
	SELECT 
		*,
		ROW_NUMBER () OVER ( PARTITION BY "hadm_id" ORDER BY "charttime" ASC ) AS "rank" 
	FROM
		erqi_vitalsign
	WHERE temperature is not NULL
)
SELECT
	public.erqi_fanganyi.hadm_id,
	temp_first.temperature as nafter24first
	FROM
		public.erqi_fanganyi
	left JOIN
		temp_first
	ON public.erqi_fanganyi.hadm_id=temp_first.hadm_id AND "rank"=1

) AS A24after
ON A1.hadm_id = A24after.hadm_id
)
)t