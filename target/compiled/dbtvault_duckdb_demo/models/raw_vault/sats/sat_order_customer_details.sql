-- Generated by dbtvault.

WITH source_data AS (
    SELECT a."CUSTOMER_PK", a."CUSTOMER_HASHDIFF", a."CUSTOMER_NAME", a."CUSTOMER_ADDRESS", a."CUSTOMER_PHONE", a."CUSTOMER_ACCBAL", a."CUSTOMER_MKTSEGMENT", a."CUSTOMER_COMMENT", a.EFFECTIVE_FROM, a."LOAD_DATE", a."RECORD_SOURCE"
    FROM "tpch_vault"."main"."v_stg_orders" AS a
    WHERE a."CUSTOMER_PK" IS NOT NULL
),

records_to_insert AS (
    SELECT DISTINCT stage."CUSTOMER_PK", stage."CUSTOMER_HASHDIFF", stage."CUSTOMER_NAME", stage."CUSTOMER_ADDRESS", stage."CUSTOMER_PHONE", stage."CUSTOMER_ACCBAL", stage."CUSTOMER_MKTSEGMENT", stage."CUSTOMER_COMMENT", stage.EFFECTIVE_FROM, stage."LOAD_DATE", stage."RECORD_SOURCE"
    FROM source_data AS stage
)

SELECT * FROM records_to_insert