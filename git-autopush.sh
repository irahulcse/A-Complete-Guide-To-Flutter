#!/bin/sh
git pull origin master
git add .
git commit -m "Automatic Commit `date +%F-%T`"
git push origin master