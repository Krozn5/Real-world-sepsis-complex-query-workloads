

WITH ph_temp AS(
SELECT 
 A1.hadm_id, 
 n1 as ph_1,
 CASE WHEN n2 is null THEN coalesce(n1) ELSE n2 END as ph_2,
 CASE WHEN n3 is null THEN coalesce(n2,n1) ELSE n3 END as ph_3,
 CASE WHEN n4 is null THEN coalesce(n3,n2,n1) ELSE n4 END as ph_4,
 CASE WHEN n5 is null THEN coalesce(n4,n3,n2,n1) ELSE n5 END as ph_5,
 CASE WHEN n6 is null THEN coalesce(n5,n4,n3,n2,n1) ELSE n6 END as ph_6,
 CASE WHEN n8 is null THEN coalesce(n6,n5,n4,n3,n2,n1) ELSE n8 END as ph_8,
 CASE WHEN n10 is null THEN coalesce(n8,n6,n5,n4,n3,n2,n1) ELSE n10 END as ph_10,
 CASE WHEN n12 is null THEN coalesce(n10,n8,n6,n5,n4,n3,n2,n1) ELSE n12 END as ph_12,
 CASE WHEN n14 is null THEN coalesce(n12,n10,n8,n6,n5,n4,n3,n2,n1) ELSE n14 END as ph_14,
 CASE WHEN n16 is null THEN coalesce(n14,n12,n10,n8,n6,n5,n4,n3,n2,n1) ELSE n16 END as ph_16,
 CASE WHEN n18 is null THEN coalesce(n16,n14,n12,n10,n8,n6,n5,n4,n3,n2,n1) ELSE n18 END as ph_18,
 CASE WHEN n20 is null THEN coalesce(n18,n16,n14,n12,n10,n8,n6,n5,n4,n3,n2,n1) ELSE n20 END as ph_20,
 CASE WHEN n22 is null THEN coalesce(n20,n18,n16,n14,n12,n10,n8,n6,n5,n4,n3,n2,n1) ELSE n22 END as ph_22,
 CASE WHEN n24 is null THEN coalesce(n22,n20,n18,n16,n14,n12,n10,n8,n6,n5,n4,n3,n2,n1) ELSE n24 END as ph_24
FROM (
(SELECT hadm_id, ph as n1 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '1' HOUR) AND charttime >=onsettime 
) as x
where rn = 1
) AS A1 
INNER JOIN 
(SELECT hadm_id, ph as n2 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '2' HOUR) AND charttime >=(onsettime + INTERVAL '1' HOUR) 
) as x
where rn = 1
) AS A2
 ON A1.hadm_id = A2.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n3 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '3' HOUR) AND charttime >=(onsettime + INTERVAL '2' HOUR) 
) as x
where rn = 1
) AS A3
 ON A1.hadm_id = A3.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n4 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '4' HOUR) AND charttime >=(onsettime + INTERVAL '3' HOUR) 
) as x
where rn = 1
) AS A4
 ON A1.hadm_id = A4.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n5 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn from
public.phview
where  charttime <= (onsettime + INTERVAL '5' HOUR) AND charttime >=(onsettime + INTERVAL '4' HOUR) 
) as x
where rn = 1
) AS A5
 ON A1.hadm_id = A5.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n6 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '6' HOUR) AND charttime >=(onsettime + INTERVAL '5' HOUR) 
) as x
where rn = 1
) AS A6
 ON A1.hadm_id = A6.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n8 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '8' HOUR) AND charttime >=(onsettime + INTERVAL '6' HOUR) 
) as x
where rn = 1
) AS A8
 ON A1.hadm_id = A8.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n10 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '10' HOUR) AND charttime >=(onsettime + INTERVAL '8' HOUR) 
) as x
where rn = 1
) AS A10
 ON A1.hadm_id = A10.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n12 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '12' HOUR) AND charttime >=(onsettime + INTERVAL '10' HOUR) 
) as x
where rn = 1
) AS A12
 ON A1.hadm_id = A12.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n14 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '14' HOUR) AND charttime >=(onsettime + INTERVAL '12' HOUR) 
) as x
where rn = 1
) AS A14
 ON A1.hadm_id = A14.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n16 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '16' HOUR) AND charttime >=(onsettime + INTERVAL '14' HOUR) 
) as x
where rn = 1
) AS A16
 ON A1.hadm_id = A16.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n18 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where  charttime <= (onsettime + INTERVAL '18' HOUR) AND charttime >=(onsettime + INTERVAL '16' HOUR) 
) as x
where rn = 1
) AS A18
 ON A1.hadm_id = A18.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n20 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '20' HOUR) AND charttime >=(onsettime + INTERVAL '18' HOUR) 
) as x
where rn = 1
) AS A20
 ON A1.hadm_id = A20.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n22 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '22' HOUR) AND charttime >=(onsettime + INTERVAL '20' HOUR) 
) as x
where rn = 1
) AS A22
 ON A1.hadm_id = A22.hadm_id
 INNER JOIN 
(SELECT hadm_id, ph as n24 from 
(SELECT hadm_id, ph , ROW_NUMBER() over (partition by hadm_id order by charttime) rn
from
public.phview
where charttime <= (onsettime + INTERVAL '24' HOUR) AND charttime >=(onsettime + INTERVAL '22' HOUR) 
) as x
where rn = 1
) AS A24
 ON A1.hadm_id = A24.hadm_id
 )
 )
 
SELECT 
	ph_temp.hadm_id, 
 (
	CASE
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_1",
(
	CASE
			WHEN ph_2 IS NOT NULL THEN ph_2
			WHEN ph_1 IS NOT NULL THEN ph_1  
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_2",
(
	CASE
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_3",
(
	CASE 
			WHEN ph_4 IS NOT NULL THEN ph_4
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_4",
(
	CASE 
			WHEN ph_5 IS NOT NULL THEN ph_5
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_5",
(
	CASE 
			WHEN ph_6 IS NOT NULL THEN ph_6
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_6",
(
	CASE 
			WHEN ph_8 IS NOT NULL THEN ph_8
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_8",
(
	CASE 
			WHEN ph_10 IS NOT NULL THEN ph_10
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_10",
(
	CASE 
			WHEN ph_12 IS NOT NULL THEN ph_12
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_12",
(
	CASE 
			WHEN ph_14 IS NOT NULL THEN ph_14
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_14",
(
	CASE 
			WHEN ph_16 IS NOT NULL THEN ph_16
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_16",
(
	CASE 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_18",
(
	CASE
			WHEN ph_20 IS NOT NULL THEN ph_20
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_22 IS NOT NULL THEN ph_22 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_20",
(
	CASE 
			WHEN ph_22 IS NOT NULL THEN ph_22
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_22",
(
	CASE 
			WHEN ph_24 IS NOT NULL THEN ph_24
			WHEN ph_1 IS NOT NULL THEN ph_1 
			WHEN ph_2 IS NOT NULL THEN ph_2 
			WHEN ph_3 IS NOT NULL THEN ph_3 
			WHEN ph_4 IS NOT NULL THEN ph_4 
			WHEN ph_5 IS NOT NULL THEN ph_5 
			WHEN ph_6 IS NOT NULL THEN ph_6 
			WHEN ph_8 IS NOT NULL THEN ph_8 
			WHEN ph_10 IS NOT NULL THEN ph_10 
			WHEN ph_12 IS NOT NULL THEN ph_12 
			WHEN ph_14 IS NOT NULL THEN ph_14 
			WHEN ph_16 IS NOT NULL THEN ph_16 
			WHEN ph_18 IS NOT NULL THEN ph_18 
			WHEN ph_20 IS NOT NULL THEN ph_20 
			WHEN ph_22 IS NOT NULL THEN ph_22
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL THEN nafter24first
			WHEN ph_1 IS NULL AND ph_2 IS NULL AND ph_3 IS NULL AND ph_4 IS NULL AND ph_5 IS NULL AND ph_6 IS NULL AND ph_8 IS NULL AND ph_10 IS NULL AND ph_12 IS NULL AND ph_14 IS NULL AND ph_16 IS NULL AND ph_18 IS NULL AND ph_20 IS NULL AND ph_22 IS NULL AND ph_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "ph_24"
 FROM ph_temp
 FULL	JOIN 
 (
	with erqi_bg AS(
	SELECT 
	PUBLIC.ERQI_FANGANYI.hadm_id,ph,charttime 
	FROM
		mimic_icu.bg
	right join 
		PUBLIC.ERQI_FANGANYI
	ON mimic_icu.bg.hadm_id = PUBLIC.ERQI_FANGANYI.hadm_id AND charttime > (onsettime + INTERVAL '24' HOUR)
),
temp_first AS 
(
	SELECT 
		*,
		ROW_NUMBER () OVER ( PARTITION BY "hadm_id" ORDER BY "charttime" ASC ) AS "rank" 
	FROM
		erqi_bg
	WHERE ph is not NULL
)
SELECT
	PUBLIC.ERQI_FANGANYI.hadm_id,
	temp_first.ph as nafter24first
	FROM
		PUBLIC.ERQI_FANGANYI
	left JOIN
		temp_first
	ON PUBLIC.ERQI_FANGANYI.hadm_id=temp_first.hadm_id AND "rank"=1
 )AS A24after
 ON ph_temp.hadm_id=A24after.hadm_id
 FULL JOIN
 (
	
with erqi_bg AS(
	SELECT 
	PUBLIC.ERQI_FANGANYI.hadm_id,ph,charttime 
	FROM
			mimic_icu.bg
	right join 
		PUBLIC.ERQI_FANGANYI
	ON mimic_icu.bg.hadm_id = PUBLIC.ERQI_FANGANYI.hadm_id AND charttime < onsettime
),
temp_last AS
(
	SELECT 
		*,
		ROW_NUMBER () OVER ( PARTITION BY "hadm_id" ORDER BY "charttime" DESC ) AS "rank" 
	FROM
		erqi_bg
	WHERE ph is not NULL
)
SELECT
	PUBLIC.ERQI_FANGANYI.hadm_id,
	temp_last.ph as nagolast
	FROM
		PUBLIC.ERQI_FANGANYI
	left JOIN
		temp_last
	ON PUBLIC.ERQI_FANGANYI.hadm_id=temp_last.hadm_id AND "rank"=1
 )AS Aago
 ON ph_temp.hadm_id=Aago.hadm_id;

