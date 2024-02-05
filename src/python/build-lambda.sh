#!/bin/bash

account_id=$1

lambda_name=$(basename $(pwd))

echo "It's a python lambda."

mkdir function

cp main.py function/main.py
cp __init__.py function/__init__.py

cd function/

zip -r ../$lambda_name.zip ./*
cd ..

rm -rf function/
rm -rf venv/

aws s3 cp $lambda_name.zip s3://lambda-functions-$account_id/
rm $lambda_name.zip

aws lambda update-function-code --function-name $lambda_name --s3-bucket lambda-functions-$account_id --s3-key $lambda_name.zip --no-cli-pager