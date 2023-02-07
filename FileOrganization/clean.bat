@echo off
@title 文件夹整理工具
setlocal enabledelayedexpansion
color a
set img=*.psd *.pdd *.jpg *.jpeg *.png *.gif *.svg *.webp *.ico
set text=*.doc *.docx *.ppt *.pptx *.xls *.xlsx *.txt *.pdf *.m *.drawio *.ggb
set video=*.flv *.mp4 *.avi *.rmvb *.rm *.3gp *.ass *.m3u8 *.srt
set music=*.wav *.mp3 *.wma *.flac *.lrc
set zip=*.zip *.rar *.7z *.gz *.arj *.001 *.002 *.003 *.004 *.005
set iso=*.iso
set torrent=*.torrent
set exe=*.exe
set other=*.scel

if exist img (
echo "img已存在"
)else (
md img
echo "创建img文件夹"
)
if exist text (
echo "text已存在"
)else (
md text
echo "创建text文件夹"
)
if exist text (
echo "video已存在"
)else (
md video
echo "创建video"
)
if exist music (
echo "mMusic已存在"
)else (
md music
echo "创建music文件夹"
)
if exist zip (
echo "zip已存在"
)else (
md zip
echo "创建zip文件夹"
)
if exist exe (
echo "exe已存在"
)else (
md exe
echo "创建exe文件夹"
)
if exist iso (
echo "iso已存在"
)else (
md iso
echo "创建iso文件夹"
)
if exist torrent (
echo "torrent已存在"
)else (
md torrent
echo "创建torrent文件夹"
)
if exist other (
echo "other已存在"
)else (
md other
echo "创建other文件夹"
)
pause

echo ========== img ==========
for %%I in (%img%) do (
move "%%I" img
echo "移动 %%I img"
)
echo ========== text ==========
for %%I in (%text%) do (
move "%%I" text
echo "移动 %%I text"
)
echo ========== video ==========
for %%I in (%video%) do (
move "%%I" video
echo "移动 %%I video"
)
echo ========== music ==========
for %%I in (%music%) do (
move "%%I" music
echo "移动 %%I music"
)
echo ========== zip ==========
for %%I in (%zip%) do (
move "%%I" zip
echo "移动 %%I zip"
)
echo ========== exe ==========
for %%I in (%exe%) do (
move "%%I" exe
echo "移动 %%I exe"
)
echo ========== iso ==========
for %%I in (%iso%) do (
move "%%I" iso
echo "移动 %%I iso"
)
echo ========== torrent ==========
for %%I in (%torrent%) do (
move "%%I" torrent
echo "移动 %%I torrent"
)
echo ========== other ==========
for %%I in (%other%) do (
move "%%I" other
echo "移动 %%I other"
)


echo =====清理空文件=====
for %%i in (img\*.*) do (
if %%~zi == 0 del "%%i"
)
for %%i in (text\*.*) do (
if %%~zi == 0 del "%%i"
)
for %%i in (video\*.*) do (
if %%~zi == 0 del "%%i"
)
for %%i in (music\*.*) do (
if %%~zi == 0 del "%%i"
)
for %%i in (zip\*.*) do (
if %%~zi == 0 del "%%i"
)
for %%i in (exe\*.*) do (
if %%~zi == 0 del "%%i"
)
for %%i in (iso\*.*) do (
if %%~zi == 0 del "%%i"
)
for %%i in (torrent\*.*) do (
if %%~zi == 0 del "%%i"
)
for %%i in (other\*.*) do (
if %%~zi == 0 del "%%i"
)
pause

echo =====清理空文件夹=====
for /f "delims=" %%a in ('dir /ad /s /b') do (
    dir /a-d/s/b "%%~a\*" >nul 2>nul
    if errorlevel 1 (
        rd /s /q "%%~a" 2>nul && echo 清理"%%~a" || echo 清理"%%~a"
    )
)
pause