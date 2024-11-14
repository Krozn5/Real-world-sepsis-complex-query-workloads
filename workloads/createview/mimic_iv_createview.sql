
 CREATE MATERIALIZED VIEW public.Norepinephrine_view AS (
     SELECT
         f.hadm_id,
         i.rate,
         i.itemid,
         i.starttime,
         i.endtime,
         f.onsettime
     FROM
         mimic_icu.inputevents i
         RIGHT JOIN public.erqi_fanganyi f ON i.stay_id = f.stay_id
 )



CREATE MATERIALIZED VIEW liquidview AS (
    SELECT
        f.hadm_id,
        i.rate,
        i.itemid,
        i.starttime,
        i.endtime,
        f.onsettime,
        i.amount,
        i.amountuom 
    FROM
        public.erqi_fanganyi f
        LEFT JOIN mimic_icu.inputevents i ON f.stay_id = i.stay_id
);


CREATE MATERIALIZED VIEW "public"."phview"
AS
SELECT erqi_fanganyi.hadm_id,
    bg.ph,
    bg.charttime,
    erqi_fanganyi.onsettime
   FROM (erqi_fanganyi
     LEFT JOIN mimic_icu.bg ON ((erqi_fanganyi.hadm_id = bg.hadm_id)));


CREATE MATERIALIZED VIEW temperatureview AS
(
    SELECT 
        e.hadm_id, 
        v.temperature,
        v.charttime,
        e.onsettime
    FROM 
        mimic_icu.vitalsign v
    RIGHT JOIN 
        public.erqi_fanganyi e
    ON 
        v.stay_id = e.stay_id
)


