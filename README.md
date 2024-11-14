# Query
Install PostgreSQL under Docker and import data tables
## How to Install PostgreSQL Database in Docker



1.Create a folder locally containing Dockerfile, init_pgsql.sh and postgresql-13.1.tar.gz.

```makefile
C:\docker-project
├── Dockerfile
├── postgresql-13.1.tar.gz
└── init_pgsql.sh
```

2.Build the image: Execute the following command in the C:\docker-project directory:

```bash
docker build -t pg1 .
```

3.Run the container: Once the build is complete, start the container:

```bash
docker run -d -p 5432:5432 pg1
```

4.The password of the pg database user pg set by Dockerfile and init_pgsql.sh file is 123456.



## Import eicu data into the created Docker container for testing

1.Log in to PostgreSQL as the superuser (postgres):

```bash
psql -U postgres postgres
```

2.Create a database and connect::

```bash
CREATE DATABASE pg;
psql -U pg pg
```

3.Use the docker cp command to copy the files to the container:

```bash
docker cp C:\docker-project\respiratorycharting.csv <container_id>:/tmp/respiratorycharting.csv
```

4.Once connected to the PostgreSQL database, you can execute the following SQL statement to create the target table:

```sql
CREATE TABLE "eicu_core"."respiratorycharting" (
  "patientunitstayid" int4,
  "respchartentryoffset" int4,
  "respchartvaluelabel" varchar(255) COLLATE "pg_catalog"."default",
  "respchartvalue" varchar(1000) COLLATE "pg_catalog"."default"
);
```

5.Copy the file to /tmp/respiratorycharting.csvhou in the container and run the following SQL statement to import the CSV file into the respiratorycharting table:

```sql
COPY "eicu_core"."respiratorycharting" (
  "patientunitstayid", 
  "respchartentryoffset", 
  "respchartvaluelabel", 
  "respchartvalue"
)
FROM '/tmp/respiratorycharting.csv'
DELIMITER ',' CSV HEADER;
```

6.After successfully importing the data, you can run the following SQL query to check whether the data was imported successfully:

```sql
SELECT * FROM "eicu_core"."respiratorycharting" LIMIT 10;
```
