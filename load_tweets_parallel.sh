#!/bin/sh

files=$(find data/*)

echo '================================================================================'
echo 'load pg_denormalized'
echo '================================================================================'
# FIXME: implement this


time echo "$files" | parallel sh load_denormalized.sh

echo '================================================================================'
echo 'load pg_normalized'
echo '================================================================================'
time echo "$files" | parallel python3 -u load_tweets.py --db=postgresql://postgres:pass@localhost:4588/ --inputs

echo '================================================================================'
echo 'load pg_normalized_batch'
echo '================================================================================'
time echo "$files" | parallel python3 -u load_tweets_batch.py --db=postgresql://postgres:pass@localhost:4587/ --inputs
