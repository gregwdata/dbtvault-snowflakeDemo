-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT rr."LINK_LINEITEM_ORDER_PK", rr."ORDER_PK", rr."LINEITEM_PK", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."LINK_LINEITEM_ORDER_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM "tpch_vault"."main"."v_stg_orders" AS rr
    WHERE rr."LINK_LINEITEM_ORDER_PK" IS NOT NULL
    AND rr."ORDER_PK" IS NOT NULL
    AND rr."LINEITEM_PK" IS NOT NULL
    QUALIFY row_number = 1
),

records_to_insert AS (
    SELECT a."LINK_LINEITEM_ORDER_PK", a."ORDER_PK", a."LINEITEM_PK", a."LOAD_DATE", a."RECORD_SOURCE"
    FROM row_rank_1 AS a
)

SELECT * FROM records_to_insert