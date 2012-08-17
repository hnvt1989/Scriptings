#cs ---------------------------------------------------------------------------------------------------------------
#
#		INTEL CORPORATION PROPRIETARY INFORMATION
#
# 		This software is supplied under the terms of a license agreement or
# 		nondisclosure agreement with Intel Corporation and may not be copied
# 		or disclosed except in accordance with the terms of that agreement.
# 		Copyright (c) 2012 Intel Corporation. All Rights Reserved.
#
#		ISCT - Automation Validation Team
-----------------------------------------------------------------------------------------------------------
NAME
	  Auto-AP.Exe
	  
SYNOPSIS

	  Switch OFF/ON the Wifi/LAN connection 

SYNTAX

	  Auto-AP.exe 	<config-file-path> 	<SSID>		<interface>		<switch> 	[-s directory]
	  
	  <config-file-path>	: the path to the iSCT.conf file 
	  <SSID>				: the SSID 
	  <interface>			: (LAN/WiFi)
	  <switch> 				: ON or OFF
	  [-s directory]	: optional param, specify what directory to save the log file, if this option is omitted, no log file will be saved.  However, if the flag 
							  Auto_AP_Debug is set to 1 in the iSCT.conf file then the logging info will be saved at default directory C:\ISCT\ISCT-Log
							  
EXAMPLE
	  Auto-AP.exe 	C:\ISCT\AVE\iSCT.conf 	REMOTEWAKE6-2.4Ghz	 	WiFi	ON  -s C:\iSCT\ISCT-log
	  
	  Will switch ON the WlAN interface of the SSID REMOTEWAKE6-2.4Ghz and save the log at the location C:\iSCT\ISCT-log
	  
	  
-----------------------------------------------------------------------------------------------------------------
#ce -------------------------------------------------------------------------------------------------------------

#include <IE.au3>
#include <constants.au3>
#include <File.au3>



#Region Global Var Declaration
   Global $error = ""
   Global $ret = "Success"
   Global $configFilePath = "" ; iSCT.conf file path
   Global $interface = "" ; (LAN/WiFi)
   Global $opt = "" ; OFF / ON
   Global $logPath = "" ; path to store log file
   Global $timestamp = ""
   Global $logFileName = ""
   Global $loggingEnabled = 0
   Global $logFile = ""
   Global $oIE = _IECreate(); instance of Internet Explorer
   Global $isct_conf ; content of iSCT.conf file
   Global $hasDDWRT = -1
   Global $SSID = ""
   Global $ipAddress = ""
   	Global $plinkPath = "C:\ISCT\AVE\plink.exe"
   
   #cs
		DD-WRT info
   #ce
   Global $dd_wrt_RF_Name = ""
   Global $dd_wrt_userName = "root"
   Global $dd_wrt_password = ""
#EndRegion Global Var Declaration

_killPrevRunInstance() ;killing any prev running instance of Auto-AP.exe

#Region Parsing command line argument (and err catching), read the config file and also set up for saving debug log file
   If $CMDLINE[0] = 0 Then
	  _printUsage()
	  Exit(0)
   EndIf

   If $CMDLINE[0] = 4 Or $CMDLINE[0] = 6 Then
   Else
	   $error = "Error: Invalid number of arguments"
	  _logErr ($error)
   EndIf

   ;check if the config file exist, If error then log error, else set the path to param $configFilePath
   If Not FileExists ($CMDLINE[1]) Then
	  $error = "Error: File does not exist"
	  _logErr ($error)
   Else
	  $configFilePath = $CMDLINE[1]
		;read the iSCT.conf file into Global var $isct_conf
	   If Not _FileReadToArray($configFilePath, $isct_conf) Then
		   _logErr ("Error reading config file: " & @error )
	   EndIf
   EndIf

   ;set the param $SSID to SSID , error checking for identifier will start in the parsing process
   $SSID = $CMDLINE[2] ; [ xabcre]

   ;error checking on the interface (LAN/WiFi)
   If ($CMDLINE[3] = "LAN" Or $CMDLINE[3] = "WiFi" ) Then
	  $interface = $CMDLINE[3] ; LAN / WLAN
   Else
	  $error = "Error: Invalid interface ( LAN / WiFi)"
	  _logErr ($error)
   EndIf
	  
   ;error checking on the Switch Option (ON/OFF)
   If ($CMDLINE[4] = "OFF" Or $CMDLINE[4] = "ON" )  Then
	  $opt = $CMDLINE[4] ; OFF / ON
   Else
	  $error = "Error: Invalid option ( OFF / ON)"
	  _logErr ($error)
   EndIf

   ;if -s option is entered
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

   ;check if logging enabled is specified in the iSCT.conf
   $loggingEnabled  = _checkDebugEnabled($configFilePath)
   _logRunningStat ("Logging Enabled = " & $loggingEnabled)

   ;if -s flag not specified and the loggingEnabled is 1 (parsed from configuration file)
   If $loggingEnabled = 1 And $logFileName = "" Then
	  $logPath = "C:\ISCT\ISCT-Log" ; default path to store log file
	  ;log file name is : Auto_AP_timestamp
	  $timestamp = @HOUR & "_" & @MIN & "_" & @SEC
	  $logFileName = $logPath & "\ControlNetwork_" & $timestamp & ".txt"
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


   
#EndRegion Parsing command line argument (and err catching), also set up for saving debug log file
_logRunningStat ("Param initialization finished")
_logRunningStat ("SSID : " & $SSID)
ConsoleWrite("SSID : " & $SSID & @LF)
_logRunningStat ("Configuration file path: " & $configFilePath)
_logRunningStat ("Interface: " & $interface)
_logRunningStat ("Switch: " & $opt)
_logRunningStat ("Log file is being saved at: " & $logFileName)


#Region MAIN 
If $interface = "WiFi" Then
   _WiFi_Handler()
ElseIf $interface = "LAN" Then
   _LAN_Handler()
EndIf

_cleanUp() ;cleaning up and exit
#EndRegion MAIN

#Region ROUTINES (FUNCTIONS) DECLARATION

Func _WiFi_Handler()
   
   ;cleaning the IE cache, to prevent the IE pop up : "go to prev page"
   _logRunningStat ("Clearing the IE cache")
   Run("RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess " & 255) ; clear the cache
   _logRunningStat ("Sleeping for 20 seconds")
   sleep(20000)
   
   
   ; //****** Create a browser window and navigate to  login page
   ;//************************************************************
   
   ;getting the AP's IP address to nagvigate to the page, log the error and return if found error on parsing (missing info)
   $toGet = "AP_IP"
   $ipAddress = _getProperty($configFilePath ,$SSID, $toGet)
   If StringInStr( $ipAddress, "Error") Then
	  _logErr ($ipAddress)
   Endif
   ;create the string of http address
   $address = "http://" & $ipAddress
   _IENavigate($oIE, $address)
   _logRunningStat ("Navigating to URL address : " & $address)
   ConsoleWrite("Navigating to URL address : " & $address & @LF)
   _IELoadWait ($oIE)
   If @error <> 0 Then 
		 _logErr(@error)
   Endif  
   

   _checkDDWRT()
   ;MsgBox(0, Default, $hasDDWRT)
   
   ;================================== if this AP is DD WRT supported (CISCO AP) =================================
   If $hasDDWRT = True Then
		_logRunningStat ("This AP has DD-WRT interface")
		  
		; getting the RF_Name to ssh into router, return the Error if NOT FOUND
		$toGet = "RF_Name"
		Global $dd_wrt_RF_Name = _getProperty($configFilePath , $SSID, $toGet)
		If StringInStr( $dd_wrt_RF_Name, "Error") Then
			_logErr ($dd_wrt_RF_Name)
		Endif
	  
	  
		; getting the password to ssh into router return the Error if NOT FOUND
		$toGet = "AP_Password"
		Global $dd_wrt_password = _getProperty($configFilePath , "Site", $toGet)
		If StringInStr( $dd_wrt_password, "Error") Then
			_logErr ($dd_wrt_password)
		Endif
	  
		_logRunningStat ("Finished parsing AP's information from iSCT.conf")
		_logRunningStat ("DD-WRT RF_Name: " & $dd_wrt_RF_Name)
		_logRunningStat ("DD-WRT userName (Default): " & $dd_wrt_userName)
		_logRunningStat ("DD-WRT Password: " & $dd_wrt_password)

		_logRunningStat ("Check if the SSID is already " & $opt)
		Local $checkResult = _checkSSID($SSID , $opt)
		
		If $checkResult = 0 Then
			_logRunningStat ("The SSID " & $SSID & " is already " & $opt & ". Script is exitting....")
			_cleanUp()		
		EndIf
		
		Local $string2 = "%%whs%%"

		Local $plinkCommand = ""
		
		Local $switch = ""
		If $opt = "on" Then
			$switch = "up"
		ElseIf $opt = "off" Then
			$switch = "down"
		Endif
		
		$plinkCommand = $plinkPath & ' ' & _RTRIM($ipAddress, $string2) & ' ' & "-l" & ' ' &  _RTRIM($dd_wrt_userName, $string2) & ' ' & "-pw" & ' ' &  _RTRIM($dd_wrt_password, $string2) & ' ' & "ifconfig" & ' ' & _RTRIM($dd_wrt_RF_Name, $string2) & ' ' & $switch
		_logRunningStat ("Constructed plink command " & $plinkCommand)
		_logRunningStat ("Adding AP IP address to the putty cache.......... ")
		_addPuttyCache($ipAddress, $dd_wrt_userName, $dd_wrt_password)
		Sleep (2000)
	  _logRunningStat ("Executing this plink command" & $plinkCommand)
	  $process_id = Run($plinkCommand , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)

	  
	  If ($opt = "on" ) Then
		_logRunningStat ("Re-booting the AP.......................")
		$plinkCommand = $plinkPath & ' ' & _RTRIM($ipAddress, $string2) & ' ' & "-l" & ' ' &  _RTRIM($dd_wrt_userName, $string2) & ' ' & "-pw" & ' ' &  _RTRIM($dd_wrt_password, $string2) &  " reboot"
		$process_id_reboot = Run($plinkCommand , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
		_logRunningStat ("Sleeping for 30 seconds ")
		Sleep (90000)
	  EndIf
		Sleep(30000)
	  _logRunningStat ("Checking if the SSID is turned " & $opt)
	  $checkReturn = _checkSSID($SSID , $opt)
	  If $checkReturn = 1 Then
		 $ret = "Failed"
		 _logRunningStat ("Failed to turn " & $opt & " the wifi interface " & $dd_wrt_RF_Name & " of SSID " & $SSID )
	  EndIf
	  
   EndIf
   
   ;=================================== if this AP is not DD WRT supported============================

   If $hasDDWRT = False Then
	  

	  
	  _logRunningStat ("This AP does not have DD-WRT interface")
	  _logRunningStat ("Checking if this AP is Trendnet AP")
	  Local $sSrc = _IEDocReadHTML($oIE)
	  sleep(2000)
	  If @error = 3 Then 
		 _logErr("Invalid Data Type")
	  Endif

	  Dim $isTRENDNET = StringRegExp($sSrc, '.*TEW*', 0)

	  ;this is the TRENDNET AP
	  If $isTRENDNET  = 1 Then 
		 _logRunningStat  ("FOUND Trendnet AP")
		 Local $o_form = _IEGetObjByName ($oIE, "form1")
		 Local $o_login = _IEFormElementGetObjByName($o_form, "login_n") ; username
		 Local $o_password = _IEFormElementGetObjByName($o_form, "login_pass") ; password
		 
		 Local $toGet = "AP_AdminName"
		 ; getting  user name
		 Local $web_userName = _getProperty($configFilePath , "Site", $toGet)
		 
		 If StringInStr($web_userName, "Error") Then
			 _logErr ($web_userName)
		 Endif		 
		 ;getting web site password
		 $toGet = "AP_Password"
		 ; getting  user name
		 Local $web_password = _getProperty($configFilePath , "Site", $toGet)


		 If StringInStr($web_password, "Error") Then
			 _logErr ($web_password)
		 Endif
		 
		 _logRunningStat ("Finished parsing information from iSCT.conf")
		 _logRunningStat ("Username : " & $web_userName)
		 _logRunningStat ("Password : " & $web_password)
		 _logRunningStat ("Submitting these information to the webform")
		 
		 _IEFormElementSetValue($o_login, $web_userName)
		 _IEFormElementSetValue($o_password, $web_password)
		 
		 Local $oSubmit = _IEGetObjByName ($o_form, "login")
		 _IEAction ($oSubmit, "click")
		 _IELoadWait ($oIE)
		 
		 ;check if the entered username and password are incorrect
		 Local $sSrc = _IEDocReadHTML($oIE)
		 Local $isCorrectLogin = StringRegExp($sSrc, '.*User.Name.or.Password.incorrect*', 0)
		 
		 If $isCorrectLogin = 1 Then
			_logErr ("User name or password entered to the form is incorrect")
		 Endif
		 
		 Local $addressWireless = "http://" & $ipAddress & "/wireless_basic.asp"
		 
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
		 
		  ;_IELoadWait ($oIE)
		 $sleepTime = 30000
		 _logRunningStat ("Sleeping for " & $sleepTime & ". Waiting for the web to fully loaded")
		 Sleep ($sleepTime)
		 
		 _logRunningStat ("Checking if the SSID is turned " & $opt)
		 $checkReturn = _checkSSID($SSID, $opt)
		 If $checkReturn = 1 Then
			_logRunningStat ("SSID is still not shown in the netsh wlan show networks ")
			$ret = "Failed !"
		 EndIf	
	  EndIf

   EndIf
EndFunc


Func _LAN_Handler()
   ;pre-defined param:
   ;$opt = "on"
   
   ;getting the lan port number on the switch
	$toGet = "VLAN_Switch_Port"
	$portNum = _getProperty($configFilePath , $SSID, $toGet)	  
	If StringInStr($portNum, "Error") Then
	  _logErr ($portNum) 
	EndIf
	If StringInStr($portNum, "NA") Then
		_logReturnStat("VN Port number is NA in config file")
		_cleanUp()
	EndIf
	
   ;getting the switch IP address
	$toGet = "VLAN_Switch_IP"
	$switchIP = _getProperty($configFilePath , $SSID, $toGet)	  
	If StringInStr($switchIP, "Error") Then
	  _logErr ($switchIP) 
	EndIf

   ;getting the switch password
	$toGet = "VLAN_Switch_Password"
	$switchPw = _getProperty($configFilePath , "Site", $toGet)	  
 	If StringInStr($switchPw, "Error") Then
	  _logErr ($switchPw) 
	EndIf
	
   ;getting the switch en_password
	$toGet = "VLAN_Switch_2ndPassword"
	$switchEnPw = _getProperty($configFilePath , "Site", $toGet)	  
  	If StringInStr($switchEnPw, "Error") Then
	  _logErr ($switchEnPw) 
	EndIf  

   _logRunningStat ("FINISHED Parsing information from iSCT.conf")
   _logRunningStat ("VLAN_Switch_Port: " & $portNum )
   _logRunningStat ("VLAN_Switch_IP: " & $switchIP)
   _logRunningStat ("VLAN_Switch_Pw: " & $switchPw)
   _logRunningStat ("VLAN_Switch_2ndPw: " & $switchEnPw)
   
   
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
EndFunc

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
	Local $loop = 0
	For $i = 1 To 5 Step 1
		Local $sSrc = _IEDocReadHTML($oIE)
		sleep(2000)
		Local $errOnPage = StringRegExp($sSrc, '.*Internet Explorer cannot display the webpage*', 0)
		If $errOnPage  = 0 Then
			ExitLoop	
		EndIf
		$loop = $loop + 1
		_logRunningStat("[Checking DD-WRT] : Cannot go to the AP's website. Tried " & $loop & " times.")
		;nagvigate to this website again
		$address = "http://" & $ipAddress
		_IENavigate($oIE, $address)
		_logRunningStat ("Navigating to URL address : " & $address)
		ConsoleWrite("Navigating to URL address : " & $address & @LF)
		_IELoadWait ($oIE)
		If @error <> 0 Then 
			_logErr(@error)
		Endif	
	Next
	
	If $loop  >= 5 Then
		_logErr ("[Checking DD-WRT] : Cannot go to the AP's website. Tried (max)" & $loop & " times.")
		ConsoleWrite ("[Checking DD-WRT] : Cannot go to the AP's website. Tried (max)" & $loop & " times." & @LF)
		_logRunningStat("[Return Status] : Failed " & $loop & " times.")
	EndIf 
   
   Local $aMatch = StringRegExp($sSrc, '.*DD-WRT*', 0)
   
   If $aMatch = 1 Then
	  $hasDDWRT = True
   ElseIf $aMatch = 0 Then
	  $hasDDWRT = False
   EndIf  
EndFunc

;#include <constants.au3>
;return 1 if the SSID is on, 0 if the SSID is off
Func _checkSSID($SSID , $state)
	_logRunningStat (" _checkSSID: " )
	Local $check_result = -1
	If $hasDDWRT = True Then
		Local $string2 = "%%whs%%"
		Local $plinkCommand = ""
		$plinkCommand = $plinkPath & ' ' & _RTRIM($ipAddress, $string2) & ' ' & "-l" & ' ' &  _RTRIM($dd_wrt_userName, $string2) & ' ' & "-pw" & ' ' &  _RTRIM($dd_wrt_password, $string2) & ' ' & "ifconfig" & ' ' & _RTRIM($dd_wrt_RF_Name, $string2)
		_logRunningStat ("Constructed plink command " & $plinkCommand)
		_logRunningStat ("Adding AP IP address to the putty cache.......... ")
		_logRunningStat ("Adding putty cache .......... ")
		_addPuttyCache($ipAddress, $dd_wrt_userName, $dd_wrt_password)
		Sleep (5000)
		_logRunningStat ("Executing this plink command" & $plinkCommand)
		$process_id = Run($plinkCommand , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
		ProcessWaitClose($process_id)
		#cs
		_logRunningStat ("Exec powershell.exe .......... ")
		$powershell_pid = Run("powershell.exe", "", @SW_MAXIMIZE, $STDOUT_CHILD + $RUN_CREATE_NEW_CONSOLE + $STDERR_CHILD)
		Sleep(5000)
		_logRunningStat ("powershell.exe pid = " & $powershell_pid)
		$powershell_hwnd = _GetHwndFromPID($powershell_pid)
		_logRunningStat ("Sending this command to powershell.exe handle = " & $plinkCommand)
		ControlSend($powershell_hwnd, "", "", $plinkCommand & @CR)
		Sleep(5000)
		ControlSend($powershell_hwnd, "", "", "exit " & @CR)
		;Run("powershell.exe Stop-Process -id " & $powershell_pid, @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
		#ce
		Local $resultStr  = ""
		$resultStr  &= "Result from Plink: " & @LF
		$resultStr &= StdoutRead($process_id)
				
		_logRunningStat ($resultStr)
		
		If $state = "on" Then
			If StringRegExp ( $resultStr, "UP BROADCAST RUNNING MULTICAST") Then
				return 0 ; success
			Else
				return 1; failure
			EndIf
		ElseIf $state = "off" Then
			If StringRegExp ( $resultStr, "BROADCAST MULTICAST") Then
				return 0 ; success
			Else
				return 1; failure
			EndIf			
		EndIf
		
   ElseIf $hasDDWRT = False Then
		$check_result = 0
   EndIf
   
   
   Return $check_result
   
EndFunc

;check if the LAN is off or on
Func _checkLAN($ipAddress, $switch)
   $cmd_pid = Run("cmd.exe", "", @SW_MAXIMIZE, $STDOUT_CHILD + $RUN_CREATE_NEW_CONSOLE + $STDERR_CHILD)
   Sleep(5000)
   $cmd_hwnd = _GetHwndFromPID($cmd_pid)
   ControlSend($cmd_hwnd, "", "", "ping " & $ipAddress & @CR)
   Sleep(5000)
   $kill_console = "powershell.exe Stop-Process -id " & $cmd_pid
   Run($kill_console, @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD) 
   
   ProcessWaitClose($cmd_pid)
   $result = StdoutRead($cmd_pid)
   ;_logRunningStat ("Result : " & $result)
   Local $toRet = StringRegExp ( $result, "TTL")
   If $switch = 1 And $toRet = 1 Then
	  return 1
   ElseIf $switch = 0 And $toRet = 0 Then
	  return 1
   EndIf
   return 0
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

   $aSplit = "";
   For $x = 1 To $isct_conf[0]
	  If StringRegExp ($isct_conf[$x] , "Auto_AP_Debug", 0 )Then
		 $aSplit = StringSplit($isct_conf[$x], "=")
		 ExitLoop
	  EndIf
   Next
	
   return $aSplit[2]
EndFunc


; parse the conf file and get a specific item of the identified subject 
Func _getProperty($configFilePath , $SSID, $toGet)
  
   Local $idIndex = 0

   For $x = 1 To $isct_conf[0]
	  If StringRegExp ($isct_conf[$x] , "\[" & $SSID & "\]", 0 )Then
		 $idIndex = $x
		 ExitLoop
	   EndIf
   Next
	
   If $idIndex = 0 Then _logErr ("Error: " & $SSID & " not Found")
	  
   Local $toGetIndex = 0
   For $x = $idIndex + 1 To $isct_conf[0]
	  If StringRegExp ($isct_conf[$x] , "\[.*.\]", 0 )Then
		 ExitLoop
	  EndIf
	  If StringRegExp ($isct_conf[$x] , $toGet & "=.*.", 0 )Then
		 $toGetIndex= $x
		 ExitLoop
	  EndIf
	  
	  
   Next
	
   If $toGetIndex = 0 Then _logErr ("Error: " & $toGet & " of " & $SSID &   " not found")
	  
   $line = $isct_conf[$toGetIndex]
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
	  ;_killProc('iexplore.exe')
	  If IsDeclared("oIE") Then
		 _IEQuit($oIE)
		 _logRunningStat ("[Cleaning up] Clearing the IE cache")
		 Run("RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess " & 255) ; clear the cache
	  EndIf
	  sleep(6000)
	  BlockInput(0) ; enable user input
	  Sleep (4000)
	  $ret = "Error "
	  _logReturnStat ($ret & " : " & $string)
	  _logRunningStat ($ret & " : " & $string)
	  exit(0)
   EndIf
EndFunc

;output the return stat
Func _logReturnStat ($string)
   If $string <> "" Then 
	  ConsoleWrite("[Auto-AP]-Return Status: " & $string & @LF )
   EndIf
EndFunc

Func _logRunningStat ($string)
   If $string <> "" And $loggingEnabled = 1 Then 
	  FileWrite ($logFile, "[ " & @Hour & ":" & @Min & ":" & @Sec & " ] " & "[ControlNetwork <PID:" & @AutoItPID & ">]-Running Status: " & $string & @CRLF )
   ElseIf $string <> "" And $loggingEnabled = 0 Then
	  ConsoleWrite ("[ControlNetwork]-Running Status: " & $string & @LF )
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
   
   If IsDeclared("oIE") Then
	  _IEQuit($oIE)
	  ;_killProc('iexplore.exe')
	  _logRunningStat ("[Cleaning up] Clearing the IE cache")
	  Run("RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess " & 255) ; clear the cache
   EndIf
   ;_killProc('iexplore.exe')
   sleep(6000)
   BlockInput(0) ; enable user input
   _logReturnStat ($ret)
   _logRunningStat ("Return Status: " & $ret)
   Sleep (4000)
   FileClose ($logFile)
   exit(0)
EndFunc

#EndRegion ROUTINES (FUNCTIONS) DECLARATION