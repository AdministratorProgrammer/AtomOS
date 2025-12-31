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

:help_command_handler
echo List of avaliable commands:
echo CLS       Clears the screen.
echo BUILD     Builds OS.
echo EXIT      Quits the batch script.
goto :command_line

:cls_command_handler
cls
goto :command_line

:exit_command_handler
exit /b 200

:build_command_handler
exit /b 100

:unknown_error_message
echo.
echo Critical Error!
set /p id=Press any key to exit.

exit /b
endlocal


:: Exit codes:
:: build_command_handler  :   100
:: exit_command_handler   :   200

::  AtomOS - Multiplatform Builder                                        ::
::  Copyright © 2025 leexund                                              ::