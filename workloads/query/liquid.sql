


SELECT X2.hadm_id,
			liquid_2,
			liquid_4,
			liquid_6,
			liquid_8,
			liquid_10,
			liquid_12,
			liquid_14,
			liquid_16,
			liquid_18,
			liquid_20,
			liquid_22,
			liquid_24,
			liquid_26,
			liquid_28,
			liquid_30,
			liquid_32,
			liquid_34,
			liquid_36,
			liquid_38,
			liquid_40,
			liquid_42,
			liquid_44,
			liquid_46,
			liquid_48,
			liquid_50,
			liquid_52,
			liquid_54,
			liquid_56,
			liquid_58,
			liquid_60,
			liquid_62,
			liquid_64,
			liquid_66,
			liquid_68,
			liquid_70,
			liquid_72
FROM (

         SELECT public.liquidview.hadm_id,
                SUM(
                        CASE
                            WHEN public.liquidview.starttime >= public.liquidview.onsettime
                                AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '2' HOUR) THEN
                                amount
                            WHEN public.liquidview.starttime >= public.liquidview.onsettime
                                AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '2' HOUR) THEN
                                        rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '2' HOUR) -
                                                                   public.liquidview.starttime)) / 3600
                            WHEN public.liquidview.starttime < public.liquidview.onsettime
                                AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '2' HOUR) THEN
                                        rate *
                                        EXTRACT(EPOCH FROM (public.liquidview.endtime - public.liquidview.onsettime)) /
                                        3600
                            ELSE rate * 2
                            END
                    ) AS liquid_2
         FROM public.liquidview
							
              WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '2' HOUR)
             AND public.liquidview.endtime > public.liquidview.onsettime
             AND public.liquidview.amountuom = 'ml'
         GROUP BY public.liquidview.hadm_id
     ) AS X2
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '2' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '4' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '2' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '4' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '4' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '2' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '4' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '2' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_4
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '4' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '2' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X4 ON X2.hadm_id = X4.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '4' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '6' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '4' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '6' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '6' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '4' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '6' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '4' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_6
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '6' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '4' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X6 ON X2.hadm_id = X6.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '6' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '8' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '6' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '8' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '8' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '6' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '8' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '6' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_8
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '8' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '6' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X8 ON X2.hadm_id = X8.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '8' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '10' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '8' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '10' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '10' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '8' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '10' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '8' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_10
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '10' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '8' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X10 ON X2.hadm_id = X10.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '10' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '12' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '10' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '12' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '12' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '10' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '12' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '10' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_12
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '12' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '10' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X12 ON X2.hadm_id = X12.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '12' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '14' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '12' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '14' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '14' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '12' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '14' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '12' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_14
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '14' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '12' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X14 ON X2.hadm_id = X14.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '14' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '16' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '14' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '16' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '16' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '14' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '16' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '14' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_16
 FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '16' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '14' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X16 ON X2.hadm_id = X16.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '16' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '18' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '16' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '18' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '18' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '16' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '18' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '16' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_18
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '18' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '16' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X18 ON X2.hadm_id = X18.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '18' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '20' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '18' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '20' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '20' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '18' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '20' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '18' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_20
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '20' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '18' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X20 ON X2.hadm_id = X20.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '20' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '22' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '20' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '22' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '22' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '20' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '22' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '20' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_22
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '22' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '20' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X22 ON X2.hadm_id = X22.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '22' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '24' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '22' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '24' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '24' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '22' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '24' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '22' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_24
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '24' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '22' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X24 ON X2.hadm_id = X24.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '24' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '26' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '24' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '26' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '26' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '24' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '26' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '24' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_26
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '26' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '24' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X26 ON X2.hadm_id = X26.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '26' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '28' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '26' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '28' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '28' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '26' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '28' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '26' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_28
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '28' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '26' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X28 ON X2.hadm_id = X28.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '28' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '30' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '28' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '30' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '30' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '28' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '30' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '28' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_30
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '30' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '28' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X30 ON X2.hadm_id = X30.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '30' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '32' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '30' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '32' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '32' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '30' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '32' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '30' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_32
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '32' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '30' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X32 ON X2.hadm_id = X32.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '32' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '34' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '32' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '34' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '34' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '32' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '34' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '32' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_34
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '34' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '32' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X34 ON X2.hadm_id = X34.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '34' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '36' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '34' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '36' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '36' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '34' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '36' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '34' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_36
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '36' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '34' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X36 ON X2.hadm_id = X36.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '36' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '38' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '36' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '38' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '38' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '36' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '38' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '36' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_38
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '38' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '36' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X38 ON X2.hadm_id = X38.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '38' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '40' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '38' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '40' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '40' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '38' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '40' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '38' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_40
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '40' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '38' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X40 ON X2.hadm_id = X40.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '40' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '42' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '40' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '42' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '42' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '40' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '42' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '40' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_42
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '42' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '40' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X42 ON X2.hadm_id = X42.hadm_id
   FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '42' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '44' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '42' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '44' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '44' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '42' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '44' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '42' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_44
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '44' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '42' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X44 ON X2.hadm_id = X44.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '44' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '46' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '44' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '46' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '46' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '44' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '46' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '44' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_46
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '46' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '44' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X46 ON X2.hadm_id = X46.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '46' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '48' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '46' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '48' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '48' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '46' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '48' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '46' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_48
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '48' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '46' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X48 ON X2.hadm_id = X48.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '48' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '50' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '48' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '50' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '50' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '48' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '50' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '48' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_50
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '50' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '48' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X50 ON X2.hadm_id = X50.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '50' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '52' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '50' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '52' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '52' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '50' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '52' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '50' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_52
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '52' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '50' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X52 ON X2.hadm_id = X52.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '52' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '54' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '52' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '54' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '54' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '52' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '54' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '52' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_54
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '54' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '52' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X54 ON X2.hadm_id = X54.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '54' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '56' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '54' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '56' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '56' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '54' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '56' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '54' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_56
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '56' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '54' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X56 ON X2.hadm_id = X56.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '56' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '58' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '56' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '58' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '58' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '56' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '58' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '56' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_58
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '58' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '56' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X58 ON X2.hadm_id = X58.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '58' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '60' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '58' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '60' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '60' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '58' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '60' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '58' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_60
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '60' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '58' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X60 ON X2.hadm_id = X60.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '60' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '62' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '60' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '62' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '62' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '60' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '62' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '60' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_62
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '62' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '60' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X62 ON X2.hadm_id = X62.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '62' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '64' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '62' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '64' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '64' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '62' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '64' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '62' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_64
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '64' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '62' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X64 ON X2.hadm_id = X64.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '64' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '66' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '64' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '66' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '66' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '64' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '66' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '64' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_66
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '66' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '64' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X66 ON X2.hadm_id = X66.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '66' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '68' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '66' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '68' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '68' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '66' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '68' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '66' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_68
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '68' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '66' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X68 ON X2.hadm_id = X68.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '68' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '70' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '68' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '70' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '70' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '68' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '70' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '68' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_70
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '70' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '68' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X70 ON X2.hadm_id = X70.hadm_id
         FULL JOIN (
    SELECT public.liquidview.hadm_id,
           SUM(
                   CASE

                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '70' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '72' HOUR) THEN
                           amount
                       WHEN public.liquidview.starttime >= (public.liquidview.onsettime + INTERVAL '70' HOUR)
                           AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '72' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM ((public.liquidview.onsettime + INTERVAL '72' HOUR) -
                                                              public.liquidview.starttime)) / 3600
                       WHEN public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '70' HOUR)
                           AND public.liquidview.endtime <= (public.liquidview.onsettime + INTERVAL '72' HOUR) THEN
                                   rate * EXTRACT(EPOCH FROM (public.liquidview.endtime -
                                                              (public.liquidview.onsettime + INTERVAL '70' HOUR))) / 3600
                       ELSE rate * 2
                       END
               ) AS liquid_72
    FROM public.liquidview
              
         WHERE public.liquidview.starttime < (public.liquidview.onsettime + INTERVAL '72' HOUR)
        AND public.liquidview.endtime > (public.liquidview.onsettime + INTERVAL '70' HOUR)
        AND public.liquidview.amountuom = 'ml'
        AND public.liquidview.amount >= 0
    GROUP BY public.liquidview.hadm_id
) AS X72 ON X2.hadm_id = X72.hadm_id
         FULL JOIN (
    WITH erqi_vitalsign AS (
        SELECT public.liquidview.hadm_id,
               rate,
               starttime,
               endtime
        FROM public.liquidview
            where starttime > (onsettime + INTERVAL '72' HOUR)
            AND endtime > (onsettime + INTERVAL '72' HOUR)
    ),
         temp_first AS 
             (SELECT *, ROW_NUMBER() OVER ( PARTITION BY hadm_id ORDER BY starttime ASC ) AS rank
              FROM erqi_vitalsign
              WHERE rate IS NOT NULL) 
    SELECT public.liquidview.hadm_id,
           temp_first.rate AS nafter72first
    FROM public.liquidview
             LEFT JOIN temp_first ON public.liquidview.hadm_id = temp_first.hadm_id
        AND rank = 1
) AS A72after ON X2.hadm_id = A72after.hadm_id
