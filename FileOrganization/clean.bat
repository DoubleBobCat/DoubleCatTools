@echo off
@title �ļ���������
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
echo "img�Ѵ���"
)else (
md img
echo "����img�ļ���"
)
if exist text (
echo "text�Ѵ���"
)else (
md text
echo "����text�ļ���"
)
if exist text (
echo "video�Ѵ���"
)else (
md video
echo "����video"
)
if exist music (
echo "mMusic�Ѵ���"
)else (
md music
echo "����music�ļ���"
)
if exist zip (
echo "zip�Ѵ���"
)else (
md zip
echo "����zip�ļ���"
)
if exist exe (
echo "exe�Ѵ���"
)else (
md exe
echo "����exe�ļ���"
)
if exist iso (
echo "iso�Ѵ���"
)else (
md iso
echo "����iso�ļ���"
)
if exist torrent (
echo "torrent�Ѵ���"
)else (
md torrent
echo "����torrent�ļ���"
)
if exist other (
echo "other�Ѵ���"
)else (
md other
echo "����other�ļ���"
)
pause

echo ========== img ==========
for %%I in (%img%) do (
move "%%I" img
echo "�ƶ� %%I img"
)
echo ========== text ==========
for %%I in (%text%) do (
move "%%I" text
echo "�ƶ� %%I text"
)
echo ========== video ==========
for %%I in (%video%) do (
move "%%I" video
echo "�ƶ� %%I video"
)
echo ========== music ==========
for %%I in (%music%) do (
move "%%I" music
echo "�ƶ� %%I music"
)
echo ========== zip ==========
for %%I in (%zip%) do (
move "%%I" zip
echo "�ƶ� %%I zip"
)
echo ========== exe ==========
for %%I in (%exe%) do (
move "%%I" exe
echo "�ƶ� %%I exe"
)
echo ========== iso ==========
for %%I in (%iso%) do (
move "%%I" iso
echo "�ƶ� %%I iso"
)
echo ========== torrent ==========
for %%I in (%torrent%) do (
move "%%I" torrent
echo "�ƶ� %%I torrent"
)
echo ========== other ==========
for %%I in (%other%) do (
move "%%I" other
echo "�ƶ� %%I other"
)


echo =====������ļ�=====
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

echo =====������ļ���=====
for /f "delims=" %%a in ('dir /ad /s /b') do (
    dir /a-d/s/b "%%~a\*" >nul 2>nul
    if errorlevel 1 (
        rd /s /q "%%~a" 2>nul && echo ����"%%~a" || echo ����"%%~a"
    )
)
pause