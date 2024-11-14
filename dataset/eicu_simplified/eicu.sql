CREATE TABLE "eicu_core"."respiratorycharting" (
  "patientunitstayid" int4,
  "respchartentryoffset" int4,
  "respchartvaluelabel" varchar(255) COLLATE "pg_catalog"."default",
  "respchartvalue" varchar(1000) COLLATE "pg_catalog"."default"
)
;