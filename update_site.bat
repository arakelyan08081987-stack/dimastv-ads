@echo off
chcp 65001 >nul
title Обновление сайта DIMAS.TV

echo ========================================================
echo        ОБНОВЛЕНИЕ МЕДИАКИТА DIMAS.TV
echo ========================================================
echo.

cd /d "%~dp0"

echo [1/3] Упаковка свежей версии в dimastv-site.zip...
powershell -Command "Compress-Archive -Path 'index.html', 'avatar.png' -DestinationPath '%USERPROFILE%\Desktop\dimastv-site.zip' -Force"
if %ERRORLEVEL% EQU 0 (
    echo [OK] Архив успешно создан на Рабочем столе: dimastv-site.zip
) else (
    echo [!] Ошибка при создании архива.
)
echo.

echo [2/3] Сохранение изменений в репозиторий GitHub...
git add .
git commit -m "update site content and media kit data"
git push origin main
echo [OK] Синхронизация с GitHub завершена!
echo.

echo [3/3] Открытие панели управления Netlify...
start https://app.netlify.com/projects/dimastv-media/overview
echo.

echo ========================================================
echo ВСЕ ГОТОВО!
echo Чтобы применить изменения на https://dimastv-media.netlify.app:
echo Перетащите файл dimastv-site.zip с Рабочего стола
echo в рамку 'Already built it?' в открывшемся браузере.
echo ========================================================
echo.
pause
