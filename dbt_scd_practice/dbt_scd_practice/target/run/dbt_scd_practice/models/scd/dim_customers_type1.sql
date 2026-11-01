
      -- back compat for old kwarg name
  
  
        
            
            
            
            
        
    

    

    merge into "dbt_scd"."public"."dim_customers_type1" as DBT_INTERNAL_DEST
        using "dim_customers_type1__dbt_tmp152402033962" as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.customer_id = DBT_INTERNAL_DEST.customer_id))

    
    when matched then update set
        "customer_id" = DBT_INTERNAL_SOURCE."customer_id","customer_name" = DBT_INTERNAL_SOURCE."customer_name","city" = DBT_INTERNAL_SOURCE."city","email" = DBT_INTERNAL_SOURCE."email","updated_at" = DBT_INTERNAL_SOURCE."updated_at"
    

    when not matched then insert
        ("customer_id", "customer_name", "city", "email", "updated_at")
    values
        ("customer_id", "customer_name", "city", "email", "updated_at")


  