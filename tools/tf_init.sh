#!/bin/bash
# Execute terraform init in each subfolder
for dir in bootstrap network compute
do \
  (cd $dir; terragrunt init;)
done
