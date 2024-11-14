



WITH resp_rate_temp AS(
	
SELECT 
 patientunitstayid, 
 n1 as resp_rate_1,
 CASE WHEN n2 is null THEN coalesce(n1) ELSE n2 END as resp_rate_2,
 CASE WHEN n3 is null THEN coalesce(n2,n1) ELSE n3 END as resp_rate_3,
 CASE WHEN n4 is null THEN coalesce(n3,n2,n1) ELSE n4 END as resp_rate_4,
 CASE WHEN n5 is null THEN coalesce(n4,n3,n2,n1) ELSE n5 END as resp_rate_5,
 CASE WHEN n6 is null THEN coalesce(n5,n4,n3,n2,n1) ELSE n6 END as resp_rate_6,
 CASE WHEN n8 is null THEN coalesce(n6,n5,n4,n3,n2,n1) ELSE n8 END as resp_rate_8,
 CASE WHEN n10 is null THEN coalesce(n8,n6,n5,n4,n3,n2,n1) ELSE n10 END as resp_rate_10,
 CASE WHEN n12 is null THEN coalesce(n10,n8,n6,n5,n4,n3,n2,n1) ELSE n12 END as resp_rate_12,
 CASE WHEN n14 is null THEN coalesce(n12,n10,n8,n6,n5,n4,n3,n2,n1) ELSE n14 END as resp_rate_14,
 CASE WHEN n16 is null THEN coalesce(n14,n12,n10,n8,n6,n5,n4,n3,n2,n1) ELSE n16 END as resp_rate_16,
 CASE WHEN n18 is null THEN coalesce(n16,n14,n12,n10,n8,n6,n5,n4,n3,n2,n1) ELSE n18 END as resp_rate_18,
 CASE WHEN n20 is null THEN coalesce(n18,n16,n14,n12,n10,n8,n6,n5,n4,n3,n2,n1) ELSE n20 END as resp_rate_20,
 CASE WHEN n22 is null THEN coalesce(n20,n18,n16,n14,n12,n10,n8,n6,n5,n4,n3,n2,n1) ELSE n22 END as resp_rate_22,
 CASE WHEN n24 is null THEN coalesce(n22,n20,n18,n16,n14,n12,n10,n8,n6,n5,n4,n3,n2,n1) ELSE n24 END as resp_rate_24
FROM (

 SELECT 
  A1.patientunitstayid,
  CASE WHEN l1 < 12 THEN l1 ELSE h1 END as n1,
  CASE WHEN l2 < 12 THEN l2 ELSE h2 END as n2,
  CASE WHEN l3 < 12 THEN l3 ELSE h3 END as n3,
  CASE WHEN l4 < 12 THEN l4 ELSE h4 END as n4,
  CASE WHEN l5 < 12 THEN l5 ELSE h5 END as n5,
  CASE WHEN l6 < 12 THEN l6 ELSE h6 END as n6,
  CASE WHEN l8 < 12 THEN l8 ELSE h8 END as n8,
  CASE WHEN l10 < 12 THEN l10 ELSE h10 END as n10,
  CASE WHEN l12 < 12 THEN l12 ELSE h12 END as n12,
  CASE WHEN l14 < 12 THEN l14 ELSE h14 END as n14,
  CASE WHEN l16 < 12 THEN l16 ELSE h16 END as n16,
  CASE WHEN l18 < 12 THEN l18 ELSE h18 END as n18,
  CASE WHEN l20 < 12 THEN l20 ELSE h20 END as n20,
  CASE WHEN l22 < 12 THEN l22 ELSE h22 END as n22,
  CASE WHEN l24 < 12 THEN l24 ELSE h24 END as n24
 FROM (
(
SELECT patientunitstayid, max(respchartvalue) as h1, min(respchartvalue)as l1  from  eicu_core.respiratorycharting_temp_view
	where respchartoffset <= onsettime+60 AND respchartoffset >=onsettime GROUP BY patientunitstayid
 )AS A1
INNER JOIN(

SELECT patientunitstayid, max(respchartvalue) as h2, min(respchartvalue)as l2  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+60 AND respchartoffset < onsettime+120 GROUP BY patientunitstayid
) AS A2
ON A1.patientunitstayid = A2.patientunitstayid
INNER JOIN(

SELECT patientunitstayid, max(respchartvalue) as h3, min(respchartvalue)as l3  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+120 AND respchartoffset < onsettime+180 GROUP BY patientunitstayid
) AS A3
ON A2.patientunitstayid = A3.patientunitstayid
INNER JOIN(

SELECT patientunitstayid, max(respchartvalue) as h4, min(respchartvalue)as l4  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+180 AND respchartoffset < onsettime+240 GROUP BY patientunitstayid
) AS A4
ON A3.patientunitstayid = A4.patientunitstayid
INNER JOIN(

	SELECT patientunitstayid, max(respchartvalue) as h5, min(respchartvalue)as l5  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+240 AND respchartoffset < onsettime+300 GROUP BY patientunitstayid
) AS A5
ON A4.patientunitstayid = A5.patientunitstayid
INNER JOIN(

SELECT patientunitstayid, max(respchartvalue) as h6, min(respchartvalue)as l6  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+300 AND respchartoffset < onsettime+360 GROUP BY patientunitstayid
) AS A6
ON A5.patientunitstayid = A6.patientunitstayid
INNER JOIN(
SELECT patientunitstayid, max(respchartvalue) as h8, min(respchartvalue)as l8  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+360 AND respchartoffset < onsettime+480 GROUP BY patientunitstayid
) AS A8
ON A6.patientunitstayid = A8.patientunitstayid
INNER JOIN(

SELECT patientunitstayid, max(respchartvalue) as h10, min(respchartvalue)as l10 from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+480 AND respchartoffset < onsettime+600 GROUP BY patientunitstayid
) AS A10
ON A8.patientunitstayid = A10.patientunitstayid
INNER JOIN(

SELECT patientunitstayid, max(respchartvalue) as h12, min(respchartvalue)as l12  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+600 AND respchartoffset < onsettime+720 GROUP BY patientunitstayid
) AS A12
ON A10.patientunitstayid = A12.patientunitstayid
INNER JOIN(

SELECT patientunitstayid, max(respchartvalue) as h14, min(respchartvalue)as l14  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+720 AND respchartoffset < onsettime+840 GROUP BY patientunitstayid
) AS A14
ON A12.patientunitstayid = A14.patientunitstayid
INNER JOIN(

SELECT patientunitstayid, max(respchartvalue) as h16, min(respchartvalue)as l16  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+840 AND respchartoffset < onsettime+960 GROUP BY patientunitstayid
) AS A16
ON A14.patientunitstayid = A16.patientunitstayid
INNER JOIN(

SELECT patientunitstayid, max(respchartvalue) as h18, min(respchartvalue)as l18  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+960 AND respchartoffset < onsettime+1080 GROUP BY patientunitstayid
) AS A18
ON A16.patientunitstayid = A18.patientunitstayid
INNER JOIN(

SELECT patientunitstayid, max(respchartvalue) as h20, min(respchartvalue)as l20  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+1080 AND respchartoffset < onsettime+1200 GROUP BY patientunitstayid
) AS A20
ON A18.patientunitstayid = A20.patientunitstayid
INNER JOIN(
SELECT patientunitstayid, max(respchartvalue) as h22, min(respchartvalue)as l22  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+1200 AND respchartoffset < onsettime+1320 GROUP BY patientunitstayid
) AS A22
ON A20.patientunitstayid = A22.patientunitstayid
INNER JOIN(
SELECT patientunitstayid, max(respchartvalue) as h24, min(respchartvalue)as l24  from  eicu_core.respiratorycharting_temp_view where respchartoffset >= onsettime+1320 AND respchartoffset < onsettime+1440 GROUP BY patientunitstayid
) AS A24
ON A22.patientunitstayid = A24.patientunitstayid
)
)t
)

SELECT 
	resp_rate_temp.patientunitstayid, 
 (
	CASE
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_1",
(
	CASE
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1  
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_2",
(
	CASE
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_3",
(
	CASE 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_4",
(
	CASE 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_5",
(
	CASE 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_6",
(
	CASE 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_8",
(
	CASE 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_10",
(
	CASE 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_12",
(
	CASE 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_14",
(
	CASE 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_16",
(
	CASE 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_18",
(
	CASE
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_20",
(
	CASE 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_22",
(
	CASE 
			WHEN resp_rate_24 IS NOT NULL THEN resp_rate_24
			WHEN resp_rate_1 IS NOT NULL THEN resp_rate_1 
			WHEN resp_rate_2 IS NOT NULL THEN resp_rate_2 
			WHEN resp_rate_3 IS NOT NULL THEN resp_rate_3 
			WHEN resp_rate_4 IS NOT NULL THEN resp_rate_4 
			WHEN resp_rate_5 IS NOT NULL THEN resp_rate_5 
			WHEN resp_rate_6 IS NOT NULL THEN resp_rate_6 
			WHEN resp_rate_8 IS NOT NULL THEN resp_rate_8 
			WHEN resp_rate_10 IS NOT NULL THEN resp_rate_10 
			WHEN resp_rate_12 IS NOT NULL THEN resp_rate_12 
			WHEN resp_rate_14 IS NOT NULL THEN resp_rate_14 
			WHEN resp_rate_16 IS NOT NULL THEN resp_rate_16 
			WHEN resp_rate_18 IS NOT NULL THEN resp_rate_18 
			WHEN resp_rate_20 IS NOT NULL THEN resp_rate_20 
			WHEN resp_rate_22 IS NOT NULL THEN resp_rate_22
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL THEN nafter24first
			WHEN resp_rate_1 IS NULL AND resp_rate_2 IS NULL AND resp_rate_3 IS NULL AND resp_rate_4 IS NULL AND resp_rate_5 IS NULL AND resp_rate_6 IS NULL AND resp_rate_8 IS NULL AND resp_rate_10 IS NULL AND resp_rate_12 IS NULL AND resp_rate_14 IS NULL AND resp_rate_16 IS NULL AND resp_rate_18 IS NULL AND resp_rate_20 IS NULL AND resp_rate_22 IS NULL AND resp_rate_24 IS NULL AND nafter24first IS NULL THEN nagolast
	END 
) AS "resp_rate_24"
 FROM resp_rate_temp
 FULL	JOIN 
 (
 WITH 
	erqi_respiratorycharting_temp AS(
	SELECT 
	patientunitstayid,respchartvalue,respchartoffset 
	FROM
		eicu_core.respiratorycharting_temp_view
	 where respchartoffset > onsettime+1440
),
temp_first AS 
(
	SELECT 
		*,
		ROW_NUMBER () OVER ( PARTITION BY "patientunitstayid" ORDER BY "respchartoffset" ASC ) AS "rank" 
	FROM
		erqi_respiratorycharting_temp
	WHERE respchartvalue is not NULL
)
SELECT
	public.BASIC_PATIENT.patientunitstayid,
	temp_first.respchartvalue as nafter24first
	FROM
		public.BASIC_PATIENT
	left JOIN
		temp_first
	ON public.BASIC_PATIENT.patientunitstayid=temp_first.patientunitstayid AND "rank"=1
 )AS A24after
 ON resp_rate_temp.patientunitstayid=A24after.patientunitstayid
 FULL JOIN
 (
 WITH 
	erqi_respiratorycharting_temp AS(
	SELECT 
	patientunitstayid,respchartvalue,respchartoffset 
	FROM
		eicu_core.respiratorycharting_temp_view
	where respchartoffset < onsettime
),
temp_last AS 
(
	SELECT 
		*,
		ROW_NUMBER () OVER ( PARTITION BY "patientunitstayid" ORDER BY "respchartoffset" DESC ) AS "rank" 
	FROM
		erqi_respiratorycharting_temp
	WHERE respchartvalue is not NULL
)
SELECT
	public.BASIC_PATIENT.patientunitstayid,
	temp_last.respchartvalue as nagolast
	FROM
		public.BASIC_PATIENT
	left JOIN
		temp_last
	ON public.BASIC_PATIENT.patientunitstayid=temp_last.patientunitstayid AND "rank"=1
 )AS Aago
 ON resp_rate_temp.patientunitstayid=Aago.patientunitstayid;