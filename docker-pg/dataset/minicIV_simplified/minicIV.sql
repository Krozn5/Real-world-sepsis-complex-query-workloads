CREATE TABLE "mimic_icu"."chartevents" (
  "subject_id" int4 NOT NULL,
  "hadm_id" int4 NOT NULL,
  "stay_id" int4 NOT NULL,
  "charttime" timestamp(6) NOT NULL,
  "itemid" int4 NOT NULL,
  "value" varchar(200) COLLATE "pg_catalog"."default",
  "valuenum" float8
)
;

CREATE TABLE "mimic_icu"."inputevents" (
  "stay_id" int4,
  "itemid" int4 NOT NULL,
  "starttime" timestamp(6) NOT NULL,
  "endtime" timestamp(6) NOT NULL,
  "rate" float8,
  "amount" float8,
  "amountuom" varchar(20) COLLATE "pg_catalog"."default"
)
;



CREATE TABLE "mimic_hosp"."labevents" (
  "subject_id" int4 NOT NULL,
  "hadm_id" int4,
  "charttime" timestamp(0),
  "storetime" timestamp(0),
  "specimen_id" int4 NOT NULL,
  "itemid" int4 NOT NULL,
  "value" varchar(200) COLLATE "pg_catalog"."default",
  "valuenum" float8
)
;
