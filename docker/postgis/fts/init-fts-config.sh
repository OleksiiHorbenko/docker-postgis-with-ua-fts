#!/bin/sh
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE TEXT SEARCH DICTIONARY ukrainian_huns (
      TEMPLATE = ispell,
      DictFile = uk_UA,
      AffFile = uk_UA,
      StopWords = ukrainian
  );

  CREATE TEXT SEARCH DICTIONARY ukrainian_stem (
      template = simple,
      stopwords = ukrainian
  );

  CREATE TEXT SEARCH CONFIGURATION ukrainian (PARSER=default);

  ALTER TEXT SEARCH CONFIGURATION ukrainian ALTER MAPPING FOR  hword, hword_part, word WITH ukrainian_huns, ukrainian_stem;
  ALTER TEXT SEARCH CONFIGURATION ukrainian ALTER MAPPING FOR  int, uint, numhword, numword, hword_numpart, email, float, file, url, url_path, version, host, sfloat WITH simple;
  ALTER TEXT SEARCH CONFIGURATION ukrainian ALTER MAPPING FOR asciihword, asciiword, hword_asciipart WITH english_stem;

EOSQL