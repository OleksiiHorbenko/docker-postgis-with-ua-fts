FROM postgis/postgis:15-3.3
COPY fts/uk_ua.aff /usr/share/postgresql/15/tsearch_data/uk_ua.affix
COPY fts/uk_ua.dic /usr/share/postgresql/15/tsearch_data/uk_ua.dict
COPY fts/ukrainian.stop /usr/share/postgresql/15/tsearch_data/ukrainian.stop
COPY fts/init-fts-config.sh /docker-entrypoint-initdb.d/
