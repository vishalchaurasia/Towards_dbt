

SELECT
    source.customer_id,
    source.customer_name,
    source.city,
    source.email,
    source.updated_at,

    CURRENT_TIMESTAMP AS valid_from,
    NULL::TIMESTAMP AS valid_to,
    TRUE AS is_current,

    MD5(
        source.customer_id::TEXT || '-' ||
        source.customer_name || '-' ||
        source.city || '-' ||
        source.email
    ) AS customer_version_key

FROM "dbt_scd"."raw"."customers" AS source



WHERE NOT EXISTS (
    SELECT 1
    FROM "dbt_scd"."public"."dim_customers_type2" AS target
    WHERE target.customer_version_key = MD5(
        source.customer_id::TEXT || '-' ||
        source.customer_name || '-' ||
        source.city || '-' ||
        source.email
    )
)

