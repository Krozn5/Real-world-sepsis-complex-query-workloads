# Real-world Sepsis Complex Query Workloads

Real sepsis query workloads are crucial for query optimization tasks. To achieve efficient query performance in real sepsis complex query scenarios, we collaborated with medical professionals from Peking University People's Hospital and Tsinghua Changgeng Hospital to obtain multiple sets of real sepsis complex query workloads. These workloads reflect the actual needs of clinicians for sepsis data. The project extracted five query examples from these workloads, each focusing on querying indicators such as norepinephrine levels, blood pH, body temperature, fluid intake, and respiratory rate. The datasets used for these queries are from the MIMIC-IV (https://physionet.org/content/mimic-iv/) and eICU (https://physionet.org/content/eicu-crd/) databases.



## DataSets & Workloads

We provide a simplified version of the mimicIV and eICU datasets, which removes attributes that are not relevant to the query workload. You can find the simplified mimicIV and eICU datasets in the "datas/" directory. The complete datasets are the mimic-iv(https://physionet.org/content/mimic-iv/) and eICU (https://physionet.org/content/eicu-crd/) datasets. We have also integrated a set of meaningful workloads for the mimicIV and eICU datasets based on real query requirements from Peking University People's Hospital and Tsinghua Changgeng Hospital. You can find them in the "workloads/" directory.

The dataset mainly consists of four large tables and several smaller tables. Since the large tables are more important for query optimization tasks, only the four large tables are listed in the paper. The tables **inputevents**, **labevents**, and **chartevents** come from the MIMIC-IV dataset. After simplification, the **inputevents** table contains 8 attributes, the **labevents** table contains 8 attributes, and the **chartevents** table contains 7 attributes, which are used for queries on norepinephrine levels, pH values, body temperature, and fluid intake. The **respiratorycharting** table comes from the eICU dataset, and after simplification, it contains 4 attributes, which are used for queries on respiratory rate. There are also several smaller tables, such as the **bg**, **vitalsign**, and **erqi_fanganyi** tables from the MIMIC-IV dataset, and the **basic_patient** table from the eICU dataset. The table creation statements and sample data can be found in the "workloads/" directory.

The "workload" folder includes the view creation statements and query execution statements, corresponding to queries on norepinephrine levels, pH values, body temperature, fluid intake, and respiratory rate. The commands for view creation and query execution will be provided below. The meaning of these five queries is as follows:

- **Norepinephrine:** The purpose of this query is to extract the usage rate of norepinephrine during a specific time interval. It can help medical researchers or clinicians analyze and understand the usage patterns of norepinephrine in ICU patients, especially within critical time windows. Through this analysis, the effectiveness of drug treatments can be assessed, patient condition changes can be monitored, and drug treatment plans can be optimized.

- **Liquid:** The purpose of this query is to analyze and summarize the amount of liquid administered to patients within a specific time interval. It can help medical professionals monitor and assess fluid management in ICU patients, particularly during critical time windows. Through this analysis, appropriate fluid therapy can be ensured, preventing and treating fluid overload or deficiency, thereby improving patient treatment outcomes and prognosis.

- **pH:** The purpose of this query is to track and summarize the changes in patients' blood pH levels over time. It can help medical professionals monitor and assess the acid-base balance of ICU patients, particularly during critical time windows. Through this analysis, potential acid-base imbalances can be detected and addressed promptly, improving patient treatment outcomes and prognosis.

- **Temperature:** The purpose of this query is to track and summarize the changes in patients' body temperature over time. It can help medical professionals monitor and assess temperature variations in ICU patients, particularly during critical time windows. Through this analysis, potential temperature abnormalities, such as fever or hypothermia, can be detected and managed promptly, improving patient treatment outcomes and prognosis.

- **Respiration:** The purpose of this query is to track and summarize the changes in patients' respiratory rate over time. It can help medical professionals monitor and assess the respiratory status of ICU patients, particularly during critical time windows. Through this analysis, potential respiratory issues, such as tachypnea or bradypnea, can be detected and addressed promptly, improving patient treatment outcomes and prognosis.



## How to Setup

### Install PostgreSQL Database in Docker

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



### Data Import

Example: Import eicu data into a PostgreSQL database in a Docker container

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





### Execute complex workloads

```sql
docker cp /path/to/your/sqlfile.sql <container_name_or_id>:/tmp/sqlfile.sql

psql -U <username> -d <database_name> -f /tmp/sqlfile.sql

```



## Paper Citation

If you find the code useful, please cite our paper:

```

```



## Contact

If you have \*ANY\* trouble to build this benchmark, please feel free to contact us. :)

- Kaijun Wen: **wenkaijun@henu.edu.cn**
- Kun Chao: **chaokun@henu.edu.cn**

