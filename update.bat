@echo off

git status -s
git add .
::echo %date%[%time%]
git commit -m "update %date%[%time%]"
::git push hub master
::git push gitee master
