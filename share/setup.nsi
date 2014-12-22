<<<<<<< HEAD
Name "Bitcoin Core (-bit)"
=======
Name EbolaShare
>>>>>>> gitian-test

RequestExecutionLevel highest
SetCompressor /SOLID lzma

# General Symbol Definitions
!define REGKEY "SOFTWARE\$(^Name)"
<<<<<<< HEAD
!define VERSION 0.10.99
!define COMPANY "Bitcoin Core project"
!define URL http://www.bitcoin.org/
=======
!define VERSION 0.5.0
!define COMPANY "Ebola Charity project"
!define URL http://ebolashare.github.io
>>>>>>> gitian-test

# MUI Symbol Definitions
!define MUI_ICON "/home/emb/ebolashare/share/pixmaps/bitcoin.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP "/home/emb/ebolashare/share/pixmaps/nsis-wizard.bmp"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP "/home/emb/ebolashare/share/pixmaps/nsis-header.bmp"
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_STARTMENUPAGE_REGISTRY_ROOT HKLM
!define MUI_STARTMENUPAGE_REGISTRY_KEY ${REGKEY}
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME StartMenuGroup
<<<<<<< HEAD
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "Bitcoin Core"
!define MUI_FINISHPAGE_RUN $INSTDIR\bitcoin-qt.exe
=======
!define MUI_STARTMENUPAGE_DEFAULTFOLDER EbolaShare
#!define MUI_FINISHPAGE_RUN $INSTDIR\ebolashare-qt.exe
>>>>>>> gitian-test
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "/home/emb/ebolashare/share/pixmaps/nsis-wizard.bmp"
!define MUI_UNFINISHPAGE_NOAUTOCLOSE

# Included files
!include Sections.nsh
!include MUI2.nsh
!if "" == "64"
!include x64.nsh
!endif

# Variables
Var StartMenuGroup

# Installer pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_STARTMENU Application $StartMenuGroup
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

# Installer languages
!insertmacro MUI_LANGUAGE English

# Installer attributes
<<<<<<< HEAD
OutFile /home/emb/ebolashare/bitcoin-${VERSION}-win-setup.exe
!if "" == "64"
InstallDir $PROGRAMFILES64\Bitcoin
!else
InstallDir $PROGRAMFILES\Bitcoin
!endif
=======
OutFile ebolashare-0.5.0-win32-setup.exe
InstallDir $PROGRAMFILES\EbolaShare
>>>>>>> gitian-test
CRCCheck on
XPStyle on
BrandingText " "
ShowInstDetails show
<<<<<<< HEAD
VIProductVersion ${VERSION}.0
VIAddVersionKey ProductName "Bitcoin Core"
=======
VIProductVersion 0.5.0.0
VIAddVersionKey ProductName EbolaShare
>>>>>>> gitian-test
VIAddVersionKey ProductVersion "${VERSION}"
VIAddVersionKey CompanyName "${COMPANY}"
VIAddVersionKey CompanyWebsite "${URL}"
VIAddVersionKey FileVersion "${VERSION}"
VIAddVersionKey FileDescription ""
VIAddVersionKey LegalCopyright ""
InstallDirRegKey HKCU "${REGKEY}" Path
ShowUninstDetails show

# Installer sections
Section -Main SEC0000
    SetOutPath $INSTDIR
    SetOverwrite on
<<<<<<< HEAD
    File /home/emb/ebolashare/release/bitcoin-qt.exe
    File /oname=COPYING.txt /home/emb/ebolashare/COPYING
    File /oname=readme.txt /home/emb/ebolashare/doc/README_windows.txt
    SetOutPath $INSTDIR\daemon
    File /home/emb/ebolashare/release/bitcoind.exe
    File /home/emb/ebolashare/release/bitcoin-cli.exe
    SetOutPath $INSTDIR\doc
    File /r /home/emb/ebolashare/doc\*.*
    SetOutPath $INSTDIR
    WriteRegStr HKCU "${REGKEY}\Components" Main 1

    # Remove old wxwidgets-based-bitcoin executable and locales:
    Delete /REBOOTOK $INSTDIR\bitcoin.exe
    RMDir /r /REBOOTOK $INSTDIR\locale
=======
    #File ../release/ebolashare-qt.exe
    File /oname=license.txt ../COPYING
    File /oname=readme.txt ../doc/README_windows.txt
    SetOutPath $INSTDIR\daemon
    File ../src/ebolashared.exe
    SetOutPath $INSTDIR\src
    File /r /x *.exe /x *.o ../src\*.*
    SetOutPath $INSTDIR
    WriteRegStr HKCU "${REGKEY}\Components" Main 1

    # Remove old wxwidgets-based-bitshare executable and locales:
    #Delete /REBOOTOK $INSTDIR\ebolashare.exe
    #RMDir /r /REBOOTOK $INSTDIR\locale
>>>>>>> gitian-test
SectionEnd

Section -post SEC0001
    WriteRegStr HKCU "${REGKEY}" Path $INSTDIR
    SetOutPath $INSTDIR
    WriteUninstaller $INSTDIR\uninstall.exe
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    CreateDirectory $SMPROGRAMS\$StartMenuGroup
<<<<<<< HEAD
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\$(^Name).lnk" $INSTDIR\bitcoin-qt.exe
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\Uninstall $(^Name).lnk" $INSTDIR\uninstall.exe
=======
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\Uninstall EbolaShare.lnk" $INSTDIR\uninstall.exe
>>>>>>> gitian-test
    !insertmacro MUI_STARTMENU_WRITE_END
    WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayName "$(^Name)"
    WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayVersion "${VERSION}"
    WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" Publisher "${COMPANY}"
    WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" URLInfoAbout "${URL}"
    WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayIcon $INSTDIR\uninstall.exe
    WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" UninstallString $INSTDIR\uninstall.exe
    WriteRegDWORD HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" NoModify 1
    WriteRegDWORD HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" NoRepair 1
<<<<<<< HEAD
    WriteRegStr HKCR "bitcoin" "URL Protocol" ""
    WriteRegStr HKCR "bitcoin" "" "URL:Bitcoin"
    WriteRegStr HKCR "bitcoin\DefaultIcon" "" $INSTDIR\bitcoin-qt.exe
    WriteRegStr HKCR "bitcoin\shell\open\command" "" '"$INSTDIR\bitcoin-qt.exe" "%1"'
=======

    # bitshare: URI handling disabled for 0.5.0
    #    WriteRegStr HKCR "bitshare" "URL Protocol" ""
    #    WriteRegStr HKCR "bitshare" "" "URL:Bitshare"
    #    WriteRegStr HKCR "bitshare\DefaultIcon" "" $INSTDIR\bitshare-qt.exe
    #    WriteRegStr HKCR "bitshare\shell\open\command" "" '"$INSTDIR\bitshare-qt.exe" "$$1"'
>>>>>>> gitian-test
SectionEnd

# Macro for selecting uninstaller sections
!macro SELECT_UNSECTION SECTION_NAME UNSECTION_ID
    Push $R0
    ReadRegStr $R0 HKCU "${REGKEY}\Components" "${SECTION_NAME}"
    StrCmp $R0 1 0 next${UNSECTION_ID}
    !insertmacro SelectSection "${UNSECTION_ID}"
    GoTo done${UNSECTION_ID}
next${UNSECTION_ID}:
    !insertmacro UnselectSection "${UNSECTION_ID}"
done${UNSECTION_ID}:
    Pop $R0
!macroend

# Uninstaller sections
Section /o -un.Main UNSEC0000
<<<<<<< HEAD
    Delete /REBOOTOK $INSTDIR\bitcoin-qt.exe
    Delete /REBOOTOK $INSTDIR\COPYING.txt
=======
    #Delete /REBOOTOK $INSTDIR\ebolashare-qt.exe
    Delete /REBOOTOK $INSTDIR\license.txt
>>>>>>> gitian-test
    Delete /REBOOTOK $INSTDIR\readme.txt
    RMDir /r /REBOOTOK $INSTDIR\daemon
    RMDir /r /REBOOTOK $INSTDIR\doc
    DeleteRegValue HKCU "${REGKEY}\Components" Main
SectionEnd

Section -un.post UNSEC0001
    DeleteRegKey HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)"
<<<<<<< HEAD
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\Uninstall $(^Name).lnk"
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\$(^Name).lnk"
    Delete /REBOOTOK "$SMSTARTUP\Bitcoin.lnk"
=======
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\Uninstall EbolaShare.lnk"
    #Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\Bitshare.lnk"
    #Delete /REBOOTOK "$SMSTARTUP\Bitshare.lnk"
>>>>>>> gitian-test
    Delete /REBOOTOK $INSTDIR\uninstall.exe
    Delete /REBOOTOK $INSTDIR\debug.log
    Delete /REBOOTOK $INSTDIR\db.log
    DeleteRegValue HKCU "${REGKEY}" StartMenuGroup
    DeleteRegValue HKCU "${REGKEY}" Path
    DeleteRegKey /IfEmpty HKCU "${REGKEY}\Components"
    DeleteRegKey /IfEmpty HKCU "${REGKEY}"
<<<<<<< HEAD
    DeleteRegKey HKCR "bitcoin"
=======
    DeleteRegKey HKCR "ebolashare"
>>>>>>> gitian-test
    RmDir /REBOOTOK $SMPROGRAMS\$StartMenuGroup
    RmDir /REBOOTOK $INSTDIR
    Push $R0
    StrCpy $R0 $StartMenuGroup 1
    StrCmp $R0 ">" no_smgroup
no_smgroup:
    Pop $R0
SectionEnd

# Installer functions
Function .onInit
    InitPluginsDir
!if "" == "64"
    ${If} ${RunningX64}
      ; disable registry redirection (enable access to 64-bit portion of registry)
      SetRegView 64
    ${Else}
      MessageBox MB_OK|MB_ICONSTOP "Cannot install 64-bit version on a 32-bit system."
      Abort
    ${EndIf}
!endif
FunctionEnd

# Uninstaller functions
Function un.onInit
    ReadRegStr $INSTDIR HKCU "${REGKEY}" Path
    !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuGroup
    !insertmacro SELECT_UNSECTION Main ${UNSEC0000}
FunctionEnd
