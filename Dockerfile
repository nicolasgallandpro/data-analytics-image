FROM python:3.11-slim-bullseye
RUN echo "force rebuild"
RUN apt update
RUN apt-get install wget curl grep sed dpkg nano procps cron git -y
#RUN apt install build-essential -y
RUN pip install --upgrade pip
RUN python3 -m pip install --upgrade setuptools

#------------ python dépendances de base
RUN pip install polars  \
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
  altair_saver \
  squarify \
  sparklines

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

#------------ dbt
#RUN pip install \
#  dbt-core \
#  dbt-postgres \
#  dbt-bigquery

#------------ postgres client
RUN apt install postgresql-client -y

#----------- altair
RUN pip install altair feedzai-altair-theme

#------- dépendances gestion de fichier (s3 et sftp)
RUN pip install pysftp
RUN pip install fsspec
RUN pip install s3fs 

#------------ open ssh
# RUN apt install openssh-server -y --fix-missing
# authorize SSH connection with root account
# RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

#------------- autres packages python
RUN pip install \
    pycountry \
    typeform \
    icecream \
    duckdb \
    duckdb-engine

#------------- dagster
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

