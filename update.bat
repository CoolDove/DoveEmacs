@echo off
git status -s
git add .
git commit -m "update %date:~0,10%[%time:~0, 5%] %1"
git push hub master
git push gitee master
