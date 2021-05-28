#!/bin/bash

postgres_ver=("10-alpine" "10" "11-alpine" "11" "12-alpine" "12" "13-alpine" "13")
base_port=5432
test_query="select 'a' < 'A'"

for e in ${postgres_ver[@]}; do
    echo "Postgresql ver: ${e} result"
    PGPASSWORD=secret psql -U postgres -h 0.0.0.0 -p ${base_port} postgres -c "${test_query}"
    echo ""

    let base_port++
done
