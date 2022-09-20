#!/bin/sh
export PYTHONPATH="$PYTHONPATH:/workspace/commons:/workspace"

jupyter lab --port=8888 --no-browser --ip=0.0.0.0 --allow-root &

# streamlit
streamlit run /workspace/streamlit_app.py --server.port 8083 --theme.base light &

# dagit
cd /opt/dagster/conf
dagster-daemon run &
dagit -h "0.0.0.0" -p "3000" -w "/opt/dagster/conf/workspace.yaml" 



