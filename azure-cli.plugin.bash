if which azctx &>/dev/null; then
    alias ax=azctx
fi
export ADAL_PYTHON_SSL_NO_VERIFY=1
# export AZURE_CLI_DISABLE_CONNECTION_VERIFICATION=1
export PYTHONWARNINGS=ignore
# /usr/local/Cellar/azure-cli/2.42.0/libexec/lib/python3.10/site-packages/urllib3/connectionpool.py:1013: InsecureRequestWarning: Unverified HTTPS request is being made to host 'graph.microsoft.com'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/1.26.x/advanced-usage.html#ssl-warnings
