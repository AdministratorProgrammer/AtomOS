::  Part of "AtomOS - Multiplatform Builder"                              ::
::  (mpb_cmd script)                                                      ::
::                                                                        ::
::  Version of the product for presentation at the competition.           ::
::  All rights reserved.                                                  ::

setlocal EnableExtensions EnableDelayedExpansion
chcp 65001
cls

title AtomOS - Multiplatform Bulder
echo ========================================
echo ===  AtomOS - Multiplatform Builder  ===
echo ===  author:  leexund                ===
echo ========================================


:command_line
echo.
set "command="
set /p "command=Command: "

if "!command!"        == "help" (
	goto :help_command_handler
) else if "!command!" == "cls"  (
	goto :cls_command_handler
) else if "!command!" == "build" (
	goto :build_command_handler
) else if "!command!" == "exit" (
	goto :exit_command_handler
) else if "!command!" == "" (
	goto :command_line
)


echo Unknown command. Enter "help" for a list of commands.
goto :command_line


:: ===== HELP COMMAND HANDLER ====== ::
:help_command_handler
echo List of avaliable commands:
echo CLS       -     Clears the screen.
echo BUILD     -     Builds OS.
echo EXIT      -     Quits the batch script.
goto :command_line

:cls_command_handler
cls
goto :command_line
:: ===== HELP COMMAND HANDLER ====== ::
:: ============ END ================ ::


:: ===== BUILD COMMAND HANDLER ===== ::
:build_command_handler
echo Select the processor architecture:
echo x86     -      x86    (32 bit)
echo x64     -      x86-64 (64 bit)

:arch_input
set "arch="
set /p "arch=arch: "

if "!arch!"        == "x86" (
	exit /b 101
) else if "!arch!" == "x64"  (
	exit /b 102
) else if "!arch!" == "" (
	goto :arch_input
)
echo.
echo Build process was interrupted.

exit /b 100
:: ===== BUILD COMMAND HANDLER ===== ::
:: ============ END ================ ::


:: ===== EXIT COMMAND HANDLER ====== ::

:exit_command_handler
exit /b 200

:: ===== EXIT COMMAND HANDLER ====== ::
:: ============ END ================ ::

:unknown_error_message
echo.
echo Critical Error!
set /p id=Press any key to exit.

exit /b
endlocal


:: ---------------------------------------------------------------------- ::
::      Exit codes:                                                       ::
::      -- build_command_handler:                                         ::
::          -- x86                :   101                                 ::
::          -- x86-64             :   102                                 ::
::          -- interrupted        :   100                                 ::
::                                                                        ::
::      -- exit_command_handler   :   200                                 ::
:: ---------------------------------------------------------------------- ::

::  AtomOS - Multiplatform Builder                                        ::
::  Copyright © 2026 leexund                                              ::