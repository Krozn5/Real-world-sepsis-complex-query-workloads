

SELECT
    A2.hadm_id,
    A2.norepinephrine_2,
    A4.norepinephrine_4,
    A6.norepinephrine_6,
    A8.norepinephrine_8,
    A10.norepinephrine_10,
    A12.norepinephrine_12,
    A14.norepinephrine_14,
    A16.norepinephrine_16,
    A18.norepinephrine_18,
    A20.norepinephrine_20,
    A22.norepinephrine_22,
    A24.norepinephrine_24,
    A26.norepinephrine_26,
    A28.norepinephrine_28,
    A30.norepinephrine_30,
    A32.norepinephrine_32,
    A36.norepinephrine_36,
    A38.norepinephrine_38,
    A40.norepinephrine_40,
    A42.norepinephrine_42,
    A44.norepinephrine_44,
    A46.norepinephrine_46,
    A48.norepinephrine_48,
    A50.norepinephrine_50,
    A52.norepinephrine_52,
    A54.norepinephrine_54,
    A56.norepinephrine_56,
    A58.norepinephrine_58,
    A60.norepinephrine_60,
    A62.norepinephrine_62,
    A64.norepinephrine_64,
    A66.norepinephrine_66,
    A68.norepinephrine_68,
    A70.norepinephrine_70,
    A72.norepinephrine_72
FROM

    (SELECT
        hadm_id,
        MAX(rate) AS norepinephrine_2
    FROM
        public.Norepinephrine_view
    WHERE
				itemid = '221906'
      and  starttime <= (onsettime + INTERVAL '2' HOUR)
        AND starttime >= onsettime
        OR endtime <= (onsettime + INTERVAL '2' HOUR)
        AND endtime >= onsettime
    GROUP BY
        hadm_id) AS A2


  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_4
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '4' HOUR)
            AND starttime >= (onsettime + INTERVAL '2' HOUR)
            OR endtime <= (onsettime + INTERVAL '4' HOUR)
            AND endtime >= (onsettime + INTERVAL '2' HOUR)
        GROUP BY
            hadm_id
    ) AS A4 ON A2.hadm_id = A4.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_6
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '6' HOUR)
            AND starttime >= (onsettime + INTERVAL '4' HOUR)
            OR endtime <= (onsettime + INTERVAL '6' HOUR)
            AND endtime >= (onsettime + INTERVAL '4' HOUR)
        GROUP BY
            hadm_id
    ) AS A6 ON A4.hadm_id = A6.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_8
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '8' HOUR)
            AND starttime >= (onsettime + INTERVAL '6' HOUR)
            OR endtime <= (onsettime + INTERVAL '8' HOUR)
            AND endtime >= (onsettime + INTERVAL '6' HOUR)
        GROUP BY
            hadm_id
    ) AS A8 ON A6.hadm_id = A8.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_10
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '10' HOUR)
            AND starttime >= (onsettime + INTERVAL '8' HOUR)
            OR endtime <= (onsettime + INTERVAL '10' HOUR)
            AND endtime >= (onsettime + INTERVAL '8' HOUR)
        GROUP BY
            hadm_id
    ) AS A10 ON A8.hadm_id = A10.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_12
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '12' HOUR)
            AND starttime >= (onsettime + INTERVAL '10' HOUR)
            OR endtime <= (onsettime + INTERVAL '12' HOUR)
            AND endtime >= (onsettime + INTERVAL '10' HOUR)
        GROUP BY
            hadm_id
    ) AS A12 ON A10.hadm_id = A12.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_14
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '14' HOUR)
            AND starttime >= (onsettime + INTERVAL '12' HOUR)
            OR endtime <= (onsettime + INTERVAL '14' HOUR)
            AND endtime >= (onsettime + INTERVAL '12' HOUR)
        GROUP BY
            hadm_id
    ) AS A14 ON A12.hadm_id = A14.hadm_id
 
  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_16
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '16' HOUR)
            AND starttime >= (onsettime + INTERVAL '14' HOUR)
            OR endtime <= (onsettime + INTERVAL '16' HOUR)
            AND endtime >= (onsettime + INTERVAL '14' HOUR)
        GROUP BY
            hadm_id
    ) AS A16 ON A14.hadm_id = A16.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_18
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '18' HOUR)
            AND starttime >= (onsettime + INTERVAL '16' HOUR)
            OR endtime <= (onsettime + INTERVAL '18' HOUR)
            AND endtime >= (onsettime + INTERVAL '16' HOUR)
        GROUP BY
            hadm_id
    ) AS A18 ON A16.hadm_id = A18.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_20
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '20' HOUR)
            AND starttime >= (onsettime + INTERVAL '18' HOUR)
            OR endtime <= (onsettime + INTERVAL '20' HOUR)
            AND endtime >= (onsettime + INTERVAL '18' HOUR)
        GROUP BY
            hadm_id
    ) AS A20 ON A18.hadm_id = A20.hadm_id
 
  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_22
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '22' HOUR)
            AND starttime >= (onsettime + INTERVAL '20' HOUR)
            OR endtime <= (onsettime + INTERVAL '22' HOUR)
            AND endtime >= (onsettime + INTERVAL '20' HOUR)
        GROUP BY
            hadm_id
    ) AS A22 ON A20.hadm_id = A22.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_24
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '24' HOUR)
            AND starttime >= (onsettime + INTERVAL '22' HOUR)
            OR endtime <= (onsettime + INTERVAL '24' HOUR)
            AND endtime >= (onsettime + INTERVAL '22' HOUR)
        GROUP BY
            hadm_id
    ) AS A24 ON A22.hadm_id = A24.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_26
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '26' HOUR)
            AND starttime >= (onsettime + INTERVAL '24' HOUR)
            OR endtime <= (onsettime + INTERVAL '26' HOUR)
            AND endtime >= (onsettime + INTERVAL '24' HOUR)
        GROUP BY
            hadm_id
    ) AS A26 ON A24.hadm_id = A26.hadm_id
 
  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_28
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '28' HOUR)
            AND starttime >= (onsettime + INTERVAL '26' HOUR)
            OR endtime <= (onsettime + INTERVAL '28' HOUR)
            AND endtime >= (onsettime + INTERVAL '26' HOUR)
        GROUP BY
            hadm_id
    ) AS A28 ON A26.hadm_id = A28.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_30
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '30' HOUR)
            AND starttime >= (onsettime + INTERVAL '28' HOUR)
            OR endtime <= (onsettime + INTERVAL '30' HOUR)
            AND endtime >= (onsettime + INTERVAL '28' HOUR)
        GROUP BY
            hadm_id
    ) AS A30 ON A28.hadm_id = A30.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_32
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '32' HOUR)
            AND starttime >= (onsettime + INTERVAL '30' HOUR)
            OR endtime <= (onsettime + INTERVAL '32' HOUR)
            AND endtime >= (onsettime + INTERVAL '30' HOUR)
        GROUP BY
            hadm_id
    ) AS A32 ON A30.hadm_id = A32.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_34
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '34' HOUR)
            AND starttime >= (onsettime + INTERVAL '32' HOUR)
            OR endtime <= (onsettime + INTERVAL '34' HOUR)
            AND endtime >= (onsettime + INTERVAL '32' HOUR)
        GROUP BY
            hadm_id
    ) AS A34 ON A32.hadm_id = A34.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_36
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '36' HOUR)
            AND starttime >= (onsettime + INTERVAL '34' HOUR)
            OR endtime <= (onsettime + INTERVAL '36' HOUR)
            AND endtime >= (onsettime + INTERVAL '34' HOUR)
        GROUP BY
            hadm_id
    ) AS A36 ON A34.hadm_id = A36.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_38
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '38' HOUR)
            AND starttime >= (onsettime + INTERVAL '36' HOUR)
            OR endtime <= (onsettime + INTERVAL '38' HOUR)
            AND endtime >= (onsettime + INTERVAL '36' HOUR)
        GROUP BY
            hadm_id
    ) AS A38 ON A36.hadm_id = A38.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_40
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '40' HOUR)
            AND starttime >= (onsettime + INTERVAL '38' HOUR)
            OR endtime <= (onsettime + INTERVAL '40' HOUR)
            AND endtime >= (onsettime + INTERVAL '38' HOUR)
        GROUP BY
            hadm_id
    ) AS A40 ON A38.hadm_id = A40.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_42
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '42' HOUR)
            AND starttime >= (onsettime + INTERVAL '40' HOUR)
            OR endtime <= (onsettime + INTERVAL '42' HOUR)
            AND endtime >= (onsettime + INTERVAL '40' HOUR)
        GROUP BY
            hadm_id
    ) AS A42 ON A40.hadm_id = A42.hadm_id
 
  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_44
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '44' HOUR)
            AND starttime >= (onsettime + INTERVAL '42' HOUR)
            OR endtime <= (onsettime + INTERVAL '44' HOUR)
            AND endtime >= (onsettime + INTERVAL '42' HOUR)
        GROUP BY
            hadm_id
    ) AS A44 ON A42.hadm_id = A44.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_46
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '46' HOUR)
            AND starttime >= (onsettime + INTERVAL '44' HOUR)
            OR endtime <= (onsettime + INTERVAL '46' HOUR)
            AND endtime >= (onsettime + INTERVAL '44' HOUR)
        GROUP BY
            hadm_id
    ) AS A46 ON A44.hadm_id = A46.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_48
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '48' HOUR)
            AND starttime >= (onsettime + INTERVAL '46' HOUR)
            OR endtime <= (onsettime + INTERVAL '48' HOUR)
            AND endtime >= (onsettime + INTERVAL '46' HOUR)
        GROUP BY
            hadm_id
    ) AS A48 ON A46.hadm_id = A48.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_50
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '50' HOUR)
            AND starttime >= (onsettime + INTERVAL '48' HOUR)
            OR endtime <= (onsettime + INTERVAL '50' HOUR)
            AND endtime >= (onsettime + INTERVAL '48' HOUR)
        GROUP BY
            hadm_id
    ) AS A50 ON A48.hadm_id = A50.hadm_id
 
  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_52
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '52' HOUR)
            AND starttime >= (onsettime + INTERVAL '50' HOUR)
            OR endtime <= (onsettime + INTERVAL '52' HOUR)
            AND endtime >= (onsettime + INTERVAL '50' HOUR)
        GROUP BY
            hadm_id
    ) AS A52 ON A50.hadm_id = A52.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_54
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '54' HOUR)
            AND starttime >= (onsettime + INTERVAL '52' HOUR)
            OR endtime <= (onsettime + INTERVAL '54' HOUR)
            AND endtime >= (onsettime + INTERVAL '52' HOUR)
        GROUP BY
            hadm_id
    ) AS A54 ON A52.hadm_id = A54.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_56
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '56' HOUR)
            AND starttime >= (onsettime + INTERVAL '54' HOUR)
            OR endtime <= (onsettime + INTERVAL '56' HOUR)
            AND endtime >= (onsettime + INTERVAL '54' HOUR)
        GROUP BY
            hadm_id
    ) AS A56 ON A54.hadm_id = A56.hadm_id
 
  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_58
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '58' HOUR)
            AND starttime >= (onsettime + INTERVAL '56' HOUR)
            OR endtime <= (onsettime + INTERVAL '58' HOUR)
            AND endtime >= (onsettime + INTERVAL '56' HOUR)
        GROUP BY
            hadm_id
    ) AS A58 ON A56.hadm_id = A58.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_60
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '60' HOUR)
            AND starttime >= (onsettime + INTERVAL '58' HOUR)
            OR endtime <= (onsettime + INTERVAL '60' HOUR)
            AND endtime >= (onsettime + INTERVAL '58' HOUR)
        GROUP BY
            hadm_id
    ) AS A60 ON A58.hadm_id = A60.hadm_id
 
  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_62
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '62' HOUR)
            AND starttime >= (onsettime + INTERVAL '60' HOUR)
            OR endtime <= (onsettime + INTERVAL '62' HOUR)
            AND endtime >= (onsettime + INTERVAL '60' HOUR)
        GROUP BY
            hadm_id
    ) AS A62 ON A60.hadm_id = A62.hadm_id
 
  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_64
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '64' HOUR)
            AND starttime >= (onsettime + INTERVAL '62' HOUR)
            OR endtime <= (onsettime + INTERVAL '64' HOUR)
            AND endtime >= (onsettime + INTERVAL '62' HOUR)
        GROUP BY
            hadm_id
    ) AS A64 ON A62.hadm_id = A64.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_66
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '66' HOUR)
            AND starttime >= (onsettime + INTERVAL '64' HOUR)
            OR endtime <= (onsettime + INTERVAL '66' HOUR)
            AND endtime >= (onsettime + INTERVAL '64' HOUR)
        GROUP BY
            hadm_id
    ) AS A66 ON A64.hadm_id = A66.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_68
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '68' HOUR)
            AND starttime >= (onsettime + INTERVAL '66' HOUR)
            OR endtime <= (onsettime + INTERVAL '68' HOUR)
            AND endtime >= (onsettime + INTERVAL '66' HOUR)
        GROUP BY
            hadm_id
    ) AS A68 ON A66.hadm_id = A68.hadm_id
 
  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_70
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '70' HOUR)
            AND starttime >= (onsettime + INTERVAL '68' HOUR)
            OR endtime <= (onsettime + INTERVAL '70' HOUR)
            AND endtime >= (onsettime + INTERVAL '68' HOUR)
        GROUP BY
            hadm_id
    ) AS A70 ON A68.hadm_id = A70.hadm_id

  INNER JOIN (
        SELECT
            hadm_id,
            MAX(rate) AS norepinephrine_72
        FROM
            public.Norepinephrine_view
        WHERE
				  itemid = '221906'
          AND  starttime <= (onsettime + INTERVAL '72' HOUR)
            AND starttime >= (onsettime + INTERVAL '70' HOUR)
            OR endtime <= (onsettime + INTERVAL '72' HOUR)
            AND endtime >= (onsettime + INTERVAL '70' HOUR)
        GROUP BY
            hadm_id
    ) AS A72 ON A70.hadm_id = A72.hadm_id