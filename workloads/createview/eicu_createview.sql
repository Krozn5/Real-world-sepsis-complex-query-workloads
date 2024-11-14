CREATE MATERIALIZED VIEW "eicu_core"."respiratorycharting_temp"
AS
SELECT respiratorycharting.patientunitstayid,
    (respiratorycharting.respchartvalue)::numeric(10,2) AS respchartvalue,
    respiratorycharting.respchartoffset
   FROM eicu_core.respiratorycharting
  WHERE (((respiratorycharting.respchartvalue)::text ~ similar_to_escape('([1-9][0-9]*\\.[0-9]+|0\\.[0-9]+|[1-9][0-9]*|0)'::text)) AND ((respiratorycharting.respchartvaluelabel)::text ~~ '%RR%'::text));


CREATE MATERIALIZED VIEW "eicu_core"."respiratorycharting_temp_view"
AS
SELECT basic_patient.patientunitstayid,
    basic_patient.onsettime,
    respiratorycharting_temp.respchartvalue,
    respiratorycharting_temp.respchartoffset
   FROM (basic_patient
     LEFT JOIN eicu_core.respiratorycharting_temp ON ((respiratorycharting_temp.patientunitstayid = basic_patient.patientunitstayid)));
