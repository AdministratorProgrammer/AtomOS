::  Part of "AtomOS - Multiplatform Builder"                              ::
::  (mpb_build script)                                                    ::
::                                                                        ::
::  Version of the product for presentation at the competition.           ::
::  All rights reserved.                                                  ::

rem -------------- PATH ---------------
set SOURCE_PATH=%~1
set TEMP_PATH=%~2
set ARCH=%~3
set DEPENDENCIES_PATH=%~4
set BOOTLOADERS_PATH=%SOURCE_PATH%\boot
set OSCORE_PATH=%SOURCE_PATH%\core
rem -------------- TOOLS --------------

if %ARCH% == x86 (
	%DEPENDENCIES_PATH%\FASM.EXE %BOOTLOADERS_PATH%\x86\BIOS\1_MBR.asm %TEMP_PATH%\1_MBR.bin
) else (
	echo.
	echo The architecture is not available.
	echo Build process was interrupted.
)

echo.
echo END (mpb_build.bat)
pause

::  AtomOS - Multiplatform Builder                                        ::
::  Copyright © 2026 leexund                                              ::