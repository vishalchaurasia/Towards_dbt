
      -- back compat for old kwarg name
  
  
        
            
            
            
            
        
    

    

    merge into "dbt_scd"."public"."dim_customers_type2" as DBT_INTERNAL_DEST
        using "dim_customers_type2__dbt_tmp155826857857" as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.customer_version_key = DBT_INTERNAL_DEST.customer_version_key))

    
    when matched then update set
        "customer_id" = DBT_INTERNAL_SOURCE."customer_id","customer_name" = DBT_INTERNAL_SOURCE."customer_name","city" = DBT_INTERNAL_SOURCE."city","email" = DBT_INTERNAL_SOURCE."email","updated_at" = DBT_INTERNAL_SOURCE."updated_at","valid_from" = DBT_INTERNAL_SOURCE."valid_from","valid_to" = DBT_INTERNAL_SOURCE."valid_to","is_current" = DBT_INTERNAL_SOURCE."is_current","customer_version_key" = DBT_INTERNAL_SOURCE."customer_version_key"
    

    when not matched then insert
        ("customer_id", "customer_name", "city", "email", "updated_at", "valid_from", "valid_to", "is_current", "customer_version_key")
    values
        ("customer_id", "customer_name", "city", "email", "updated_at", "valid_from", "valid_to", "is_current", "customer_version_key")


  