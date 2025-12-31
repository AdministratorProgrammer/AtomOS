::  Part of "AtomOS - Multiplatform Builder"                              ::
::  (mpb_build script)                                                    ::
::                                                                        ::
::  Version of the product for presentation at the competition.           ::
::  All rights reserved.                                                  ::

rem -------------- PATH ---------------1
set SOURCE_PATH=%~1
set TEMP_PATH=%~2
set BOOTLOADERS_PATH=%SOURCE_PATH%\boot
set OSCORE_PATH=%SOURCE_PATH%\core
rem -------------- TOOLS --------------

%BOOTLOADERS_PATH%\x86\BIOS\FASM.EXE %BOOTLOADERS_PATH%\x86\BIOS\1_MBR.asm %TEMP_PATH%\1_MBR.bin

echo END (mpb_build.bat)
pause

::  AtomOS - Multiplatform Builder                                        ::
::  Copyright © 2025 leexund                                              ::