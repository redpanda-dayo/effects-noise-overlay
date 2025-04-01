@echo off
setlocal enabledelayedexpansion

set "INPUT_DIR=__overlay__"
set "OUTPUT_DIR=__overlay__fix__"

if not exist "%INPUT_DIR%" mkdir "%INPUT_DIR%"
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

set "NOISE_IMAGE=noise.png"

for %%F in (%INPUT_DIR%\*.png %INPUT_DIR%\*.jpg %INPUT_DIR%\*.jpeg) do (
    set "INPUT_FILE=%%F"
    set "OUTPUT_FILE=%OUTPUT_DIR%\%%~nxF"
    
    echo Processing: !INPUT_FILE!
    magick "!INPUT_FILE!" "!NOISE_IMAGE!" -compose overlay -composite "!OUTPUT_FILE!"
)

echo "Done."
pause
