;ShellExecute("http://192.168.1.17:8080") 

#include <IE.au3>
#include <constants.au3>
#include <File.au3>


; $CMD[0] is the number of argument

; [Path of iSCT.conf] [SSID] [WLAN / LAN] [ ON/ OFF] 
;"C:\Users\huynguyx\isct.conf"

;param initialization
$error = ""
$ret = "Success"
$configFilePath = ""
$identifier = "" ; [ xabcre]
$interface = "" ; LAN / WLAN
$opt = "" ; OFF / ON
$logPath = "" ; path to store log file
$timestamp = ""
$logFileName = ""
$loggingEnabled = 0
Global $logFile = ""

_killPrevRunInstance()

If $CMDLINE[0] = 0 Then
   _printUsage()
   Exit(0)
EndIf

If $CMDLINE[0] = 4 Or $CMDLINE[0] = 6 Then
Else
   	$error = "Error: Invalid number of arguments"
   _logErr ($error)
EndIf

If Not FileExists ($CMDLINE[1]) Then
   $error = "Error: File does not exist"
   _logErr ($error)
Else
   $configFilePath = $CMDLINE[1]
EndIf

;error checking for identifier will start in the parsing process
$identifier = $CMDLINE[2] ; [ xabcre]

If ($CMDLINE[3] = "LAN" Or $CMDLINE[3] = "WiFi" ) Then
   $interface = $CMDLINE[3] ; LAN / WLAN
Else
   $error = "Error: Invalid interface ( LAN / WiFi)"
   _logErr ($error)
EndIf
   
If ($CMDLINE[4] = "OFF" Or $CMDLINE[4] = "ON" )  Then
   $opt = $CMDLINE[4] ; OFF / ON
Else
   $error = "Error: Invalid option ( OFF / ON)"
   _logErr ($error)
EndIf

;check if debug logging is enabled

;if logFile is specified
If $CMDLINE[0] = 6  Then
   
   If $CMDLINE[5] = "-s" Or $CMDLINE[5] = "-S" Then
   Else
	  $error = "Error: Invalid param : " & $CMDLINE[5]
	  _logErr ($error)
   EndIf
   
   $logPath = ""
   If $loggingEnabled = 1 Then
	  $logPath = "C:\ISCT\ISCT-log"
   EndIf
   
   If Not FileExists ($CMDLINE[6]) and $logPath = "" Then
	  If Not FileExists($logPath) Then
		 $error = "Error: Directory to store log file not exist"
	  _logErr ($error)
	  EndIf
   EndIf
   
   $logPath = $CMDLINE[6] ; path to store log file
   ;log file name is : Auto_AP_timestamp
   $timestamp = @HOUR & "_" & @MIN & "_" & @SEC
   $logFileName = $logPath & "\Auto_AP_" & $timestamp & ".txt"
   ConsoleWrite("[Auto-AP] - Log file stored at " & $logFileName & @LF )
   $loggingEnabled = 1
 
   ;open file to write
   ;create directory structure if it doesn't exist, and open file to write
   $logFile = FileOpen($logFileName, 10) ; which is similar to 2 + 8 (erase + create dir)

   If $logFile = -1 Then
	  $error = "Error: Cannot open file to write"
	   _logErr ($error)
	   Exit
   EndIf
EndIf

$loggingEnabled  = _checkDebugEnabled($configFilePath)
_logRunningStat ("Logging Enabled = " & $loggingEnabled)

;if -s flag not specified and the loggingEnabled is 1 (parsed from configuration file)
If $loggingEnabled = 1 And $logFileName = "" Then
   $logPath = "C:\ISCT\ISCT-Log" ; path to store log file
   ;log file name is : Auto_AP_timestamp
   $timestamp = @HOUR & "_" & @MIN & "_" & @SEC
   $logFileName = $logPath & "\Auto_AP_" & $timestamp & ".txt"
   ;ConsoleWrite("[Auto-AP] - -s Flag not specified, but Auto_AP_Debug is set to 1, in iSCT.conf "& @LF )
   ;ConsoleWrite("[Auto-AP] - Log file stored at " & $logFileName & @LF )
   $loggingEnabled = 1
 
   ;open file to write
   ;create directory structure if it doesn't exist, and open file to write
   $logFile = FileOpen($logFileName, 10) ; which is similar to 2 + 8 (erase + create dir)

   If $logFile = -1 Then
	  $error = "Error: Cannot open file to write"
	   _logErr ($error)
	   Exit
   EndIf  
EndIf
   
_logRunningStat ("Param initialization finished")
_logRunningStat ("Configuration file path: " & $configFilePath)
_logRunningStat ("Interface: " & $interface)
_logRunningStat ("Switch: " & $opt)
_logRunningStat ("Log file is being saved at: " & $logFileName)

If $interface = "WiFi" Then
   ;Return "Not Implemented"
   
   _killProc('iexplore.exe')
   _logRunningStat ("Clearing the IE cache")
   Run("RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess " & 255) ; clear the cache
   _logRunningStat ("Sleeping for 20 seconds")
   sleep(20000)
   ; Create a browser window and navigate to  login page

   $toGet = "AP_IP"

   ; getting the IpAddress, return Error if NOT FOUND
   $ipAddress = _getProperty($configFilePath ,$identifier, $toGet)

   If StringInStr( $ipAddress, "Error") Then
	  _logErr ($ipAddress)
   Endif



   $address = "http://" & $ipAddress
   ;$oIE = _IECreate($address, 0,0,1,1)
   $oIE = _IECreate()
   _IENavigate($oIE, $address)
   _logRunningStat ("Navigating to URL address : " & $address)
   _IELoadWait ($oIE)
   
   If @error Then MsgBox(16, "Failure", "blah.")
   Send("^f") ; close find window
   Send("{BS}")
   Send("{ESC}")

   $hasDDWRT = 1
   _checkDDWRT()
   ;MsgBox(0, Default, $hasDDWRT)
   
   ;================================== if this AP is DD WRT supported (CISCO AP) =================================
   If $hasDDWRT = True Then
	  _logRunningStat ("This AP has DD-WRT interface")
	  _logRunningStat ("Killing any running IE instances")
	  _killProc('iexplore.exe')
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
		 _logErr ($RF_Name)
	  Endif
	  
	  ; getting the Username, return the Error if NOT FOUND
	  $toGet = "Username"
	  $userName = _getProperty($configFilePath , $identifier, $toGet)
	  If StringInStr( $userName, "Error") Then
		  _logErr ($userName)
	  Endif
	  
	  ; getting the password, return the Error if NOT FOUND
	  $toGet = "Password"
	  $passWord = _getProperty($configFilePath , $identifier, $toGet)
	  If StringInStr( $passWord, "Error") Then
		 _logErr ($passWord)
	  Endif
	  
	  _logRunningStat ("Finished parsing AP's information from iSCT.conf")
	  _logRunningStat ("RF_Name: " & $RF_Name)
	  _logRunningStat ("userName: " & $userName)
	  _logRunningStat ("Password: " & $passWord)

	  $string2 = "%%whs%%"

	  $plinkCommand = $plinkPath & ' ' & _RTRIM($ipAddress, $string2) & ' ' & "-l" & ' ' &  _RTRIM($userName, $string2) & ' ' & "-pw" & ' ' &  _RTRIM($passWord, $string2) & ' ' & "ifconfig" & ' ' & _RTRIM($RF_Name, $string2) & ' ' & $switch
	  _logRunningStat ("Constructed plink command " & $plinkCommand)
	  _logRunningStat ("Adding AP IP address to the putty cache.......... ")
	  _addPuttyCache($ipAddress, $userName, $passWord)
	  ;_addPuttyCache(_RTRIM($ipAddress, $string2), _RTRIM($userName, $string2), _RTRIM($passWord, $string2))
	  Sleep (2000)
	  _logRunningStat ("Executing this plink command")
	  $process_id = Run($plinkCommand , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
	  ;MsgBox(0, Default, $plinkCommand )
	  ;MsgBox(0, Default, $plinkPath & ' ' & $plinkCommand  )

	  _logRunningStat ("Re-booting the AP.......................")
	  If ($opt = "on" ) Then
		 $plinkCommand = $plinkPath & ' ' & _RTRIM($ipAddress, $string2) & ' ' & "-l" & ' ' &  _RTRIM($userName, $string2) & ' ' & "-pw" & ' ' &  _RTRIM($passWord, $string2) & ' ' & "reboot"
		 $process_id_reboot = Run($plinkCommand , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
		 _logRunningStat ("Sleeping for 30 seconds ")
		 Sleep (30000)
	  EndIf

	  $loop = 1

	  _logRunningStat ("Checking if the SSID is " & $opt)
	  For $i = 1 To 20 Step 1
		 $isOnNetwork = _checkSSID($identifier)
		 If ($opt ="ON") And($isOnNetwork = 1) Then
			ExitLoop
		 EndIf
		 If ($opt ="OFF") And($isOnNetwork = 0) Then
			ExitLoop
		 EndIf
		 _logRunningStat  ("Verifying if " & $interface & " of " & $identifier & " is turned " & $opt &". Sleeping for 10 seconds. Loop = " & $loop)
		 $loop = $loop + 1
		 Sleep(10000)
	  Next	  
	  
	  _logRunningStat  ("Verifying if " & $interface & " of " & $identifier & " is turned " & $opt & ". Loop = " & $loop)
      If ($loop >= 20) Then	
		 $ret = "Failed !"
	  EndIf
   EndIf
   
   ;=================================== if this AP is not DD WRT supported============================

   If $hasDDWRT = False Then
	  _logRunningStat ("This AP does not have DD-WRT interface")
	  _logRunningStat ("Checking if this AP is Trendnet AP")
	  Local $sSrc = _IEDocReadHTML($oIE)
	  sleep(2000)

	  Dim $isTRENDNET = StringRegExp($sSrc, '.*TEW*', 0)
	  ;Dim $isBELKIN = StringRegExp($sSrc, '.*TEW*', 0)

	  
	  If $isTRENDNET  = 1 Then ;this is the TRENDNET AP
		 _logRunningStat ("FOUND Trendnet AP")
		 $o_form = _IEGetObjByName ($oIE, "form1")
		 $o_login = _IEFormElementGetObjByName($o_form, "login_n") ; username
		 $o_password = _IEFormElementGetObjByName($o_form, "login_pass") ; password
		 
		 $toGet = "Username"
		 ; getting  user name
		 $web_userName = _getProperty($configFilePath ,$identifier, $toGet)
		 
		 If StringInStr($web_userName, "Error") Then
			 _logErr ($web_userName)
		 Endif		 
		 ;getting web site password
		 $toGet = "Password"
		 ; getting  user name
		 $web_password = _getProperty($configFilePath ,$identifier, $toGet)


		 If StringInStr($web_password, "Error") Then
			 _logErr ($web_password)
		 Endif
		 
		 _logRunningStat ("Finished parsing information from iSCT.conf")
		 _logRunningStat ("Username : " & $web_userName)
		 _logRunningStat ("Password : " & $web_password)
		 _logRunningStat ("Submitting these information to the webform")
		 
		 _IEFormElementSetValue($o_login, $web_userName)
		 _IEFormElementSetValue($o_password, $web_password)
		 
		 $oSubmit = _IEGetObjByName ($o_form, "login")
		 _IEAction ($oSubmit, "click")
		 _IELoadWait ($oIE)
		 
		 ;check if the entered username and password are incorrect
		 Local $sSrc = _IEDocReadHTML($oIE)
		 sleep(2000)

		 Dim $isCorrectLogin = StringRegExp($sSrc, '.*User.Name.or.Password.incorrect*', 0)
		 
		 If $isCorrectLogin = 1 Then
			_logErr ("User name or password entered to the form is incorrect")
		 Endif
		 
		 $addressWireless = "http://" & $ipAddress & "/wireless_basic.asp"
		 
		 _logRunningStat ("Navigating to this URL address : " & $addressWireless)		 
		 _IENavigate($oIE, $addressWireless)
		 _IELoadWait ($oIE)
		 
		 _logRunningStat ("Switching WIRELESS to : " & $opt)
		 If $opt = "OFF" Then
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
		 
		 $sleepTime = 30000
		 _logRunningStat ("Sleeping for " & $sleepTime & ". Waiting for the web to fully loaded")
		 Sleep ($sleepTime)
		 
		 _logRunningStat ("Checking if the SSID is turned " & $opt)
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
			   
	  ElseIf $isTRENDNET = 0 Then ; This is the BELKIN
		 logRunningStat ("FOUND BELKIN AP ???????????????????????????????????????????????")
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
   
   _logRunningStat ("FINISHED Parsing information from iSCT.conf")
   _logRunningStat ("lanPort: " & $portNum )
   _logRunningStat ("switchIP: " & $switchIP)
   _logRunningStat ("switchPw: " & $switchPw)
   _logRunningStat ("switchEnPw: " & $switchEnPw)
   
   
   $killPutty = "C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe Stop-Process -processname putty"

   Sleep(2000)
   _logRunningStat ("Killing any putty running process with this commmand: " & $killPutty )
   Run($killPutty, @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)

   Sleep(5000)

   $puttyWinTitle = $switchIP & " - " & "PuTTY"
   
   _logRunningStat ("Telnet-ing into the switch ")
   _logRunningStat ("Adding switch IP into the putty cache .....")
   $putty_pid =  Run("C:\ISCT\AVE\putty.exe -telnet " & $switchIP)
   _logRunningStat ("Returned Putty PID: " & $putty_pid  )
   _logRunningStat ("Sleeping for 5 seconds")
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

   _logRunningStat ("Switching LAN Port " & $opt  )
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
   
   _logRunningStat ("Finished switching LAN port " & $opt )
EndIf


_cleanUp()
;cleaning up and exit


;======================================== needed routines ====================================


 Func _killProc($sPID)
    If IsString($sPID) Then $sPID = ProcessExists($sPID)
    If Not $sPID Then Return SetError(1, 0, 0)
    return Run(@ComSpec & " /c taskkill /F /PID " & $sPID & " /T", @SystemDir, @SW_HIDE)
 EndFunc
 
Func _printUsage()
	ConsoleWrite("!======================     AUTO-AP Script   ====================" & @LF)
	
	ConsoleWrite("Usage: Auto-AP.exe <file path> <SSID> <WLAN / LAN> <ON / OFF> <-s <dir path to log file>>" & @LF)
	ConsoleWrite("[file path]  :  full path to the iSCT.conf file" & @LF)
	ConsoleWrite("[SSID]       :  the identifier of the block in the iSCT.conf" & @LF)
	ConsoleWrite("[WLAN / LAN] :  interface to turn on/off" & @LF)
	ConsoleWrite("[ON / OFF]   :  turn ON or OFF"  & @LF)
	ConsoleWrite("-s <path to directory for log file> : if this option specified, script will log to this  directory instead of stdout"  & @LF)
	ConsoleWrite("--------------------------------------------------------------------" & @LF)
	ConsoleWrite("i.e : Auto-AP.exe C:\ISCT\AVE\iSCT.conf PCCGCase-Cisco5 LAN OFF -s C:\ISCT\ISCT-log"  & @LF)
	ConsoleWrite("Return: 1, on Error: print out error message if the script execution encounters error: ==>  Error: ... " & @LF)
	ConsoleWrite("        2, if Success: print Return Status SUCCESS" & @LF)
	ConsoleWrite("!================================================================" & @LF)
	Exit(0)
 EndFunc
 
 ; check if this AP has DD-WRT
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

;check in the configuration file if DebugEnabled is specified
Func _checkDebugEnabled($configFilePath)
   Local $aRecords
   If Not _FileReadToArray($configFilePath, $aRecords) Then
	   _logErr ("Error reading config file: " & @error )
   EndIf
	
   $aSplit = "";
   For $x = 1 To $aRecords[0]
	  If StringRegExp ($aRecords[$x] , "Auto_AP_Debug", 0 )Then
		 $aSplit = StringSplit($aRecords[$x], "=")
		 ExitLoop
	  EndIf
   Next
	
   return $aSplit[2]
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
   For $x = $idIndex + 1 To $aRecords[0]
	  If StringRegExp ($aRecords[$x] , "\[.*.\]", 0 )Then
		 ExitLoop
	  EndIf
	  If StringRegExp ($aRecords[$x] , $toGet & "=.*.", 0 )Then
		 $toGetIndex= $x
		 ExitLoop
	  EndIf
	  
	  
   Next
	
   If $toGetIndex = 0 Then _logErr ("Error: " & $toGet & " of " & $identifier &   " not found")
	  
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
	  _logRunningStat ("Killing any running IE instances")
	  _killProc('iexplore.exe')
	  sleep(6000)
	  BlockInput(0) ; enable user input
	  _logRunningStat ("[Cleaning up] Clearing the IE cache")
	  Run("RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess " & 255) ; clear the cache
	  Sleep (4000)
	  If ($logFileName  <> "") Then
		 FileClose ($logFile)
	  EndIf

	  $ret = "Failed"
	  _logReturnStat ($ret & " - Failed Reason : " & $string)
	  _logRunningStat ($ret & " - Failed Reason : " & $string)
	  exit(0)
   EndIf
EndFunc

;output the error and exit
Func _logReturnStat ($string)
   If $string <> "" Then 
	  ConsoleWrite("[Auto-AP]-Return Status: " & $string & @LF )
   EndIf

EndFunc

Func _logRunningStat ($string)
   If $string <> "" And $loggingEnabled = 1 Then 
	  FileWrite ($logFile, "[ " & @Hour & ":" & @Min & ":" & @Sec & " ] " & "[Auto-AP <PID:" & @AutoItPID & ">]-Running Status: " & $string & @CRLF )
   ElseIf $string <> "" And $loggingEnabled = 0 Then
	  ConsoleWrite ("[Auto-AP]-Running Status: " & $string & @LF )
   EndIf

EndFunc


;killing previous unstopped Auto-AP
Func _killPrevRunInstance()
   ; List just notepad.exe processes
   $list = ProcessList("Auto-AP.exe")
   For $i = 1 To $list[0][0]
	   $pid = $list[$i][1]
	   If $pid <> @AutoItPID Then
		  $killPrev = "C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe Stop-Process -id " & $pid
		  ConsoleWrite ("Killing Auto-AP with pid " & $pid & @LF )
		  Run($killPrev , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)		  
	   EndIf
   Next
EndFunc

;adding the ip address to the putty cache
Func _addPuttyCache($ipAdress, $id, $pw)
   $plinkPath = "C:\ISCT\AVE\plink.exe"
   $cmd = "echo y | " & $plinkPath & " " & $ipAdress & " -l " & $id & " -pw " & $pw
   RunWait(@ComSpec & " /C " & $cmd, "", @SW_HIDE);   
EndFunc

Func _cleanUp()
   _logRunningStat ("Killing any running IE instances")
   _killProc('iexplore.exe')
   sleep(6000)
   BlockInput(0) ; enable user input
   _logReturnStat ($ret)
   _logRunningStat ("Return Status: " & $ret)
   _logRunningStat ("[Cleaning up] Clearing the IE cache")
   Run("RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess " & 255) ; clear the cache
   Sleep (4000)
   FileClose ($logFile)
   exit(0)
EndFunc