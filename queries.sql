--Question 1. What is count of records for the 2022 Green Taxi Data?
SELECT count(1) FROM `terraform-runner-413205.nyc_data.green_taxi_data_2022`;


--Question 3. How many records have a fare_amount of 0?
SELECT count(1) FROM `terraform-runner-413205.nyc_data.green_taxi_data_2022`
WHERE fare_amount=0;


--Question 4. What is the best strategy to make an optimized table in Big Query?

CREATE OR REPLACE TABLE `terraform-runner-413205.nyc_data.green_taxi_data_2022_partitioned_clustered`
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PUlocationID AS
SELECT * FROM `terraform-runner-413205.nyc_data.green_taxi_data_2022_materialized`;



--Question 5. Write a query to retrieve the distinct PULocationID between lpep_pickup_datetime 06/01/2022 and 06/30/2022 (inclusive)

SELECT DISTINCT(PULocationID) FROM `terraform-runner-413205.nyc_data.green_taxi_data_2022_partitioned_clustered`
WHERE DATE(lpep_pickup_datetime)>="2022-06-01" AND DATE(lpep_pickup_datetime)<="2022-06-30";


SELECT DISTINCT(PULocationID) FROM `terraform-runner-413205.nyc_data.green_taxi_data_2022_materialized`
WHERE DATE(lpep_pickup_datetime)>="2022-06-01" AND DATE(lpep_pickup_datetime)<="2022-06-30";





