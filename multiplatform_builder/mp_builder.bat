::  AtomOS - Multiplatform Builder                                        ::
::                                                                        ::
::  Version of the product for presentation at the competition.           ::
::  All rights reserved.                                                  ::
::                                                                        ::
::  GitHub:            https://github.com/AdministratorProgrammer/AtomOS  ::
::  Telegram (author): https://t.me/leexund                               ::

@echo off

:start

rem -------------- PATH ---------------
set ROOT_PATH=%~dp0

cd %ROOT_PATH%\..
set SOURCE_PATH=%CD%\source
cd %ROOT_PATH%

set TEMP_PATH=%CD%\temp
set BUILDER_SCRIPTS_PATH=%CD%\builder_scripts
set CONFIGURATIONS_PATH=%CD%\configurations
rem --------- BUILDER MODULES ---------
set mpb_cmd=%BUILDER_SCRIPTS_PATH%\mpb_cmd.bat
set mpb_build=%BUILDER_SCRIPTS_PATH%\mpb_build.bat
rem ---------- DEPENDENCIES -----------


call %mpb_cmd%
if %ERRORLEVEL%==100 (
	goto :build_os
) else if %ERRORLEVEL%==200 (
	goto :exit_handler
)

goto :exit_handler

:build_os
mkdir %TEMP_PATH%

call %mpb_build% %SOURCE_PATH% %TEMP_PATH%

del /Q /S %TEMP_PATH%
rmdir %TEMP_PATH%
goto start

:exit_handler
exit /b

::  AtomOS - Multiplatform Builder                                        ::
::  Copyright © 2025 leexund                                              ::