!define PRODUCT_PUBLISHER "GoSdwan Technologies, Inc."
!define PRODUCT_WEB_SITE "https://www.gosdwan.com/"
;!define OPENVPN_ROOT "D:\workspace\sdwan\electron-builder-demo\scripts"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\tapinstall.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
;!define PACKAGE_NAME "ElectronBuilderDemo"

; !define MUI_PAGE_CUSTOMFUNCTION_show Pageshow
; InstallDirRegKey HKCU "Software\eBook Workshop "
; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
; !define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
; !define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

!define MUI_FINISHPAGE_NOAUTOCLOSE
; !define MUI_ICON "${OPENVPN_ROOT}\icon.ico"
; !define MUI_UNICON "${OPENVPN_ROOT}\icon.ico"
!define MUI_HEADERIMAGE
;!define MUI_HEADERIMAGE_BITMAP"${OPENVPN_ROOT}\install-whirl.bmp"
!define MUI_UNFINISHPAGE_NOAUTOCLOSE

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
;!insertmacro MUI_PAGE_LICENSE "c:\path\to\licence\YourSoftwareLicence.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\ElectronBuilderDemo\smart-connect.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; x64.nsh for architecture detection
!include "x64.nsh"
; MUI end ------

; Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
; OutFile "Smart Connect Setup_v${PRODUCT_VERSION}.exe"
;InstallDir "$PROGRAMFILES\Smart Connect"
InstallDir "$PROGRAMFILES\${PACKAGE_NAME}"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  
  SetOutPath "$INSTDIR"
  ; File "${OPENVPN_ROOT}\agent.exe"
  ; File "${OPENVPN_ROOT}\helper.exe"
  ; File "${OPENVPN_ROOT}\libcrypto-1_1.dll"
  ; File "${OPENVPN_ROOT}\libssl-1_1.dll"
  ; File "${OPENVPN_ROOT}\lz4.dll"

;   SetOutPath "$INSTDIR\smart-connect"
;   File /r "${OPENVPN_ROOT}\smart-connect\*"
  
   File /r "D:\workspace\sdwan\electron-builder-demo\dist_electron\win-unpacked\*"
  

;   SetOutPath "$INSTDIR\doc"
; ;  File "${OPENVPN_ROOT}\doc\FoxitPDFActiveX_5_8_Manual.pdf"
;   SetOutPath "$INSTDIR\drivers\tap\amd64\win10"
;   File "${OPENVPN_ROOT}\drivers\tap\amd64\win10\OemVista.inf"
;   File "${OPENVPN_ROOT}\drivers\tap\amd64\win10\tap0901.cat"
;   File "${OPENVPN_ROOT}\drivers\tap\amd64\win10\tap0901.sys"
;   File "${OPENVPN_ROOT}\drivers\tap\amd64\win10\tapinstall.exe"
;   SetOutPath "$INSTDIR\drivers\tap\amd64\win7"
;   File "${OPENVPN_ROOT}\drivers\tap\amd64\win7\OemVista.inf"
;   File "${OPENVPN_ROOT}\drivers\tap\amd64\win7\tap0901.cat"
;   File "${OPENVPN_ROOT}\drivers\tap\amd64\win7\tap0901.sys"
;   File "${OPENVPN_ROOT}\drivers\tap\amd64\win7\tapinstall.exe"
;   SetOutPath "$INSTDIR\drivers\tap\x86\win10"
;   File "${OPENVPN_ROOT}\drivers\tap\x86\win10\OemVista.inf"
;   File "${OPENVPN_ROOT}\drivers\tap\x86\win10\tap0901.cat"
;   File "${OPENVPN_ROOT}\drivers\tap\x86\win10\tap0901.sys"
;   File "${OPENVPN_ROOT}\drivers\tap\x86\win10\tapinstall.exe"
;   SetOutPath "$INSTDIR\drivers\tap\x86\win7"
;   File "${OPENVPN_ROOT}\drivers\tap\x86\win7\OemVista.inf"
;   File "${OPENVPN_ROOT}\drivers\tap\x86\win7\tap0901.cat"
;   File "${OPENVPN_ROOT}\drivers\tap\x86\win7\tap0901.sys"
;   File "${OPENVPN_ROOT}\drivers\tap\x86\win7\tapinstall.exe"
;   SetOutPath "$INSTDIR"
;  File "${OPENVPN_ROOT}\legal.txt"
;  File "${OPENVPN_ROOT}\ReleaseNotes.txt"

  ; ${If} ${RunningX64}
  ;       File "${OPENVPN_ROOT_X86_64}\SmartConnect.exe"
  ; ${Else}
	; File "${OPENVPN_ROOT_I686}\SmartConnect.exe"
  ; ${EndIf}
  ; File "${OPENVPN_ROOT}\tapinstallEx.exe"
  
  CreateDirectory "$SMPROGRAMS\ElectronBuilderDemo"
  ; CreateShortCut "$SMPROGRAMS\Smart Connect\Smart Connect.lnk" "$INSTDIR\smart-connect\smart-connect.exe"
  ; CreateShortCut "$DESKTOP\Smart Connect.lnk" "$INSTDIR\smart-connect\smart-connect.exe"

  ; ExecWait   '"$INSTDIR\tapinstallEx.exe" /install "$INSTDIR"'
  ; nsExec::Exec   '"$INSTDIR\helper.exe" /install "$INSTDIR"'
SectionEnd

Section Uninstall

	; Stop OpenVPN-GUI if currently running
	DetailPrint "Stopping SmartConnect-GUI..."
	
SectionEnd