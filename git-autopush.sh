#!/bin/sh
git pull origin master
git add .
git commit -m "Flutter Virtual Commit using Bash 1.0.1(First Commit) `date +%F-%T`"
git push -f origin master