FROM python:3.10-slim-bullseye

RUN apt update
RUN apt-get install wget curl grep sed dpkg nano procps cron git -y

RUN pip install  \
  numpy \
  scipy \
  matplotlib  \
  pandas  \
  pandasql \
  scikit-learn \
  openpyxl \
  bokeh \
  pandas-gbq \
  seaborn

RUN pip install  \
  Jinja2 \
  python-dateutil \
  PyYAML \
  toml \
  packaging \
  six \
  tornado \
  gspread \
  oauth2client \
  PyOpenSSL \
  mysql-connector-python \
  pymysql \
  psycopg2-binary \
  flask \
  flask-cors 

RUN pip install \
  boto3 
RUN pip install  \
  pyarrow 
RUN pip install  \
  lxml \
  html5lib \
  jmespath 

RUN pip install  \
  beautifulsoup4 \ 
  newspaper3k \
  faker

# ------
RUN pip install rich paramiko # !! intéressant

#------------ jupyter (et node js du coup)
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - 
RUN apt-get install -y nodejs
RUN pip install jupyterlab jupyterlab-git toml

#------------- autres packages python
RUN pip install \
    pycountry \
    icecream \
    typeform \
    duckdb

#------------ dbt
#RUN pip install \
#  dbt-core \
#  dbt-postgres \
#  dbt-bigquery

#------------ postgres client
RUN apt install postgresql-client -y

#----------- streamlit + altair
RUN pip install streamlit altair feedzai-altair-theme

#----------- lux
RUN pip install lux-api
RUN jupyter nbextension install --py luxwidget
RUN jupyter nbextension enable --py luxwidget
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter labextension install luxwidget

#----------- jupyter neon theme
RUN jupyter labextension install @yeebc/jupyterlab_neon_theme

#---------- pysftp
RUN pip3 install pysftp

#------------ open ssh
# RUN apt install openssh-server -y --fix-missing
# authorize SSH connection with root account
# RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

#------------- dagsteri
RUN pip install dagster \
    dagster-graphql \
    dagit \
    dagster-postgres \
    dagster-mysql \
    dagster-github \
    dagster-gcp \
    dagster-slack \
    dagster-pandera \
    dagster-pandas \
    dagstermill


