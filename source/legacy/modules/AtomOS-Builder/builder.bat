rem ================================================== [RU] ====================================================
rem ====      AtomOS-Builder - скрипт для автоматизации процесса компиляции, линковки и сборки ОС Atom      ====
rem ============================================================================================================

rem ================================================== [EN] ====================================================
rem ==== AtomOS-Builder is a script to automate the process of compiling, linking and building the Atom OS  ====
rem ============================================================================================================

rem == GitHub: https://github.com/AdministratorProgrammer/AtomOS

@echo off
chcp 65001
set lng=%1

title AtomOS-Builder
rem ----------- Modules -----------
set FASM=%~dp0../FASM/FASM.EXE
rem ------------ PATH -------------
set CODE_PATH=%~dp0../../code
set BIN_PATH=%~dp0../../bin
set MinGW=%~dp0../MinGW/bin
set teSPACE_PATH=%~dp0temp_executable
set CURRENT_PATH=%~dp0

if %lng% equ 1 goto ru_app else\
if %lng% equ 2 goto en_app else\
echo Enter the language number:
echo "1" - ru
echo "2" - en
set /p lng=Language number: 
if %lng% equ 1 goto ru_app else\
if %lng% equ 2 goto en_app else\
pause
goto EXIT

:ru_app
cls
echo AtomOS-Builder запущен...
echo.

echo Подготовка:
echo.
call :PREPARE_BUILDER
echo.

echo Сборка -  Master Boot Record:
call :BUILD_MBR
rem echo Сборка - Bios Parameter Block
rem call :BUILD_BPB
echo Сборка - ASOL:
call :BUILD_ASOL
echo Сборка - Kernel:
call :BUILD_KERNEL
echo Линковка:
call :LINKER
pause
goto EXIT

:en_app
cls
echo AtomOS-Builder is running...
echo.

echo Preparing:
echo.
call :PREPARE_BUILDER
echo.

call :BUILD_MBR
rem call :BUILD_BPB
call :BUILD_ASOL
call :BUILD_KERNEL
call :LINKER
pause
goto EXIT

:PREPARE_BUILDER
cd "%teSPACE_PATH%"

IF EXIST "bin\" (
  if %lng% equ 1 echo "bin" папка найдена
  if %lng% equ 2 echo "bin" folder found
) ELSE (
  if %lng% equ 1 echo Не найдена папка "bin" в %teSPACE_PATH%
  if %lng% equ 2 echo "bin" folder was not found %teSPACE_PATH%
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  mkdir bin
)

cd "%teSPACE_PATH%\bin"

IF EXIST "gcc.exe" (
  if %lng% equ 1 echo "gcc.exe" найден
  if %lng% equ 2 echo "gcc.exe" found
) ELSE (
  if %lng% equ 1 echo Не найден "gcc.exe" в %teSPACE_PATH%\bin
  if %lng% equ 2 echo Not found "gcc.exe" in %teSPACE_PATH%
  cd %MinGW%
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  copy /B gcc.exe "%teSPACE_PATH%\bin\gcc.exe"
  cd "%teSPACE_PATH%\bin"
)

IF EXIST "objcopy.exe" (
  if %lng% equ 1 echo "objcopy.exe" найден
  if %lng% equ 2 echo "objcopy.exe" found
) ELSE (
  if %lng% equ 1 echo Не найден "objcopy.exe" в %teSPACE_PATH%
  if %lng% equ 2 echo Not found "objcopy.exe" in %teSPACE_PATH%
  cd %MinGW%
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  copy /B objcopy.exe "%teSPACE_PATH%\bin\objcopy.exe"
  cd "%teSPACE_PATH%\bin"
)

IF EXIST "libiconv-2.dll" (
  if %lng% equ 1 echo "libiconv-2.dll" найден
  if %lng% equ 2 echo "libiconv-2.dll" found
) ELSE (
  if %lng% equ 1 echo Не найден "libiconv-2.dll" в %teSPACE_PATH%
  if %lng% equ 2 echo Not found "libiconv-2.dll" in %teSPACE_PATH%
  cd %MinGW%
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  copy /B libiconv-2.dll "%teSPACE_PATH%\bin\libiconv-2.dll"
  cd "%teSPACE_PATH%\bin"
)

IF EXIST "libmingwex-0.dll" (
  if %lng% equ 1 echo "libmingwex-0.dll" найден
  if %lng% equ 2 echo "libmingwex-0.dll" found
) ELSE (
  if %lng% equ 1 echo Не найден "libmingwex-0.dll" в %teSPACE_PATH%
  if %lng% equ 2 echo Not found "libmingwex-0.dll" in %teSPACE_PATH%
  cd %MinGW%
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  copy /B libmingwex-0.dll "%teSPACE_PATH%\bin\libmingwex-0.dll"
  cd "%teSPACE_PATH%\bin"
)

IF EXIST "libgmp-10.dll" (
  if %lng% equ 1 echo "libgmp-10.dll" найден
  if %lng% equ 2 echo "libgmp-10.dll" found
) ELSE (
  if %lng% equ 1 echo Не найден "libgmp-10.dll" в %teSPACE_PATH%
  if %lng% equ 2 echo Not found "libgmp-10.dll" in %teSPACE_PATH%
  cd %MinGW%
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  copy /B libgmp-10.dll "%teSPACE_PATH%\bin\libgmp-10.dll"
  cd "%teSPACE_PATH%\bin"
)

IF EXIST "libmpc-3.dll" (
  if %lng% equ 1 echo "libmpc-3.dll" найден
  if %lng% equ 2 echo "libmpc-3.dll" found
) ELSE (
  if %lng% equ 1 echo Не найден "libmpc-3.dll" в %teSPACE_PATH%
  if %lng% equ 2 echo Not found "libmpc-3.dll" in %teSPACE_PATH%
  cd %MinGW%
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  copy /B libmpc-3.dll "%teSPACE_PATH%\bin\libmpc-3.dll"
  cd "%teSPACE_PATH%\bin"
)

IF EXIST "libisl-15.dll" (
  if %lng% equ 1 echo "libisl-15.dll" найден
  if %lng% equ 2 echo "libisl-15.dll" found
) ELSE (
  if %lng% equ 1 echo Не найден "libisl-15.dll" в %teSPACE_PATH%
  if %lng% equ 2 echo Not found "libisl-15.dll" in %teSPACE_PATH%
  cd %MinGW%
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  copy /B libisl-15.dll "%teSPACE_PATH%\bin\libisl-15.dll"
  cd "%teSPACE_PATH%\bin"
)

IF EXIST "libmpfr-4.dll" (
  if %lng% equ 1 echo "libmpfr-4.dll" найден
  if %lng% equ 2 echo "libmpfr-4.dll" found
) ELSE (
  if %lng% equ 1 echo Не найден "libmpfr-4.dll" в %teSPACE_PATH%
  if %lng% equ 2 echo Not found "libmpfr-4.dll" in %teSPACE_PATH%
  cd %MinGW%
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  copy /B libmpfr-4.dll "%teSPACE_PATH%\bin\libmpfr-4.dll"
  cd "%teSPACE_PATH%\bin"
)

IF EXIST "libgcc_s_dw2-1.dll" (
  if %lng% equ 1 echo "libgcc_s_dw2-1.dll" найден
  if %lng% equ 2 echo "libgcc_s_dw2-1.dll" found
) ELSE (
  if %lng% equ 1 echo Не найден "libgcc_s_dw2-1.dll" в %teSPACE_PATH%
  if %lng% equ 2 echo Not found "libgcc_s_dw2-1.dll" in %teSPACE_PATH%
  cd %MinGW%
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  copy /B libgcc_s_dw2-1.dll "%teSPACE_PATH%\bin\libgcc_s_dw2-1.dll"
  cd "%teSPACE_PATH%\bin"
)

IF EXIST "ld.exe" (
  if %lng% equ 1 echo "ld.exe" найден
  if %lng% equ 2 echo "ld.exe" found
) ELSE (
  if %lng% equ 1 echo Не найден "ld.exe" в %teSPACE_PATH%
  if %lng% equ 2 echo Not found "ld.exe" in %teSPACE_PATH%
  cd %MinGW%
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  copy /B ld.exe "%teSPACE_PATH%\bin\ld.exe"
)

cd %teSPACE_PATH%

IF EXIST "lib\" (
  if %lng% equ 1 echo "lib" папка найдена
  if %lng% equ 2 echo "lib" folder found
) ELSE (
  if %lng% equ 1 echo Не найдена папка "lib" в %teSPACE_PATH%
  if %lng% equ 2 echo "lib" folder was not found %teSPACE_PATH%
  cd %~dp0../MinGW/
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  xcopy /S "lib" "%teSPACE_PATH%\lib\"
  cd %teSPACE_PATH%
)

IF EXIST "include\" (
  if %lng% equ 1 echo "include" папка найдена
  if %lng% equ 2 echo "include" folder found
) ELSE (
  if %lng% equ 1 echo Не найдена папка "include" в %teSPACE_PATH%
  if %lng% equ 2 echo "include" folder was not found %teSPACE_PATH%
  cd %~dp0../MinGW/
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  xcopy /S "include" "%teSPACE_PATH%\include\"
  cd %teSPACE_PATH%
)

IF EXIST "libexec\" (
  if %lng% equ 1 echo "libexec" папка найдена
  if %lng% equ 2 echo "libexec" folder found
) ELSE (
  if %lng% equ 1 echo Не найдена папка "libexec" в %teSPACE_PATH%
  if %lng% equ 2 echo "libexec" folder was not found %teSPACE_PATH%
  cd %~dp0../MinGW/
  echo.
  if %lng% equ 1 echo Копирование отсутствующего модуля...
  if %lng% equ 2 echo Copying the missing module...
  xcopy /S "libexec" "%teSPACE_PATH%\libexec\"
  cd %teSPACE_PATH%
)

echo.
EXIT /B 0

:BUILD_MBR
%FASM% %CODE_PATH%/1_MBR.asm %BIN_PATH%/1_MBR.bin
echo.
EXIT /B 0

:BUILD_BPB
%FASM% %CODE_PATH%/2_BPB.asm %BIN_PATH%/2_BPB.bin
echo.
EXIT /B 0

:BUILD_ASOL
%FASM% %CODE_PATH%/AtomOS_Loader.asm %BIN_PATH%/3_AOSL.bin
echo.
EXIT /B 0

:BUILD_KERNEL
%FASM% %CODE_PATH%/Kernel.asm %teSPACE_PATH%/bin/Kernel_entry.o
cd "%teSPACE_PATH%/bin"
gcc.exe -m32 -ffreestanding -nostdlib -c %CODE_PATH%/Kernel.c -o Kernel.o
ld -T NUL -o Kernel.tmp -Tdata 0x11000 -Trodata 0x11000  -Ttext 0x1006E -Tbss 0x15000 Kernel_entry.o Kernel.o
objcopy -O binary Kernel.tmp Kernel.bin

del /f /q Kernel.o Kernel_entry.o Kernel.tmp

move /Y Kernel.bin %BIN_PATH%

cd %CURRENT_PATH%
echo.

EXIT /B 0

:LINKER

REM cd %MinGW%
REM copy /B 1_MBR.bin+Kernel.o OS.bin
REM ld.exe -Ttext 0x0500 --oformat binary %BIN_PATH%/Kernel.bin %BIN_PATH%/Kernel.o -o OS.bin
cd %BIN_PATH%
copy /B 1_MBR.bin+3_AOSL.bin+Kernel.bin OS.bin
REM copy /B 1_MBR.bin+2_BPB.bin+3_AOSL.bin OS.bin
cd %MinGW%
REM ld.exe -m i686-elf -T %CURRENT_PATH%/linker-file.ld -o %BIN_PATH%/Kernel.gen %BIN_PATH%/Kernel.bin %BIN_PATH%/Kernel.o

cd %CURRENT_PATH%
echo.
EXIT /B 0

:EXIT