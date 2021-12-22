@echo off

git status -s
git add .
echo %date:~0,10% [%time:~1,7%] %2
::git commit -m "update %date:~0,4%[%time%]"
::git push hub master
::git push gitee master
