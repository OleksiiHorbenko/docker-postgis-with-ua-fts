# docker-postgis-with-ua-fts
Docker Compose definition of the PostgreSQL with Postgis Extension and UA dictionaries for FTS

## Run Locally
To run locally, you need docker to be installed on your machine. 
`docker-compose -f docker/postgis/postgresql.yml up -d`

## Postgres FTS Documentation
- [Postgres Full-Text Search (FTS) usage documentation](https://www.postgresql.org/docs/current/textsearch.html)
- [Postgres ts_vector and ts_query documentation](https://www.postgresql.org/docs/current/datatype-textsearch.html)

### Simple Verification
- Input SQL: `SELECT to_tsvector('ukrainian', 'Перевірка токенізації із відмінниками');`
- Expected Output: `'відмінник':4 'перевірка':1 'токенізація':2 'із':3`

## Tools Used
Please, take a look at
[brown-uk/dict_uk](https://github.com/brown-uk/dict_uk) GitHhub reposiroty for dictionaries re-calculation

