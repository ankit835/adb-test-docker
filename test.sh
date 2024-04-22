echo "configuring databrick-cli authentication"

declare DATABRICKS_URL="https://westeurope.azuredatabricks.net"
declare DATABRICKS_ACCESS_TOKEN="authentication_token_generated_from_databricks_ux"

declare dbconfig=$(<~/.databrickscfg)
if [[ $dbconfig = *"host = "* && $dbconfig = *"token = "* ]]; then
  echo "file [~/.databrickscfg] is already configured"
else
  if [[ -z "$DATABRICKS_URL" || -z "$DATABRICKS_ACCESS_TOKEN" ]]; then
    echo "file [~/.databrickscfg] is not configured, but [DATABRICKS_URL],[DATABRICKS_ACCESS_TOKEN] env vars are not set"
  else
    echo "populating [~/.databrickscfg]"
    > ~/.databrickscfg
    echo "[DEFAULT]" >> ~/.databrickscfg
    echo "host = $DATABRICKS_URL" >> ~/.databrickscfg
    echo "token = $DATABRICKS_ACCESS_TOKEN" >> ~/.databrickscfg
    echo "" >> ~/.databrickscfg
  fi
fi
