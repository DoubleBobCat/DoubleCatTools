@echo off
@title Folder Organizer
setlocal enabledelayedexpansion
color a
set img=*.psd *.pdd *.jpg *.jpeg *.png *.gif *.svg *.webp *.ico
set text=*.doc *.docx *.ppt *.pptx *.xls *.xlsx *.txt *.pdf *.m *.drawio *.ggb
set video=*.flv *.mp4 *.avi *.rmvb *.rm *.3gp *.ass *.m3u8 *.srt
set music=*.wav *.mp3 *.wma *.flac *.lrc *.pkf *mpd
set archives=*.zip *.rar *.7z *.gz *.arj *.001 *.002 *.003 *.004 *.005 *.006 *.007 *.008 *.009 *.010
set iso=*.iso
set torrent=*.torrent
set exe=*.exe *.json *.log *.yml 
set code=*.cpp *.c *.h *.py *.html *.php *.htm *.asp *.e *.ui *.bin
set other=*.scel *.mht *.bak

if exist img (
echo "img already exists"
)else (
md img
echo "create img folder"
)
if exist text (
echo "text already exists"
)else (
md text
echo "create text folder"
)
if exist text (
echo "video already exists"
)else (
md video
echo "create video"
)
if exist music (
echo "mMusic already exists"
)else (
md music
echo "create music folder"
)
if exist archives (
echo "archives already exists"
)else (
md archives
echo "create archives folder"
)
if exist exe (
echo "exe already exists"
)else (
md exe
echo "create exe folder"
)
if exist iso (
echo "iso already exists"
)else (
md iso
echo "create iso folder"
)
if exist torrent (
echo "torrent already exists"
)else (
md torrent
echo "create torrent folder"
)
if exist code (
echo "code already exists"
)else (
md code
echo "create code folder"
)
if exist other (
echo "other already exists"
)else (
md other
echo "create other folder"
)
pause

echo ========== img ==========
for %%I in (%img%) do (
move "%%I" img
echo "move %%I img"
)
echo ========== text ==========
for %%I in (%text%) do (
move "%%I" text
echo "move %%I text"
)
echo ========== video ==========
for %%I in (%video%) do (
move "%%I" video
echo "move %%I video"
)
echo ========== music ==========
for %%I in (%music%) do (
move "%%I" music
echo "move %%I music"
)
echo ========== archives ==========
for %%I in (%archives%) do (
move "%%I" archives
echo "move %%I archives"
)
echo ========== exe ==========
for %%I in (%exe%) do (
move "%%I" exe
echo "move %%I exe"
)
echo ========== iso ==========
for %%I in (%iso%) do (
move "%%I" iso
echo "move %%I iso"
)
echo ========== torrent ==========
for %%I in (%torrent%) do (
move "%%I" torrent
echo "move %%I torrent"
)
echo ========== code ==========
for %%I in (%code%) do (
move "%%I" code
echo "move %%I code"
)
echo ========== other ==========
for %%I in (%other%) do (
move "%%I" other
echo "move %%I other"
)


echo =====clean empty file=====
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
for %%i in (archives\*.*) do (
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
for %%i in (code\*.*) do (
if %%~zi == 0 del "%%i"
)
for %%i in (other\*.*) do (
if %%~zi == 0 del "%%i"
)
pause

echo =====clean empty folder=====
for /f "delims=" %%a in ('dir /ad /s /b') do (
    dir /a-d/s/b "%%~a\*" >nul 2>nul
    if errorlevel 1 (
        rd /s /q "%%~a" 2>nul && echo clean: "%%~a" || echo find empty folder: "%%~a"
    )
)
pause