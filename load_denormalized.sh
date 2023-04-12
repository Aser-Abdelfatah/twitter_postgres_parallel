#!/bin/sh

unzip -p "$1" | sed 's/\\u0000//g' | psql postgresql://postgres:pass@localhost:1959/ -c "COPY tweets_jsonb (data) FR    OM STDIN csv quote e'\x01' delimiter e'\x02';"
