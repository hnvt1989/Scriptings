;ShellExecute("http://192.168.1.17:8080") 

#include <IE.au3>
#include <constants.au3>
#include <File.au3>


; $CMD[0] is the number of argument

; [Path of iSCT.conf] [SSID] [WLAN / LAN] [ ON/ OFF] 
;"C:\Users\huynguyx\isct.conf"

;checking error on the inputs
$error = ""
$ret = "Success"

If $CMDLINE[0] = 0 Then
   _printUsage()
   Exit(0)
EndIf

If $CMDLINE[0]<> 4 Then
	$error = "Error: Invalid number of arguments"
EndIf

_logErr ($error)

If Not FileExists ($CMDLINE[1]) Then
   $error = "Error: File does not exist"
EndIf

_logErr ($error)
   
If ($CMDLINE[3] = "LAN" Or $CMDLINE[3] = "WLAN" ) Then
Else
   $error = "Error: Invalid interface ( LAN / WLAN)"
EndIf

_logErr ($error)
   
If ($CMDLINE[4] = "OFF" Or $CMDLINE[4] = "ON" )  Then
Else
   $error = "Error: Invalid option ( OFF / ON)"
EndIf

_logErr ($error)


$configFilePath = $CMDLINE[1]
$identifier = $CMDLINE[2] ; [ xabcre]
$interface = $CMDLINE[3] ; LAN / WLAN
$opt = $CMDLINE[4] ; OFF / ON

;$scriptPath = "C:\ISCT\AVE\getAP_Info.ps1"
;$configFilePath = "C:\ISCT\AVE\iSCT.conf"


If $interface = "WLAN" Then
   ;Return "Not Implemented"
   
   _killProc('iexplore.exe')

   sleep(1000)
   ; Create a browser window and navigate to  login page

   $toGet = "AP_IP"

   ; getting the IpAddress, return Error if NOT FOUND
   $ipAddress = _getProperty($configFilePath ,$identifier, $toGet)

   If StringInStr( $ipAddress, "Error") Then
	  return $ipAddress
   Endif



   $address = "http://" & $ipAddress
   ;$oIE = _IECreate($address, 0,0,1,1)
   $oIE = _IECreate()
   _IENavigate($oIE, $address)
   _IELoadWait ($oIE)
   
   Send("^f") ; close find window
   Send("{BS}")
   Send("{ESC}")

   $hasDDWRT = 1
   _checkDDWRT()
   ;MsgBox(0, Default, $hasDDWRT)
   
   ;================================== if this AP is DD WRT supported (CISCO AP) =================================
   If $hasDDWRT = True Then
	  ;MsgBox(0, Default, "DD-WRT")
	  $plinkPath = "C:\ISCT\AVE\plink.exe"
	  
	  $switch = 1
	  If $opt = "on" Then
		 $switch = "up"
	  ElseIf $opt = "off" Then
		 $switch = "down"
	  EndIf
	  ; getting the RF_Name , return the Error if NOT FOUND
	  $toGet = "RF_Name"
	  $RF_Name = _getProperty($configFilePath , $identifier, $toGet)
	  If StringInStr( $RF_Name, "Error") Then
		 return $RF_Name
	  Endif
	  
	  ; getting the Username, return the Error if NOT FOUND
	  $toGet = "Username"
	  $userName = _getProperty($configFilePath , $identifier, $toGet)
	  If StringInStr( $userName, "Error") Then
		 return $userName
	  Endif
	  
	  ; getting the password, return the Error if NOT FOUND
	  $toGet = "Password"
	  $passWord = _getProperty($configFilePath , $identifier, $toGet)
	  If StringInStr( $passWord, "Error") Then
		 return $passWord
	  Endif

	  $string2 = "%%whs%%"

	  $plinkCommand = $plinkPath & ' ' & _RTRIM($ipAddress, $string2) & ' ' & "-l" & ' ' &  _RTRIM($userName, $string2) & ' ' & "-pw" & ' ' &  _RTRIM($passWord, $string2) & ' ' & "ifconfig" & ' ' & _RTRIM($RF_Name, $string2) & ' ' & $switch

	  $process_id = Run($plinkCommand , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
	  ;MsgBox(0, Default, $plinkCommand )
	  ;MsgBox(0, Default, $plinkPath & ' ' & $plinkCommand  )

	  ;rebooting the cisco
	  ;If (StringInStr($identifier, "cisco") <> 0 And $opt = "on" ) Then
	  If ($opt = "on" ) Then
		 $plinkCommand = $plinkPath & ' ' & _RTRIM($ipAddress, $string2) & ' ' & "-l" & ' ' &  _RTRIM($userName, $string2) & ' ' & "-pw" & ' ' &  _RTRIM($passWord, $string2) & ' ' & "reboot"
		 $process_id_reboot = Run($plinkCommand , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
	  EndIf

	  $loop = 1
	  
	  For $i = 1 To 20 Step 1
		 $isOnNetwork = _checkSSID($identifier)
		 If ($opt ="ON") And($isOnNetwork = 1) Then
			ExitLoop
		 EndIf
		 If ($opt ="OFF") And($isOnNetwork = 0) Then
			ExitLoop
		 EndIf
		 _logRunningStat  ("Verifying if " & $interface & " of " & $identifier & " is turn " & $opt &". Sleeping for 10 seconds. Loop = " & $loop)
		 $loop = $loop + 1
		 Sleep(10000)
	  Next	  
	  
	  _logRunningStat  ("Verifying if " & $interface & " of " & $identifier & " is turn " & $opt & ". Loop = " & $loop)
      If ($loop >= 20) Then	
		 $ret = "Failed !"
	  EndIf
   EndIf
   
   ;=================================== if this AP is not DD WRT supported============================

   If $hasDDWRT = False Then
	
	  Local $sSrc = _IEDocReadHTML($oIE)
	  sleep(2000)

	  Dim $isTRENDNET = StringRegExp($sSrc, '.*TEW*', 0)
	  ;Dim $isBELKIN = StringRegExp($sSrc, '.*TEW*', 0)

	  If $isTRENDNET  = 1 Then ;this is the TRENDNET AP

		 $o_form = _IEGetObjByName ($oIE, "form1")
		 $o_login = _IEFormElementGetObjByName($o_form, "login_n") ; username
		 $o_password = _IEFormElementGetObjByName($o_form, "login_pass") ; password
		 
		 _IEFormElementSetValue($o_login, "admin")
		 _IEFormElementSetValue($o_password, "intel@1234")
		 
		 $oSubmit = _IEGetObjByName ($o_form, "login")
		 _IEAction ($oSubmit, "click")
		 _IELoadWait ($oIE)
		 
		 $addressWireless = "http://" & $ipAddress & ":8080/wireless_basic.asp"
		 
		 _IENavigate($oIE, $addressWireless)
		 
		 _IELoadWait ($oIE)
		 If $opt = 0 Then
			$oForm = _IEGetObjByName ($oIE, "form1")
			_IEFormElementRadioSelect ($oForm, 1 , "wlan0_enable", 1, "byIndex")
			Sleep(2000)
			$oIE.document.parentWindow.execscript("send_request()")
		 Else
			$oForm = _IEGetObjByName ($oIE, "form1")
			_IEFormElementRadioSelect ($oForm, 0 , "wlan0_enable", 1, "byIndex")
			
			Sleep(2000)
			$oIE.document.parentWindow.execscript("send_request()")
		 EndIf
	  ElseIf $isTRENDNET = 0 Then ; This is the BELKIN
		 $RF = $CMDLINE[3]
		 $belkinWirelessPage = "http://192.168.1.15:8080/wireless_id.stm"
		 _IENavigate($oIE, $belkinWirelessPage)
		 
		 ; login 
		 BlockInput(1); //block all input from keyboard and mouse		 
		 Send("^f")
		 Sleep(2000)
		 Send("Password")
		 Sleep(2000)
		 SEnd("{TAB 2}")
		 Sleep(2000)
		 Send("intel@1234")
		 Sleep(2000)
		 Send("{ENTER}")
		 Sleep(2000)
		 ;============

			
		 if $RF = 2.4 Then
			Send("^f")
			Sleep(2000)
			Send("Self Healing")
			Sleep(2000)
			Send("{TAB 5}")
			Sleep(2000)
			
			if $opt = 0 Then
			   Send("O")	
			ElseIf $opt = 1 Then
			   Send("O")
			   Sleep(2000)
			   Send("{DOWN 3}")
			EndIf
			   
			;check if 5Ghz is turn on and save the setting
			$ssid = "JF3.SW.Lab2.5GHz"			
			Send("^f")
			Sleep(2000)
			Send("{BS}") ; random char
			Sleep(2000)
			Send("{ESC}")
			Sleep(2000)
			Send("^f")
			Sleep(2000)
			Send("5Ghz")
			If _checkSSID($ssid) = 1 Then
			   Send("{TAB 14}")
			ElseIf _checkSSID($ssid) = 0 Then
			   Send("{TAB 13}")
			EndIf
			Sleep(2000)
			Send("{ENTER}")
			
		 ElseIf $RF = 5 Then
			Send("^f")
			Sleep(2000)
			Send("5Ghz")
			Sleep(2000)
			Send("{TAB 4}")
			Sleep(2000)
			
			if $opt = 0 Then
			   Send("O")
			   Sleep(2000)
			   Send("{TAB 9}")
			ElseIf $opt = 1 Then
			   Send("O")
			   Sleep(2000)
			   Send("{DOWN 3}")
			   Sleep(2000)
			   Send("{TAB 10}")
			EndIf
			   
			;save the setting
			Sleep(2000)
			Send("{ENTER}")
			; if the RF param is empty (not specified by user input) , turn both the RF off
		 ElseIf $RF = 0 Then
			; to be implemented
			;MsgBox(0, Default, "Switching both RF off (To be Implemented, script is exitting...)")
			;exit (0)
		 EndIf
			
		 Sleep(2000)
	
		 EndIf  
   EndIf
	  

   
ElseIf $interface = "LAN" Then
   ;pre-defined param:
   ;$opt = "on"
   
   ;getting the lan port number on the switch
   $toGet = "lanPort"
   $portNum = _getProperty($configFilePath , $identifier, $toGet)	  
   
   ;getting the switch IP address
   $toGet = "switchIP"
   $switchIP = _getProperty($configFilePath , $identifier, $toGet)	  
   ;$portNum = 3

   ;getting the switch password
   $toGet = "switchPw"
   $switchPw = _getProperty($configFilePath , $identifier, $toGet)	  
 
   ;getting the switch en_password
   $toGet = "switchEnPw"
   $switchEnPw = _getProperty($configFilePath , $identifier, $toGet)	  
   
   $killPutty = "C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe Stop-Process -processname putty"

   Sleep(2000)
   Run($killPutty, @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)

   Sleep(5000)

   $puttyWinTitle = $switchIP & " - " & "PuTTY"
   
   $putty_pid =  Run("C:\ISCT\AVE\putty.exe -telnet " & $switchIP)
   Sleep(5000)
   
   $puttyWin = _GetHwndFromPID ($putty_pid)

   If Not $puttyWin Then
	 _logErr ("Error: Failed getting Putty Window Handle")
   EndIf
   
   $mode = ""
   If $opt = "on" Then 
	  $mode = "no shut"
   ElseIf $opt = "off" Then
	  $mode = "shut"
   EndIf

   Sleep(1000)
   ControlSend($puttyWin, "", "", $switchPw  & @CR) ;entering password
   Sleep(1000)

   ControlSend($puttyWin, "", "", "en"  & @CR) ; entering En_Pw
   Sleep(1000)

   ControlSend($puttyWin, "", "", $switchEnPw  & @CR) ; entering En_Pw
   Sleep(2000)

   ControlSend($puttyWin, "", "", "config t" & @CR) ; entering config mode
   Sleep(2000)

   ;$portInterface = "fa0/" & $portNum
   ControlSend($puttyWin, "", "", "interface" & ' ' & "fa0/" & $portNum & @CR) ; get on interface
   Sleep(2000)

   ControlSend($puttyWin, "", "", $mode & @CR) ; switch ON / OFF
   Sleep(1000)

   ControlSend($puttyWin, "", "", "exit" & @CR) ; exit out of interface
   Sleep(3000)

   ControlSend($puttyWin, "", "", "exit" & @CR) ; exit out of config mode
   Sleep(3000)

   ControlSend($puttyWin, "", "", "wr" & @CR) ; write config
   Sleep(1000)

   ControlSend($puttyWin, "", "", "exit" & @CR) ; log off 
   Sleep(5000)
   
EndIf


;cleaning up and exit
sleep(6000)
BlockInput(0) ; enable user input
_killProc('iexplore.exe')
_logReturnStat ($ret)
Sleep (4000)
exit(0)

;======================================== needed routines ====================================


 Func _killProc($sPID)
    If IsString($sPID) Then $sPID = ProcessExists($sPID)
    If Not $sPID Then Return SetError(1, 0, 0)
    return Run(@ComSpec & " /c taskkill /F /PID " & $sPID & " /T", @SystemDir, @SW_HIDE)
 EndFunc
 
Func _printUsage()
	ConsoleWrite("!======================     AUTO-AP Script   ====================" & @LF)
	
	ConsoleWrite("Usage: Auto-AP.exe [file path] [SSID] [WLAN / LAN] [ON / OFF]" & @LF)
	ConsoleWrite("[file path]  :  full path to the iSCT.conf file" & @LF)
	ConsoleWrite("[SSID]       :  the identifier of the block in the iSCT.conf" & @LF)
	ConsoleWrite("[WLAN / LAN] :  interface to turn on/off" & @LF)
	ConsoleWrite("[ON / OFF]   :  turn ON or OFF"  & @LF)
	ConsoleWrite("--------------------" & @LF)
	ConsoleWrite("i.e : Auto-AP.exe C:\ISCT\AVE\iSCT.conf PCCGCase-Cisco5 LAN OFF "  & @LF)
	ConsoleWrite("Return: 1, on Error: exit code of 1 and the error message if the script execution encounters error: ==>  Error: ... " & @LF)
	ConsoleWrite("        2, if Success: exit code of 0" & @LF)
	ConsoleWrite("!================================================================" & @LF)
	Exit(0)
 EndFunc
 
 
Func _checkDDWRT ()
   Local $sSrc = _IEDocReadHTML($oIE)
   sleep(2000)
   Local $aMatch = StringRegExp($sSrc, '.*DD-WRT*', 0)
   If $aMatch = 1 Then
	  $hasDDWRT = True
   ElseIf $aMatch = 0 Then
	  $hasDDWRT = False
   EndIf  
EndFunc

;#include <constants.au3>
;return 1 if the SSID is on, 0 if the SSID is off
Func _checkSSID($SSID)
   Local $foo = Run("netsh wlan show networks", @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
   $result = ""
   While 1
	   $line = StdoutRead($foo)
	   If @error Then ExitLoop
	   $result &= $line
	Wend
   Return StringRegExp ( $result, $SSID)
  
EndFunc 

;check if the network has connection by pinging the IP
Func _hasNetwork($ip)
   Local $foo = Run("ping " & $ip , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
   $result = ""
   While 1
	   $line = StdoutRead($foo)
	   If @error Then ExitLoop
	   $result &= $line
	Wend
   Return StringRegExp ( $result, "TTL")
EndFunc

; parse the conf file and get a specific item of the identified subject 
Func _getProperty($configFilePath , $identifier, $toGet)
   
   Local $aRecords
   If Not _FileReadToArray($configFilePath, $aRecords) Then
	   _logErr ("Error reading config file: " & @error )
   EndIf

   Local $idIndex = 0

   For $x = 1 To $aRecords[0]
	  If StringRegExp ($aRecords[$x] , "\[" & $identifier & "\]", 0 )Then
		 $idIndex = $x
		 ExitLoop
	   EndIf
   Next
	
   If $idIndex = 0 Then _logErr ("Error: " & $identifier & " not Found")
	  
   Local $toGetIndex = 0
   For $x = $idIndex To $aRecords[0]
	  If StringInStr($aRecords[$x] , $toGet)Then
		 $toGetIndex= $x
		 ExitLoop
	   EndIf
	Next
	
   If $toGetIndex = 0 Then _logErr ("Error: " & $toGetIndex & " not found")
	  
   $line = $aRecords[$toGetIndex]
   $aSplit = StringSplit($line, "=")
   return $aSplit[2] ; return the item
EndFunc


func _RTRIM($sString, $sTrimChars=' ')

	$sTrimChars = StringReplace( $sTrimChars, "%%whs%%", " " & chr(9) & chr(11) & chr(12) & @CRLF )
	local $nCount, $nFoundChar
	local $aStringArray = StringSplit($sString, "")
	local $aCharsArray = StringSplit($sTrimChars, "")

	for $nCount = $aStringArray[0] to 1 step -1
		$nFoundChar = 0
		for $i = 1 to $aCharsArray[0]
			if $aCharsArray[$i] = $aStringArray[$nCount] then
				$nFoundChar = 1
			EndIf
		next
		if $nFoundChar = 0 then return StringTrimRight( $sString, ($aStringArray[0] - $nCount) )
	next
 endfunc
 
 ;Function for getting HWND from PID
Func _GetHwndFromPID($PID)
	$hWnd = 0
	$winlist = WinList()
	Do
		For $i = 1 To $winlist[0][0]
			If $winlist[$i][0] <> "" Then
				$iPID2 = WinGetProcess($winlist[$i][1])
				If $iPID2 = $PID Then
					$hWnd = $winlist[$i][1]
					ExitLoop
				EndIf
			EndIf
		Next
	Until $hWnd <> 0
	Return $hWnd
 EndFunc;==>_GetHwndFromPID
 
;output the error and exit
Func _logErr ($string)
   If $string <> "" Then 
	  ConsoleWrite($string)
	  Exit(1)
   EndIf

EndFunc

;output the error and exit
Func _logReturnStat ($string)
   If $string <> "" Then 
	  ConsoleWrite("[Auto-AP]-Return Status: " & $string & @LF )
   EndIf

EndFunc

Func _logRunningStat ($string)
   If $string <> "" Then 
	  ConsoleWrite("[Auto-AP]-Running Status: " & $string & @LF )
   EndIf

EndFunc

Func _cleanUp()
   
EndFunc