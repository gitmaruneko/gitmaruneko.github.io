@echo off
setlocal

:: Set source and destination folders
set "SRC=year_posts"
set "DST=_posts"

:: Create destination folder if it does not exist
if not exist "%DST%" mkdir "%DST%"

:: Copy all files from subfolders in year_posts to _posts, overwrite if exists
echo Copying files:
for /r "%SRC%" %%f in (*.*) do (
    echo %%~nxf
    copy /Y "%%f" "%DST%\"
)

echo All files have been copied!
pause