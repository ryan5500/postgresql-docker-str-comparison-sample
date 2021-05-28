#!/bin/bash

postgres_ver=("10-alpine" "10" "11-alpine" "11" "12-alpine" "12" "13-alpine" "13")
test_queries=("select 'a' < 'A'" "select 'a' = 'A'" "select 'A' = 'A'")

for ((i = 0; i < ${#test_queries[@]}; i++)); do
    query="${test_queries[$i]}"
    echo "# test_query: ${query}"

    base_port=5432
    for ver in ${postgres_ver[@]}; do
        echo "Postgresql ver: ${ver} result"
        PGPASSWORD=secret psql -U postgres -h 0.0.0.0 -p ${base_port} postgres -c "${query}"
        echo ""

        let base_port++
    done
    echo ""
done
