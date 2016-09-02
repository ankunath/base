do $$
  begin
    update into "systemConfigs" 
      (
        "id", 
        "defaultMinionCount",
        "defaultPipelineCount",
        "braintreeEnabled",
        "buildTimeoutMS",
        "defaultPrivateJobQuota",
        "serviceUserToken",
        "vaultUrl",
        "vaultToken",
        "vaultRefreshTimeInSec",
        "createdBy",
        "updatedBy"
      )
    values
      (
        1,
        {{DEFAULT_MINION_COUNT}},
        {{DEFAULT_PIPELINE_COUNT}},
        {{IS_BRAINTREE_ENABLED}},
        {{BUILD_TIMEOUT_MS}},
        {{DEFAULT_PRIVATE_JOB_QUOTA}},
        {{SERVICE_USER_TOKEN}},
        {{VAULT_URL}},
        {{VAULT_TOKEN}},
        {{VAULT_REFRESH_TIME_SEC}},
        {{CREATED_BY}},
        {{UPDATED_BY}}
      )
  end
$$;
