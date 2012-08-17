Global $AutoItDebugger_Paused = 0
Global $AutoItDebugger_Quit = 0
Global $AutoItDebugger_Error
Global $AutoItDebugger_Extended
Global $AutoItDebuggerCommandWindowName = ""
Global $AutoItDebuggerCommandWindow
Global $AutoItDebuggerCommandWindowListbox
OnAutoItExitRegister("AutoIt_Debugger_OnAutoItExit")
AutoIt_Debugger_CreateMessageWindow()
$TempOriginalFileBeingDebuggedFileName = "Auto-AP.au3"
$TempOriginalFileBeingDebuggedFileFolder = "C:\Development\ISCT-Scripts"
$TempOriginalFileBeingDebuggedFilePath = "C:\Development\ISCT-Scripts\Auto-AP.au3"
AutoIt_Debugger_LoadFile("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3")
AutoIt_Debugger_DebugFile(@ScriptFullPath)
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


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 39, False))
#Include "C:\Program Files (x86)\AutoIt3\Include\IE.au3"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 39, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 40, False))
#Include "C:\Program Files (x86)\AutoIt3\Include\constants.au3"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 40, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 41, False))
#Include "C:\Program Files (x86)\AutoIt3\Include\File.au3"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 41, False, @error, @extended))




SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 45, False))
#Region Global Var Declaration
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 45, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 46, False))
   Global $error = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 46, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 47, False))
   Global $ret = "Success"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 47, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ret")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ret", $ret))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 48, False))
   Global $configFilePath = "" ; iSCT.conf file path
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 48, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 49, False))
   Global $interface = "" ; (LAN/WiFi)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 49, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("interface")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$interface", $interface))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 50, False))
   Global $opt = "" ; OFF / ON
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 50, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 51, False))
   Global $logPath = "" ; path to store log file
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 51, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logPath", $logPath))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 52, False))
   Global $timestamp = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 52, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("timestamp")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$timestamp", $timestamp))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 53, False))
   Global $logFileName = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 53, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logFileName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFileName", $logFileName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 54, False))
   Global $loggingEnabled = 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 54, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loggingEnabled")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loggingEnabled", $loggingEnabled))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 55, False))
   Global $logFile = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 55, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logFile")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFile", $logFile))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 56, False))
   Global $oIE = _IECreate(); instance of Internet Explorer
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 56, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 57, False))
   Global $isct_conf ; content of iSCT.conf file
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 57, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("isct_conf")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isct_conf", $isct_conf))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 58, False))
   Global $hasDDWRT = -1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 58, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hasDDWRT")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hasDDWRT", $hasDDWRT))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 59, False))
   Global $SSID = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 59, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 60, False))
   Global $ipAddress = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 60, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 61, False))
   	Global $plinkPath = "C:\ISCT\AVE\plink.exe"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 61, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("plinkPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkPath", $plinkPath))
   
   #cs
		DD-WRT info
   #ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 66, False))
   Global $dd_wrt_RF_Name = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 66, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("dd_wrt_RF_Name")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_RF_Name", $dd_wrt_RF_Name))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 67, False))
   Global $dd_wrt_userName = "root"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 67, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("dd_wrt_userName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_userName", $dd_wrt_userName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 68, False))
   Global $dd_wrt_password = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 68, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("dd_wrt_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_password", $dd_wrt_password))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 69, False))
#EndRegion Global Var Declaration
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 69, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 71, False))
_killPrevRunInstance() ;killing any prev running instance of Auto-AP.exe
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 71, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 73, False))
#Region Parsing command line argument (and err catching), read the config file and also set up for saving debug log file
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 73, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 74, False))
   If $CMDLINE[0] = 0 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 74, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 75, False))
	  _printUsage()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 75, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 76, False))
	  Exit(0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 76, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 77, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 77, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 79, False))
   If $CMDLINE[0] = 4 Or $CMDLINE[0] = 6 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 79, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 80, False))
   Else
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 80, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 81, False))
	   $error = "Error: Invalid number of arguments"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 81, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 82, False))
	  _logErr ($error)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 82, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 83, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 83, False, @error, @extended))

   ;check if the config file exist, If error then log error, else set the path to param $configFilePath

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 86, False))
   If Not FileExists ($CMDLINE[1]) Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 86, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 87, False))
	  $error = "Error: File does not exist"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 87, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 88, False))
	  _logErr ($error)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 88, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 89, False))
   Else
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 89, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 90, False))
	  $configFilePath = $CMDLINE[1]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 90, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))
		;read the iSCT.conf file into Global var $isct_conf

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 92, False))
	   If Not _FileReadToArray($configFilePath, $isct_conf) Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 92, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))
If SetError(@error, @extended, IsDeclared("isct_conf")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isct_conf", $isct_conf))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 93, False))
		   _logErr ("Error reading config file: " & @error )
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 93, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 94, False))
	   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 94, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 95, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 95, False, @error, @extended))

   ;set the param $SSID to SSID , error checking for identifier will start in the parsing process

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 98, False))
   $SSID = $CMDLINE[2] ; [ xabcre]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 98, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))

   ;error checking on the interface (LAN/WiFi)

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 101, False))
   If ($CMDLINE[3] = "LAN" Or $CMDLINE[3] = "WiFi" ) Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 101, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 102, False))
	  $interface = $CMDLINE[3] ; LAN / WLAN
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 102, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("interface")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$interface", $interface))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 103, False))
   Else
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 103, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 104, False))
	  $error = "Error: Invalid interface ( LAN / WiFi)"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 104, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 105, False))
	  _logErr ($error)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 105, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 106, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 106, False, @error, @extended))
	  
   ;error checking on the Switch Option (ON/OFF)

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 109, False))
   If ($CMDLINE[4] = "OFF" Or $CMDLINE[4] = "ON" )  Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 109, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 110, False))
	  $opt = $CMDLINE[4] ; OFF / ON
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 110, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 111, False))
   Else
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 111, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 112, False))
	  $error = "Error: Invalid option ( OFF / ON)"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 112, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 113, False))
	  _logErr ($error)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 113, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 114, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 114, False, @error, @extended))

   ;if -s option is entered

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 117, False))
   If $CMDLINE[0] = 6  Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 117, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))
	  

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 119, False))
	  If $CMDLINE[5] = "-s" Or $CMDLINE[5] = "-S" Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 119, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 120, False))
	  Else
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 120, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 121, False))
		 $error = "Error: Invalid param : " & $CMDLINE[5]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 121, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 122, False))
		 _logErr ($error)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 122, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 123, False))
	  EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 123, False, @error, @extended))
	  

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 125, False))
	  $logPath = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 125, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logPath", $logPath))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 126, False))
	  If $loggingEnabled = 1 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 126, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loggingEnabled")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loggingEnabled", $loggingEnabled))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 127, False))
		 $logPath = "C:\ISCT\ISCT-log"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 127, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logPath", $logPath))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 128, False))
	  EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 128, False, @error, @extended))
	  

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 130, False))
	  If Not FileExists ($CMDLINE[6]) and $logPath = "" Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 130, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))
If SetError(@error, @extended, IsDeclared("logPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logPath", $logPath))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 131, False))
		 If Not FileExists($logPath) Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 131, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logPath", $logPath))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 132, False))
			$error = "Error: Directory to store log file not exist"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 132, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 133, False))
		 _logErr ($error)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 133, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 134, False))
		 EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 134, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 135, False))
	  EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 135, False, @error, @extended))
	  

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 137, False))
	  $logPath = $CMDLINE[6] ; path to store log file
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 137, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logPath", $logPath))
If SetError(@error, @extended, IsDeclared("CMDLINE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$CMDLINE", $CMDLINE))
	  ;log file name is : Auto_AP_timestamp

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 139, False))
	  $timestamp = @HOUR & "_" & @MIN & "_" & @SEC
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 139, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("timestamp")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$timestamp", $timestamp))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 140, False))
	  $logFileName = $logPath & "\Auto_AP_" & $timestamp & ".txt"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 140, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logFileName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFileName", $logFileName))
If SetError(@error, @extended, IsDeclared("logPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logPath", $logPath))
If SetError(@error, @extended, IsDeclared("timestamp")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$timestamp", $timestamp))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 141, False))
	  ConsoleWrite("[Auto-AP] - Log file stored at " & $logFileName & @LF )
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("[Auto-AP] - Log file stored at " & $logFileName & @LF ))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 141, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logFileName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFileName", $logFileName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 142, False))
	  $loggingEnabled = 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 142, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loggingEnabled")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loggingEnabled", $loggingEnabled))
	
	  ;open file to write
	  ;create directory structure if it doesn't exist, and open file to write

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 146, False))
	  $logFile = FileOpen($logFileName, 10) ; which is similar to 2 + 8 (erase + create dir)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 146, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logFile")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFile", $logFile))
If SetError(@error, @extended, IsDeclared("logFileName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFileName", $logFileName))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 148, False))
	  If $logFile = -1 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 148, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logFile")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFile", $logFile))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 149, False))
		 $error = "Error: Cannot open file to write"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 149, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 150, False))
		  _logErr ($error)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 150, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 151, False))
		  Exit
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 151, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 152, False))
	  EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 152, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 153, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 153, False, @error, @extended))

   ;check if logging enabled is specified in the iSCT.conf

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 156, False))
   $loggingEnabled  = _checkDebugEnabled($configFilePath)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 156, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loggingEnabled")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loggingEnabled", $loggingEnabled))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 157, False))
   _logRunningStat ("Logging Enabled = " & $loggingEnabled)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 157, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loggingEnabled")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loggingEnabled", $loggingEnabled))

   ;if -s flag not specified and the loggingEnabled is 1 (parsed from configuration file)

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 160, False))
   If $loggingEnabled = 1 And $logFileName = "" Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 160, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loggingEnabled")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loggingEnabled", $loggingEnabled))
If SetError(@error, @extended, IsDeclared("logFileName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFileName", $logFileName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 161, False))
	  $logPath = "C:\ISCT\ISCT-Log" ; default path to store log file
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 161, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logPath", $logPath))
	  ;log file name is : Auto_AP_timestamp

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 163, False))
	  $timestamp = @HOUR & "_" & @MIN & "_" & @SEC
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 163, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("timestamp")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$timestamp", $timestamp))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 164, False))
	  $logFileName = $logPath & "\Auto_AP_" & $timestamp & ".txt"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 164, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logFileName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFileName", $logFileName))
If SetError(@error, @extended, IsDeclared("logPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logPath", $logPath))
If SetError(@error, @extended, IsDeclared("timestamp")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$timestamp", $timestamp))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 165, False))
	  $loggingEnabled = 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 165, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loggingEnabled")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loggingEnabled", $loggingEnabled))
	
	  ;open file to write
	  ;create directory structure if it doesn't exist, and open file to write

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 169, False))
	  $logFile = FileOpen($logFileName, 10) ; which is similar to 2 + 8 (erase + create dir)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 169, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logFile")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFile", $logFile))
If SetError(@error, @extended, IsDeclared("logFileName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFileName", $logFileName))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 171, False))
	  If $logFile = -1 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 171, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logFile")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFile", $logFile))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 172, False))
		 $error = "Error: Cannot open file to write"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 172, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 173, False))
		  _logErr ($error)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 173, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("error")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$error", $error))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 174, False))
		  Exit
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 174, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 175, False))
	  EndIf  
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 175, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 176, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 176, False, @error, @extended))


   

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 180, False))
#EndRegion Parsing command line argument (and err catching), also set up for saving debug log file
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 180, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 181, False))
_logRunningStat ("Param initialization finished")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 181, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 182, False))
_logRunningStat ("SSID : " & $SSID)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 182, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 183, False))
ConsoleWrite("SSID : " & $SSID & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("SSID : " & $SSID & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 183, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 184, False))
_logRunningStat ("Configuration file path: " & $configFilePath)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 184, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 185, False))
_logRunningStat ("Interface: " & $interface)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 185, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("interface")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$interface", $interface))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 186, False))
_logRunningStat ("Switch: " & $opt)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 186, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 187, False))
_logRunningStat ("Log file is being saved at: " & $logFileName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 187, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logFileName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFileName", $logFileName))



SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 190, False))
#Region MAIN 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 190, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 191, False))
If $interface = "WiFi" Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 191, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("interface")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$interface", $interface))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 192, False))
   _WiFi_Handler()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 192, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 193, False))
ElseIf $interface = "LAN" Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 193, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("interface")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$interface", $interface))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 194, False))
   _LAN_Handler()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 194, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 195, False))
EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 195, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 197, False))
_cleanUp() ;cleaning up and exit
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 197, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 198, False))
#EndRegion MAIN
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 198, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 200, False))
#Region ROUTINES (FUNCTIONS) DECLARATION
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 200, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 202, False))
Func _WiFi_Handler()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 202, False, @error, @extended))
   
   ;cleaning the IE cache, to prevent the IE pop up : "go to prev page"

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 205, False))
   _logRunningStat ("Clearing the IE cache")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 205, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 206, False))
   Run("RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess " & 255) ; clear the cache
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 206, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 207, False))
   _logRunningStat ("Sleeping for 20 seconds")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 207, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 208, False))
   sleep(20000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 208, False, @error, @extended))
   
   
   ; //****** Create a browser window and navigate to  login page
   ;//************************************************************
   
   ;getting the AP's IP address to nagvigate to the page, log the error and return if found error on parsing (missing info)

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 215, False))
   $toGet = "AP_IP"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 215, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 216, False))
   $ipAddress = _getProperty($configFilePath ,$SSID, $toGet)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 216, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 217, False))
   If StringInStr( $ipAddress, "Error") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 217, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 218, False))
	  _logErr ($ipAddress)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 218, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 219, False))
   Endif
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 219, False, @error, @extended))
   ;create the string of http address

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 221, False))
   $address = "http://" & $ipAddress
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 221, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("address")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$address", $address))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 222, False))
   _IENavigate($oIE, $address)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 222, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))
If SetError(@error, @extended, IsDeclared("address")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$address", $address))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 223, False))
   _logRunningStat ("Navigating to URL address : " & $address)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 223, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("address")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$address", $address))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 224, False))
   ConsoleWrite("Navigating to URL address : " & $address & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("Navigating to URL address : " & $address & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 224, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("address")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$address", $address))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 225, False))
   _IELoadWait ($oIE)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 225, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 226, False))
   If @error <> 0 Then 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 226, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 227, False))
		 _logErr(@error)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 227, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 228, False))
   Endif  
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 228, False, @error, @extended))
   


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 231, False))
   _checkDDWRT()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 231, False, @error, @extended))
   ;MsgBox(0, Default, $hasDDWRT)
   
   ;================================== if this AP is DD WRT supported (CISCO AP) =================================

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 235, False))
   If $hasDDWRT = True Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 235, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hasDDWRT")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hasDDWRT", $hasDDWRT))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 236, False))
		_logRunningStat ("This AP has DD-WRT interface")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 236, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 237, False))
		_logRunningStat ("Check if the SSID is already " & $opt)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 237, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 238, False))
		Local $checkResult = _checkSSID($SSID , $opt)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 238, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("checkResult")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$checkResult", $checkResult))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))
		

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 240, False))
		If $checkResult = 0 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 240, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("checkResult")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$checkResult", $checkResult))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 241, False))
			_logRunningStat ("The SSID " & $SSID & " is already " & $opt & ". Script is exitting....")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 241, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 242, False))
			_cleanUp()		
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 242, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 243, False))
		EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 243, False, @error, @extended))
		  
		; getting the RF_Name to ssh into router, return the Error if NOT FOUND

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 246, False))
		$toGet = "RF_Name"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 246, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 247, False))
		Global $dd_wrt_RF_Name = _getProperty($configFilePath , $SSID, $toGet)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 247, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("dd_wrt_RF_Name")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_RF_Name", $dd_wrt_RF_Name))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 248, False))
		If StringInStr( $dd_wrt_RF_Name, "Error") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 248, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("dd_wrt_RF_Name")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_RF_Name", $dd_wrt_RF_Name))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 249, False))
			_logErr ($dd_wrt_RF_Name)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 249, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("dd_wrt_RF_Name")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_RF_Name", $dd_wrt_RF_Name))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 250, False))
		Endif
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 250, False, @error, @extended))
	  
	  
		; getting the password to ssh into router return the Error if NOT FOUND

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 254, False))
		$toGet = "AP_Password"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 254, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 255, False))
		Global $dd_wrt_password = _getProperty($configFilePath , "Site", $toGet)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 255, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("dd_wrt_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_password", $dd_wrt_password))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 256, False))
		If StringInStr( $dd_wrt_password, "Error") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 256, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("dd_wrt_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_password", $dd_wrt_password))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 257, False))
			_logErr ($dd_wrt_password)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 257, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("dd_wrt_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_password", $dd_wrt_password))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 258, False))
		Endif
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 258, False, @error, @extended))
	  

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 260, False))
		_logRunningStat ("Finished parsing AP's information from iSCT.conf")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 260, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 261, False))
		_logRunningStat ("DD-WRT RF_Name: " & $dd_wrt_RF_Name)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 261, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("dd_wrt_RF_Name")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_RF_Name", $dd_wrt_RF_Name))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 262, False))
		_logRunningStat ("DD-WRT userName (Default): " & $dd_wrt_userName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 262, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("dd_wrt_userName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_userName", $dd_wrt_userName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 263, False))
		_logRunningStat ("DD-WRT Password: " & $dd_wrt_password)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 263, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("dd_wrt_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_password", $dd_wrt_password))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 265, False))
		Local $string2 = "%%whs%%"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 265, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 267, False))
		Local $plinkCommand = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 267, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("plinkCommand")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkCommand", $plinkCommand))
		

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 269, False))
		Local $switch = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 269, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switch")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switch", $switch))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 270, False))
		If $opt = "on" Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 270, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 271, False))
			$switch = "up"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 271, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switch")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switch", $switch))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 272, False))
		ElseIf $opt = "off" Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 272, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 273, False))
			$switch = "down"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 273, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switch")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switch", $switch))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 274, False))
		Endif
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 274, False, @error, @extended))
		

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 276, False))
		$plinkCommand = $plinkPath & ' ' & _RTRIM($ipAddress, $string2) & ' ' & "-l" & ' ' &  _RTRIM($dd_wrt_userName, $string2) & ' ' & "-pw" & ' ' &  _RTRIM($dd_wrt_password, $string2) & ' ' & "ifconfig" & ' ' & _RTRIM($dd_wrt_RF_Name, $string2) & ' ' & $switch
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 276, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("plinkCommand")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkCommand", $plinkCommand))
If SetError(@error, @extended, IsDeclared("plinkPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkPath", $plinkPath))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))
If SetError(@error, @extended, IsDeclared("dd_wrt_userName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_userName", $dd_wrt_userName))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))
If SetError(@error, @extended, IsDeclared("dd_wrt_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_password", $dd_wrt_password))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))
If SetError(@error, @extended, IsDeclared("dd_wrt_RF_Name")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_RF_Name", $dd_wrt_RF_Name))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))
If SetError(@error, @extended, IsDeclared("switch")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switch", $switch))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 277, False))
		_logRunningStat ("Constructed plink command " & $plinkCommand)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 277, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("plinkCommand")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkCommand", $plinkCommand))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 278, False))
		_logRunningStat ("Adding AP IP address to the putty cache.......... ")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 278, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 279, False))
		_addPuttyCache($ipAddress, $dd_wrt_userName, $dd_wrt_password)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 279, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))
If SetError(@error, @extended, IsDeclared("dd_wrt_userName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_userName", $dd_wrt_userName))
If SetError(@error, @extended, IsDeclared("dd_wrt_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_password", $dd_wrt_password))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 280, False))
		Sleep (2000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 280, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 281, False))
	  _logRunningStat ("Executing this plink command" & $plinkCommand)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 281, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("plinkCommand")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkCommand", $plinkCommand))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 282, False))
	  $process_id = Run($plinkCommand , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 282, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("process_id")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$process_id", $process_id))
If SetError(@error, @extended, IsDeclared("plinkCommand")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkCommand", $plinkCommand))
If SetError(@error, @extended, IsDeclared("STDERR_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDERR_CHILD", $STDERR_CHILD))
If SetError(@error, @extended, IsDeclared("STDOUT_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDOUT_CHILD", $STDOUT_CHILD))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 284, False))
	  _logRunningStat ("Re-booting the AP.......................")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 284, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 285, False))
	  If ($opt = "on" ) Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 285, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 286, False))
		 $plinkCommand = $plinkPath & ' ' & _RTRIM($ipAddress, $string2) & ' ' & "-l" & ' ' &  _RTRIM($dd_wrt_userName, $string2) & ' ' & "-pw" & ' ' &  _RTRIM($dd_wrt_password, $string2) &  " reboot"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 286, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("plinkCommand")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkCommand", $plinkCommand))
If SetError(@error, @extended, IsDeclared("plinkPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkPath", $plinkPath))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))
If SetError(@error, @extended, IsDeclared("dd_wrt_userName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_userName", $dd_wrt_userName))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))
If SetError(@error, @extended, IsDeclared("dd_wrt_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_password", $dd_wrt_password))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 287, False))
		 $process_id_reboot = Run($plinkCommand , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 287, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("process_id_reboot")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$process_id_reboot", $process_id_reboot))
If SetError(@error, @extended, IsDeclared("plinkCommand")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkCommand", $plinkCommand))
If SetError(@error, @extended, IsDeclared("STDERR_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDERR_CHILD", $STDERR_CHILD))
If SetError(@error, @extended, IsDeclared("STDOUT_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDOUT_CHILD", $STDOUT_CHILD))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 288, False))
		 _logRunningStat ("Sleeping for 30 seconds ")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 288, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 289, False))
		 Sleep (30000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 289, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 290, False))
	  EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 290, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 292, False))
	  _logRunningStat ("Checking if the SSID is turned " & $opt)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 292, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 293, False))
	  $checkReturn = _checkSSID($SSID , $opt)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 293, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("checkReturn")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$checkReturn", $checkReturn))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 294, False))
	  If $checkReturn = 1 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 294, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("checkReturn")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$checkReturn", $checkReturn))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 295, False))
		 $ret = "Failed"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 295, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ret")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ret", $ret))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 296, False))
		 _logRunningStat ("Failed to turn " & $opt & " the wifi interface " & $dd_wrt_RF_Name & " of SSID " & $SSID )
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 296, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))
If SetError(@error, @extended, IsDeclared("dd_wrt_RF_Name")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_RF_Name", $dd_wrt_RF_Name))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 297, False))
	  EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 297, False, @error, @extended))
	  

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 299, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 299, False, @error, @extended))
   
   ;=================================== if this AP is not DD WRT supported============================


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 303, False))
   If $hasDDWRT = False Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 303, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hasDDWRT")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hasDDWRT", $hasDDWRT))
	  

	  

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 307, False))
	  _logRunningStat ("This AP does not have DD-WRT interface")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 307, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 308, False))
	  _logRunningStat ("Checking if this AP is Trendnet AP")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 308, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 309, False))
	  Local $sSrc = _IEDocReadHTML($oIE)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 309, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sSrc")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sSrc", $sSrc))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 310, False))
	  sleep(2000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 310, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 311, False))
	  If @error = 3 Then 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 311, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 312, False))
		 _logErr("Invalid Data Type")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 312, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 313, False))
	  Endif
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 313, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 315, False))
	  Dim $isTRENDNET = StringRegExp($sSrc, '.*TEW*', 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 315, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("isTRENDNET")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isTRENDNET", $isTRENDNET))
If SetError(@error, @extended, IsDeclared("sSrc")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sSrc", $sSrc))

	  ;this is the TRENDNET AP

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 318, False))
	  If $isTRENDNET  = 1 Then 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 318, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("isTRENDNET")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isTRENDNET", $isTRENDNET))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 319, False))
		 _logRunningStat  ("FOUND Trendnet AP")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 319, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 320, False))
		 Local $o_form = _IEGetObjByName ($oIE, "form1")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 320, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("o_form")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$o_form", $o_form))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 321, False))
		 Local $o_login = _IEFormElementGetObjByName($o_form, "login_n") ; username
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 321, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("o_login")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$o_login", $o_login))
If SetError(@error, @extended, IsDeclared("o_form")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$o_form", $o_form))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 322, False))
		 Local $o_password = _IEFormElementGetObjByName($o_form, "login_pass") ; password
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 322, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("o_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$o_password", $o_password))
If SetError(@error, @extended, IsDeclared("o_form")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$o_form", $o_form))
		 

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 324, False))
		 Local $toGet = "AP_AdminName"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 324, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))
		 ; getting  user name

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 326, False))
		 Local $web_userName = _getProperty($configFilePath , $SSID, $toGet)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 326, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("web_userName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$web_userName", $web_userName))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))
		 

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 328, False))
		 If StringInStr($web_userName, "Error") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 328, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("web_userName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$web_userName", $web_userName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 329, False))
			 _logErr ($web_userName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 329, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("web_userName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$web_userName", $web_userName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 330, False))
		 Endif		 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 330, False, @error, @extended))
		 ;getting web site password

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 332, False))
		 $toGet = "AP_Password"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 332, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))
		 ; getting  user name

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 334, False))
		 Local $web_password = _getProperty($configFilePath ,$SSID, $toGet)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 334, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("web_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$web_password", $web_password))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))



SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 337, False))
		 If StringInStr($web_password, "Error") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 337, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("web_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$web_password", $web_password))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 338, False))
			 _logErr ($web_password)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 338, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("web_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$web_password", $web_password))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 339, False))
		 Endif
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 339, False, @error, @extended))
		 

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 341, False))
		 _logRunningStat ("Finished parsing information from iSCT.conf")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 341, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 342, False))
		 _logRunningStat ("Username : " & $web_userName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 342, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("web_userName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$web_userName", $web_userName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 343, False))
		 _logRunningStat ("Password : " & $web_password)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 343, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("web_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$web_password", $web_password))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 344, False))
		 _logRunningStat ("Submitting these information to the webform")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 344, False, @error, @extended))
		 

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 346, False))
		 _IEFormElementSetValue($o_login, $web_userName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 346, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("o_login")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$o_login", $o_login))
If SetError(@error, @extended, IsDeclared("web_userName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$web_userName", $web_userName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 347, False))
		 _IEFormElementSetValue($o_password, $web_password)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 347, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("o_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$o_password", $o_password))
If SetError(@error, @extended, IsDeclared("web_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$web_password", $web_password))
		 

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 349, False))
		 Local $oSubmit = _IEGetObjByName ($o_form, "login")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 349, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oSubmit")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oSubmit", $oSubmit))
If SetError(@error, @extended, IsDeclared("o_form")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$o_form", $o_form))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 350, False))
		 _IEAction ($oSubmit, "click")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 350, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oSubmit")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oSubmit", $oSubmit))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 351, False))
		 _IELoadWait ($oIE)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 351, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))
		 
		 ;check if the entered username and password are incorrect

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 354, False))
		 Local $sSrc = _IEDocReadHTML($oIE)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 354, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sSrc")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sSrc", $sSrc))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 355, False))
		 Local $isCorrectLogin = StringRegExp($sSrc, '.*User.Name.or.Password.incorrect*', 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 355, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("isCorrectLogin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isCorrectLogin", $isCorrectLogin))
If SetError(@error, @extended, IsDeclared("sSrc")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sSrc", $sSrc))
		 

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 357, False))
		 If $isCorrectLogin = 1 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 357, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("isCorrectLogin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isCorrectLogin", $isCorrectLogin))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 358, False))
			_logErr ("User name or password entered to the form is incorrect")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 358, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 359, False))
		 Endif
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 359, False, @error, @extended))
		 

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 361, False))
		 Local $addressWireless = "http://" & $ipAddress & "/wireless_basic.asp"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 361, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("addressWireless")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$addressWireless", $addressWireless))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))
		 

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 363, False))
		 _logRunningStat ("Navigating to this URL address : " & $addressWireless)		 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 363, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("addressWireless")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$addressWireless", $addressWireless))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 364, False))
		 _IENavigate($oIE, $addressWireless)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 364, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))
If SetError(@error, @extended, IsDeclared("addressWireless")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$addressWireless", $addressWireless))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 365, False))
		 _IELoadWait ($oIE)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 365, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))
		 

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 367, False))
		 _logRunningStat ("Switching WIRELESS to : " & $opt)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 367, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 368, False))
		 If $opt = "OFF" Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 368, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 369, False))
			$oForm = _IEGetObjByName ($oIE, "form1")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 369, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oForm")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oForm", $oForm))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 370, False))
			_IEFormElementRadioSelect ($oForm, 1 , "wlan0_enable", 1, "byIndex")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 370, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oForm")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oForm", $oForm))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 371, False))
			Sleep(2000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 371, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 372, False))
			$oIE.document.parentWindow.execscript("send_request()")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 372, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 373, False))
		 Else
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 373, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 374, False))
			$oForm = _IEGetObjByName ($oIE, "form1")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 374, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oForm")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oForm", $oForm))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 375, False))
			_IEFormElementRadioSelect ($oForm, 0 , "wlan0_enable", 1, "byIndex")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 375, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oForm")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oForm", $oForm))
			

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 377, False))
			Sleep(2000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 377, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 378, False))
			$oIE.document.parentWindow.execscript("send_request()")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 378, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 379, False))
		 EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 379, False, @error, @extended))
		 
		  ;_IELoadWait ($oIE)

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 382, False))
		 $sleepTime = 30000
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 382, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sleepTime")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sleepTime", $sleepTime))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 383, False))
		 _logRunningStat ("Sleeping for " & $sleepTime & ". Waiting for the web to fully loaded")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 383, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sleepTime")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sleepTime", $sleepTime))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 384, False))
		 Sleep ($sleepTime)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 384, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sleepTime")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sleepTime", $sleepTime))
		 

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 386, False))
		 _logRunningStat ("Checking if the SSID is turned " & $opt)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 386, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 387, False))
		 $checkReturn = _checkSSID($SSID, False)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 387, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("checkReturn")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$checkReturn", $checkReturn))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 388, False))
		 If $checkReturn = 1 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 388, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("checkReturn")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$checkReturn", $checkReturn))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 389, False))
			_logRunningStat ("SSID is still not shown in the netsh wlan show networks ")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 389, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 390, False))
			$ret = "Failed !"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 390, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ret")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ret", $ret))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 391, False))
		 EndIf	
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 391, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 392, False))
	  EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 392, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 394, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 394, False, @error, @extended))
EndFunc



SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 398, False))
Func _LAN_Handler()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 398, False, @error, @extended))
   ;pre-defined param:
   ;$opt = "on"
   
   ;getting the lan port number on the switch

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 403, False))
	$toGet = "VLAN_Switch_Port"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 403, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 404, False))
	$portNum = _getProperty($configFilePath , $SSID, $toGet)	  
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 404, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("portNum")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$portNum", $portNum))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 405, False))
	If StringInStr($portNum, "Error") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 405, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("portNum")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$portNum", $portNum))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 406, False))
	  _logErr ($portNum) 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 406, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("portNum")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$portNum", $portNum))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 407, False))
	EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 407, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 408, False))
	If StringInStr($portNum, "NA") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 408, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("portNum")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$portNum", $portNum))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 409, False))
		_logReturnStat("VN Port number is NA in config file")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 409, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 410, False))
		_cleanUp()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 410, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 411, False))
	EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 411, False, @error, @extended))
	
   ;getting the switch IP address

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 414, False))
	$toGet = "VLAN_Switch_IP"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 414, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 415, False))
	$switchIP = _getProperty($configFilePath , $SSID, $toGet)	  
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 415, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switchIP")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchIP", $switchIP))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 416, False))
	If StringInStr($switchIP, "Error") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 416, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switchIP")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchIP", $switchIP))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 417, False))
	  _logErr ($switchIP) 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 417, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switchIP")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchIP", $switchIP))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 418, False))
	EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 418, False, @error, @extended))

   ;getting the switch password

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 421, False))
	$toGet = "VLAN_Switch_Pw"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 421, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 422, False))
	$switchPw = _getProperty($configFilePath , $SSID, $toGet)	  
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 422, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switchPw")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchPw", $switchPw))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 423, False))
 	If StringInStr($switchPw, "Error") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 423, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switchPw")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchPw", $switchPw))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 424, False))
	  _logErr ($switchPw) 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 424, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switchPw")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchPw", $switchPw))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 425, False))
	EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 425, False, @error, @extended))
	
   ;getting the switch en_password

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 428, False))
	$toGet = "VLAN_Switch_2ndPw"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 428, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 429, False))
	$switchEnPw = _getProperty($configFilePath , $SSID, $toGet)	  
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 429, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switchEnPw")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchEnPw", $switchEnPw))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 430, False))
  	If StringInStr($switchEnPw, "Error") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 430, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switchEnPw")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchEnPw", $switchEnPw))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 431, False))
	  _logErr ($switchEnPw) 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 431, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switchEnPw")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchEnPw", $switchEnPw))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 432, False))
	EndIf  
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 432, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 434, False))
   _logRunningStat ("FINISHED Parsing information from iSCT.conf")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 434, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 435, False))
   _logRunningStat ("VLAN_Switch_Port: " & $portNum )
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 435, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("portNum")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$portNum", $portNum))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 436, False))
   _logRunningStat ("VLAN_Switch_IP: " & $switchIP)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 436, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switchIP")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchIP", $switchIP))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 437, False))
   _logRunningStat ("VLAN_Switch_Pw: " & $switchPw)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 437, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switchPw")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchPw", $switchPw))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 438, False))
   _logRunningStat ("VLAN_Switch_2ndPw: " & $switchEnPw)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 438, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switchEnPw")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchEnPw", $switchEnPw))
   
   

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 441, False))
   $killPutty = "C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe Stop-Process -processname putty"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 441, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("killPutty")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$killPutty", $killPutty))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 443, False))
   Sleep(2000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 443, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 444, False))
   _logRunningStat ("Killing any putty running process with this commmand: " & $killPutty )
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 444, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("killPutty")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$killPutty", $killPutty))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 445, False))
   Run($killPutty, @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 445, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("killPutty")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$killPutty", $killPutty))
If SetError(@error, @extended, IsDeclared("STDERR_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDERR_CHILD", $STDERR_CHILD))
If SetError(@error, @extended, IsDeclared("STDOUT_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDOUT_CHILD", $STDOUT_CHILD))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 447, False))
   Sleep(5000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 447, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 449, False))
   $puttyWinTitle = $switchIP & " - " & "PuTTY"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 449, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWinTitle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWinTitle", $puttyWinTitle))
If SetError(@error, @extended, IsDeclared("switchIP")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchIP", $switchIP))
   

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 451, False))
   _logRunningStat ("Telnet-ing into the switch ")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 451, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 452, False))
   _logRunningStat ("Adding switch IP into the putty cache .....")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 452, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 453, False))
   $putty_pid =  Run("C:\ISCT\AVE\putty.exe -telnet " & $switchIP)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 453, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("putty_pid")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$putty_pid", $putty_pid))
If SetError(@error, @extended, IsDeclared("switchIP")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchIP", $switchIP))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 454, False))
   _logRunningStat ("Returned Putty PID: " & $putty_pid  )
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 454, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("putty_pid")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$putty_pid", $putty_pid))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 455, False))
   _logRunningStat ("Sleeping for 5 seconds")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 455, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 456, False))
   Sleep(5000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 456, False, @error, @extended))
   

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 458, False))
   $puttyWin = _GetHwndFromPID ($putty_pid)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 458, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWin", $puttyWin))
If SetError(@error, @extended, IsDeclared("putty_pid")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$putty_pid", $putty_pid))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 460, False))
   If Not $puttyWin Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 460, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWin", $puttyWin))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 461, False))
	 _logErr ("Error: Failed getting Putty Window Handle")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 461, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 462, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 462, False, @error, @extended))
   

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 464, False))
   $mode = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 464, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("mode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$mode", $mode))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 465, False))
   If $opt = "on" Then 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 465, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 466, False))
	  $mode = "no shut"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 466, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("mode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$mode", $mode))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 467, False))
   ElseIf $opt = "off" Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 467, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 468, False))
	  $mode = "shut"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 468, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("mode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$mode", $mode))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 469, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 469, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 471, False))
   _logRunningStat ("Switching LAN Port " & $opt  )
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 471, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 472, False))
   Sleep(1000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 472, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 473, False))
   ControlSend($puttyWin, "", "", $switchPw  & @CR) ;entering password
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 473, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWin", $puttyWin))
If SetError(@error, @extended, IsDeclared("switchPw")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchPw", $switchPw))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 474, False))
   Sleep(1000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 474, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 476, False))
   ControlSend($puttyWin, "", "", "en"  & @CR) ; entering En_Pw
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 476, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWin", $puttyWin))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 477, False))
   Sleep(1000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 477, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 479, False))
   ControlSend($puttyWin, "", "", $switchEnPw  & @CR) ; entering En_Pw
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 479, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWin", $puttyWin))
If SetError(@error, @extended, IsDeclared("switchEnPw")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switchEnPw", $switchEnPw))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 480, False))
   Sleep(2000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 480, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 482, False))
   ControlSend($puttyWin, "", "", "config t" & @CR) ; entering config mode
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 482, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWin", $puttyWin))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 483, False))
   Sleep(2000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 483, False, @error, @extended))

   ;$portInterface = "fa0/" & $portNum

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 486, False))
   ControlSend($puttyWin, "", "", "interface" & ' ' & "fa0/" & $portNum & @CR) ; get on interface
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 486, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWin", $puttyWin))
If SetError(@error, @extended, IsDeclared("portNum")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$portNum", $portNum))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 487, False))
   Sleep(2000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 487, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 489, False))
   ControlSend($puttyWin, "", "", $mode & @CR) ; switch ON / OFF
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 489, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWin", $puttyWin))
If SetError(@error, @extended, IsDeclared("mode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$mode", $mode))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 490, False))
   Sleep(1000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 490, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 492, False))
   ControlSend($puttyWin, "", "", "exit" & @CR) ; exit out of interface
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 492, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWin", $puttyWin))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 493, False))
   Sleep(3000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 493, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 495, False))
   ControlSend($puttyWin, "", "", "exit" & @CR) ; exit out of config mode
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 495, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWin", $puttyWin))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 496, False))
   Sleep(3000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 496, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 498, False))
   ControlSend($puttyWin, "", "", "wr" & @CR) ; write config
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 498, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWin", $puttyWin))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 499, False))
   Sleep(1000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 499, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 501, False))
   ControlSend($puttyWin, "", "", "exit" & @CR) ; log off 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 501, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("puttyWin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$puttyWin", $puttyWin))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 502, False))
   Sleep(5000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 502, False, @error, @extended))
   

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 504, False))
   _logRunningStat ("Finished switching LAN port " & $opt )
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 504, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("opt")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$opt", $opt))
EndFunc


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 507, False))
 Func _killProc($sPID)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 507, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sPID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sPID", $sPID))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 508, False))
    If IsString($sPID) Then $sPID = ProcessExists($sPID)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 508, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sPID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sPID", $sPID))
If SetError(@error, @extended, IsDeclared("sPID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sPID", $sPID))
If SetError(@error, @extended, IsDeclared("sPID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sPID", $sPID))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 509, False))
    If Not $sPID Then Return SetError(1, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 509, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sPID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sPID", $sPID))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 510, False))
    return Run(@ComSpec & " /c taskkill /F /PID " & $sPID & " /T", @SystemDir, @SW_HIDE)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 510, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sPID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sPID", $sPID))
 EndFunc
 

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 513, False))
Func _printUsage()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 513, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 514, False))
	ConsoleWrite("!======================     AUTO-AP Script   ====================" & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("!======================     AUTO-AP Script   ====================" & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 514, False, @error, @extended))
	

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 516, False))
	ConsoleWrite("Usage: Auto-AP.exe <file path> <SSID> <WLAN / LAN> <ON / OFF> <-s <dir path to log file>>" & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("Usage: Auto-AP.exe <file path> <SSID> <WLAN / LAN> <ON / OFF> <-s <dir path to log file>>" & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 516, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 517, False))
	ConsoleWrite("[file path]  :  full path to the iSCT.conf file" & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("[file path]  :  full path to the iSCT.conf file" & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 517, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 518, False))
	ConsoleWrite("[SSID]       :  the identifier of the block in the iSCT.conf" & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("[SSID]       :  the identifier of the block in the iSCT.conf" & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 518, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 519, False))
	ConsoleWrite("[WLAN / LAN] :  interface to turn on/off" & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("[WLAN / LAN] :  interface to turn on/off" & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 519, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 520, False))
	ConsoleWrite("[ON / OFF]   :  turn ON or OFF"  & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("[ON / OFF]   :  turn ON or OFF"  & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 520, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 521, False))
	ConsoleWrite("-s <path to directory for log file> : if this option specified, script will log to this  directory instead of stdout"  & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("-s <path to directory for log file> : if this option specified, script will log to this  directory instead of stdout"  & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 521, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 522, False))
	ConsoleWrite("--------------------------------------------------------------------" & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("--------------------------------------------------------------------" & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 522, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 523, False))
	ConsoleWrite("i.e : Auto-AP.exe C:\ISCT\AVE\iSCT.conf PCCGCase-Cisco5 LAN OFF -s C:\ISCT\ISCT-log"  & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("i.e : Auto-AP.exe C:\ISCT\AVE\iSCT.conf PCCGCase-Cisco5 LAN OFF -s C:\ISCT\ISCT-log"  & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 523, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 524, False))
	ConsoleWrite("Return: 1, on Error: print out error message if the script execution encounters error: ==>  Error: ... " & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("Return: 1, on Error: print out error message if the script execution encounters error: ==>  Error: ... " & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 524, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 525, False))
	ConsoleWrite("        2, if Success: print Return Status SUCCESS" & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("        2, if Success: print Return Status SUCCESS" & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 525, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 526, False))
	ConsoleWrite("!================================================================" & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("!================================================================" & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 526, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 527, False))
	Exit(0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 527, False, @error, @extended))
 EndFunc
 
 ; check if this AP has DD-WRT

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 531, False))
Func _checkDDWRT ()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 531, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 532, False))
	Local $loop = 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 532, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loop")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loop", $loop))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 533, False))
	For $i = 1 To 5 Step 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 533, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("i")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$i", $i))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 534, False))
		Local $sSrc = _IEDocReadHTML($oIE)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 534, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sSrc")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sSrc", $sSrc))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 535, False))
		sleep(2000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 535, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 536, False))
		Local $errOnPage = StringRegExp($sSrc, '.*Internet Explorer cannot display the webpage*', 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 536, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("errOnPage")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$errOnPage", $errOnPage))
If SetError(@error, @extended, IsDeclared("sSrc")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sSrc", $sSrc))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 537, False))
		If $errOnPage  = 0 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 537, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("errOnPage")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$errOnPage", $errOnPage))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 538, False))
			ExitLoop	
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 538, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 539, False))
		EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 539, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 540, False))
		$loop = $loop + 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 540, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loop")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loop", $loop))
If SetError(@error, @extended, IsDeclared("loop")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loop", $loop))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 541, False))
		_logRunningStat("[Checking DD-WRT] : Cannot go to the AP's website. Tried " & $loop & " times.")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 541, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loop")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loop", $loop))
		;nagvigate to this website again

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 543, False))
		$address = "http://" & $ipAddress
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 543, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("address")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$address", $address))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 544, False))
		_IENavigate($oIE, $address)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 544, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))
If SetError(@error, @extended, IsDeclared("address")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$address", $address))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 545, False))
		_logRunningStat ("Navigating to URL address : " & $address)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 545, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("address")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$address", $address))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 546, False))
		ConsoleWrite("Navigating to URL address : " & $address & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("Navigating to URL address : " & $address & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 546, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("address")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$address", $address))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 547, False))
		_IELoadWait ($oIE)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 547, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 548, False))
		If @error <> 0 Then 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 548, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 549, False))
			_logErr(@error)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 549, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 550, False))
		Endif	
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 550, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 551, False))
	Next
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 551, False, @error, @extended))
	

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 553, False))
	If $loop  >= 5 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 553, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loop")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loop", $loop))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 554, False))
		_logErr ("[Checking DD-WRT] : Cannot go to the AP's website. Tried (max)" & $loop & " times.")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 554, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loop")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loop", $loop))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 555, False))
		ConsoleWrite ("[Checking DD-WRT] : Cannot go to the AP's website. Tried (max)" & $loop & " times." & @LF)
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("[Checking DD-WRT] : Cannot go to the AP's website. Tried (max)" & $loop & " times." & @LF))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 555, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loop")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loop", $loop))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 556, False))
		_logRunningStat("[Return Status] : Failed " & $loop & " times.")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 556, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("loop")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loop", $loop))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 557, False))
	EndIf 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 557, False, @error, @extended))
   

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 559, False))
   Local $aMatch = StringRegExp($sSrc, '.*DD-WRT*', 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 559, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("aMatch")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aMatch", $aMatch))
If SetError(@error, @extended, IsDeclared("sSrc")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sSrc", $sSrc))
   

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 561, False))
   If $aMatch = 1 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 561, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("aMatch")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aMatch", $aMatch))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 562, False))
	  $hasDDWRT = True
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 562, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hasDDWRT")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hasDDWRT", $hasDDWRT))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 563, False))
   ElseIf $aMatch = 0 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 563, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("aMatch")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aMatch", $aMatch))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 564, False))
	  $hasDDWRT = False
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 564, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hasDDWRT")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hasDDWRT", $hasDDWRT))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 565, False))
   EndIf  
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 565, False, @error, @extended))
EndFunc

;#include <constants.au3>
;return 1 if the SSID is on, 0 if the SSID is off

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 570, False))
Func _checkSSID($SSID , $state)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 570, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("state")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$state", $state))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 571, False))
	_logRunningStat (" _checkSSID: " )
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 571, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 572, False))
	Local $check_result = -1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 572, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("check_result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$check_result", $check_result))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 573, False))
	If $hasDDWRT = True Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 573, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hasDDWRT")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hasDDWRT", $hasDDWRT))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 574, False))
		Local $string2 = "%%whs%%"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 574, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 575, False))
		Local $plinkCommand = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 575, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("plinkCommand")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkCommand", $plinkCommand))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 576, False))
		$plinkCommand = $plinkPath & ' ' & _RTRIM($ipAddress, $string2) & ' ' & "-l" & ' ' &  _RTRIM($dd_wrt_userName, $string2) & ' ' & "-pw" & ' ' &  _RTRIM($dd_wrt_password, $string2) & ' ' & "ifconfig" & ' ' & _RTRIM($dd_wrt_RF_Name, $string2)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 576, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("plinkCommand")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkCommand", $plinkCommand))
If SetError(@error, @extended, IsDeclared("plinkPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkPath", $plinkPath))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))
If SetError(@error, @extended, IsDeclared("dd_wrt_userName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_userName", $dd_wrt_userName))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))
If SetError(@error, @extended, IsDeclared("dd_wrt_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_password", $dd_wrt_password))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))
If SetError(@error, @extended, IsDeclared("dd_wrt_RF_Name")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_RF_Name", $dd_wrt_RF_Name))
If SetError(@error, @extended, IsDeclared("string2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string2", $string2))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 577, False))
		_logRunningStat ("Constructed plink command " & $plinkCommand)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 577, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("plinkCommand")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkCommand", $plinkCommand))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 578, False))
		_logRunningStat ("Adding AP IP address to the putty cache.......... ")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 578, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 579, False))
		_addPuttyCache($ipAddress, $dd_wrt_userName, $dd_wrt_password)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 579, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))
If SetError(@error, @extended, IsDeclared("dd_wrt_userName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_userName", $dd_wrt_userName))
If SetError(@error, @extended, IsDeclared("dd_wrt_password")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$dd_wrt_password", $dd_wrt_password))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 580, False))
		Sleep (2000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 580, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 581, False))
		_logRunningStat ("Executing this plink command" & $plinkCommand)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 581, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("plinkCommand")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkCommand", $plinkCommand))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 582, False))
		$process_id = Run($plinkCommand , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 582, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("process_id")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$process_id", $process_id))
If SetError(@error, @extended, IsDeclared("plinkCommand")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkCommand", $plinkCommand))
If SetError(@error, @extended, IsDeclared("STDERR_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDERR_CHILD", $STDERR_CHILD))
If SetError(@error, @extended, IsDeclared("STDOUT_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDOUT_CHILD", $STDOUT_CHILD))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 583, False))
		ProcessWaitClose($process_id)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 583, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("process_id")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$process_id", $process_id))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 584, False))
		Local $resultStr  = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 584, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("resultStr")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$resultStr", $resultStr))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 585, False))
		$resultStr  &= "Result from Plink: " & @LF
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 585, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("resultStr")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$resultStr", $resultStr))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 586, False))
		$resultStr &= StdoutRead($process_id)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 586, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("resultStr")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$resultStr", $resultStr))
If SetError(@error, @extended, IsDeclared("process_id")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$process_id", $process_id))
				

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 588, False))
		_logRunningStat ($resultStr)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 588, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("resultStr")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$resultStr", $resultStr))
		

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 590, False))
		If $state = "on" Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 590, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("state")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$state", $state))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 591, False))
			If StringRegExp ( $resultStr, "UP BROADCAST RUNNING MULTICAST") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 591, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("resultStr")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$resultStr", $resultStr))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 592, False))
				return 0 ; success
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 592, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 593, False))
			Else
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 593, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 594, False))
				return 1; failure
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 594, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 595, False))
			EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 595, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 596, False))
		ElseIf $state = "off" Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 596, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("state")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$state", $state))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 597, False))
			If StringRegExp ( $resultStr, "BROADCAST MULTICAST") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 597, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("resultStr")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$resultStr", $resultStr))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 598, False))
				return 0 ; success
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 598, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 599, False))
			Else
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 599, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 600, False))
				return 1; failure
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 600, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 601, False))
			EndIf			
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 601, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 602, False))
		EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 602, False, @error, @extended))
		

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 604, False))
   ElseIf $hasDDWRT = False Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 604, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hasDDWRT")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hasDDWRT", $hasDDWRT))
		

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 606, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 606, False, @error, @extended))
   
   

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 609, False))
   Return $check_result
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 609, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("check_result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$check_result", $check_result))
   
EndFunc

;check if the LAN is off or on

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 614, False))
Func _checkLAN($ipAddress, $switch)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 614, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))
If SetError(@error, @extended, IsDeclared("switch")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switch", $switch))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 615, False))
   $cmd_pid = Run("cmd.exe", "", @SW_MAXIMIZE, $STDOUT_CHILD + $RUN_CREATE_NEW_CONSOLE + $STDERR_CHILD)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 615, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("cmd_pid")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$cmd_pid", $cmd_pid))
If SetError(@error, @extended, IsDeclared("STDOUT_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDOUT_CHILD", $STDOUT_CHILD))
If SetError(@error, @extended, IsDeclared("RUN_CREATE_NEW_CONSOLE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$RUN_CREATE_NEW_CONSOLE", $RUN_CREATE_NEW_CONSOLE))
If SetError(@error, @extended, IsDeclared("STDERR_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDERR_CHILD", $STDERR_CHILD))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 616, False))
   Sleep(5000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 616, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 617, False))
   $cmd_hwnd = _GetHwndFromPID($cmd_pid)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 617, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("cmd_hwnd")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$cmd_hwnd", $cmd_hwnd))
If SetError(@error, @extended, IsDeclared("cmd_pid")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$cmd_pid", $cmd_pid))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 618, False))
   ControlSend($cmd_hwnd, "", "", "ping " & $ipAddress & @CR)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 618, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("cmd_hwnd")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$cmd_hwnd", $cmd_hwnd))
If SetError(@error, @extended, IsDeclared("ipAddress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAddress", $ipAddress))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 619, False))
   Sleep(5000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 619, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 620, False))
   $kill_console = "powershell.exe Stop-Process -id " & $cmd_pid
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 620, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("kill_console")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$kill_console", $kill_console))
If SetError(@error, @extended, IsDeclared("cmd_pid")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$cmd_pid", $cmd_pid))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 621, False))
   Run($kill_console, @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD) 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 621, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("kill_console")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$kill_console", $kill_console))
If SetError(@error, @extended, IsDeclared("STDERR_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDERR_CHILD", $STDERR_CHILD))
If SetError(@error, @extended, IsDeclared("STDOUT_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDOUT_CHILD", $STDOUT_CHILD))
   

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 623, False))
   ProcessWaitClose($cmd_pid)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 623, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("cmd_pid")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$cmd_pid", $cmd_pid))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 624, False))
   $result = StdoutRead($cmd_pid)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 624, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("cmd_pid")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$cmd_pid", $cmd_pid))
   ;_logRunningStat ("Result : " & $result)

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 626, False))
   Local $toRet = StringRegExp ( $result, "TTL")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 626, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toRet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toRet", $toRet))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 627, False))
   If $switch = 1 And $toRet = 1 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 627, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switch")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switch", $switch))
If SetError(@error, @extended, IsDeclared("toRet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toRet", $toRet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 628, False))
	  return 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 628, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 629, False))
   ElseIf $switch = 0 And $toRet = 0 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 629, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("switch")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$switch", $switch))
If SetError(@error, @extended, IsDeclared("toRet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toRet", $toRet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 630, False))
	  return 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 630, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 631, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 631, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 632, False))
   return 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 632, False, @error, @extended))
EndFunc
   
;check if the network has connection by pinging the IP

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 636, False))
Func _hasNetwork($ip)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 636, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ip")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ip", $ip))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 637, False))
   Local $foo = Run("ping " & $ip , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 637, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("foo")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$foo", $foo))
If SetError(@error, @extended, IsDeclared("ip")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ip", $ip))
If SetError(@error, @extended, IsDeclared("STDERR_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDERR_CHILD", $STDERR_CHILD))
If SetError(@error, @extended, IsDeclared("STDOUT_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDOUT_CHILD", $STDOUT_CHILD))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 638, False))
   $result = ""
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 638, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 639, False))
   While 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 639, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 640, False))
	   $line = StdoutRead($foo)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 640, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("line")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$line", $line))
If SetError(@error, @extended, IsDeclared("foo")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$foo", $foo))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 641, False))
	   If @error Then ExitLoop
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 641, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 642, False))
	   $result &= $line
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 642, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("line")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$line", $line))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 643, False))
	Wend
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 643, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 644, False))
   Return StringRegExp ( $result, "TTL")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 644, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
EndFunc

;check in the configuration file if DebugEnabled is specified

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 648, False))
Func _checkDebugEnabled($configFilePath)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 648, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 650, False))
   $aSplit = "";
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 650, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("aSplit")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aSplit", $aSplit))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 651, False))
   For $x = 1 To $isct_conf[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 651, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("x")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$x", $x))
If SetError(@error, @extended, IsDeclared("isct_conf")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isct_conf", $isct_conf))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 652, False))
	  If StringRegExp ($isct_conf[$x] , "Auto_AP_Debug", 0 )Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 652, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("isct_conf")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isct_conf", $isct_conf))
If SetError(@error, @extended, IsDeclared("x")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$x", $x))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 653, False))
		 $aSplit = StringSplit($isct_conf[$x], "=")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 653, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("aSplit")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aSplit", $aSplit))
If SetError(@error, @extended, IsDeclared("isct_conf")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isct_conf", $isct_conf))
If SetError(@error, @extended, IsDeclared("x")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$x", $x))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 654, False))
		 ExitLoop
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 654, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 655, False))
	  EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 655, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 656, False))
   Next
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 656, False, @error, @extended))
	

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 658, False))
   return $aSplit[2]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 658, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("aSplit")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aSplit", $aSplit))
EndFunc


; parse the conf file and get a specific item of the identified subject 

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 663, False))
Func _getProperty($configFilePath , $SSID, $toGet)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 663, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("configFilePath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$configFilePath", $configFilePath))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))
  

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 665, False))
   Local $idIndex = 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 665, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("idIndex")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$idIndex", $idIndex))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 667, False))
   For $x = 1 To $isct_conf[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 667, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("x")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$x", $x))
If SetError(@error, @extended, IsDeclared("isct_conf")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isct_conf", $isct_conf))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 668, False))
	  If StringRegExp ($isct_conf[$x] , "\[" & $SSID & "\]", 0 )Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 668, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("isct_conf")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isct_conf", $isct_conf))
If SetError(@error, @extended, IsDeclared("x")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$x", $x))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 669, False))
		 $idIndex = $x
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 669, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("idIndex")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$idIndex", $idIndex))
If SetError(@error, @extended, IsDeclared("x")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$x", $x))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 670, False))
		 ExitLoop
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 670, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 671, False))
	   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 671, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 672, False))
   Next
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 672, False, @error, @extended))
	

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 674, False))
   If $idIndex = 0 Then _logErr ("Error: " & $SSID & " not Found")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 674, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("idIndex")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$idIndex", $idIndex))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
	  

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 676, False))
   Local $toGetIndex = 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 676, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toGetIndex")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGetIndex", $toGetIndex))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 677, False))
   For $x = $idIndex + 1 To $isct_conf[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 677, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("x")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$x", $x))
If SetError(@error, @extended, IsDeclared("idIndex")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$idIndex", $idIndex))
If SetError(@error, @extended, IsDeclared("isct_conf")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isct_conf", $isct_conf))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 678, False))
	  If StringRegExp ($isct_conf[$x] , "\[.*.\]", 0 )Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 678, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("isct_conf")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isct_conf", $isct_conf))
If SetError(@error, @extended, IsDeclared("x")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$x", $x))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 679, False))
		 ExitLoop
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 679, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 680, False))
	  EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 680, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 681, False))
	  If StringRegExp ($isct_conf[$x] , $toGet & "=.*.", 0 )Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 681, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("isct_conf")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isct_conf", $isct_conf))
If SetError(@error, @extended, IsDeclared("x")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$x", $x))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 682, False))
		 $toGetIndex= $x
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 682, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toGetIndex")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGetIndex", $toGetIndex))
If SetError(@error, @extended, IsDeclared("x")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$x", $x))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 683, False))
		 ExitLoop
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 683, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 684, False))
	  EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 684, False, @error, @extended))
	  
	  

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 687, False))
   Next
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 687, False, @error, @extended))
	

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 689, False))
   If $toGetIndex = 0 Then _logErr ("Error: " & $toGet & " of " & $SSID &   " not found")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 689, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("toGetIndex")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGetIndex", $toGetIndex))
If SetError(@error, @extended, IsDeclared("toGet")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGet", $toGet))
If SetError(@error, @extended, IsDeclared("SSID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$SSID", $SSID))
	  

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 691, False))
   $line = $isct_conf[$toGetIndex]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 691, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("line")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$line", $line))
If SetError(@error, @extended, IsDeclared("isct_conf")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$isct_conf", $isct_conf))
If SetError(@error, @extended, IsDeclared("toGetIndex")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$toGetIndex", $toGetIndex))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 692, False))
   $aSplit = StringSplit($line, "=")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 692, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("aSplit")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aSplit", $aSplit))
If SetError(@error, @extended, IsDeclared("line")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$line", $line))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 693, False))
   return $aSplit[2] ; return the item
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 693, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("aSplit")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aSplit", $aSplit))
EndFunc



SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 697, False))
func _RTRIM($sString, $sTrimChars=' ')
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 697, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sString")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sString", $sString))
If SetError(@error, @extended, IsDeclared("sTrimChars")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sTrimChars", $sTrimChars))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 699, False))
	$sTrimChars = StringReplace( $sTrimChars, "%%whs%%", " " & chr(9) & chr(11) & chr(12) & @CRLF )
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 699, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sTrimChars")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sTrimChars", $sTrimChars))
If SetError(@error, @extended, IsDeclared("sTrimChars")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sTrimChars", $sTrimChars))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 700, False))
	local $nCount, $nFoundChar
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 700, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nCount")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nCount", $nCount))
If SetError(@error, @extended, IsDeclared("nFoundChar")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nFoundChar", $nFoundChar))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 701, False))
	local $aStringArray = StringSplit($sString, "")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 701, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("aStringArray")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aStringArray", $aStringArray))
If SetError(@error, @extended, IsDeclared("sString")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sString", $sString))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 702, False))
	local $aCharsArray = StringSplit($sTrimChars, "")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 702, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("aCharsArray")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aCharsArray", $aCharsArray))
If SetError(@error, @extended, IsDeclared("sTrimChars")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sTrimChars", $sTrimChars))


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 704, False))
	for $nCount = $aStringArray[0] to 1 step -1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 704, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nCount")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nCount", $nCount))
If SetError(@error, @extended, IsDeclared("aStringArray")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aStringArray", $aStringArray))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 705, False))
		$nFoundChar = 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 705, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nFoundChar")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nFoundChar", $nFoundChar))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 706, False))
		for $i = 1 to $aCharsArray[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 706, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("i")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$i", $i))
If SetError(@error, @extended, IsDeclared("aCharsArray")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aCharsArray", $aCharsArray))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 707, False))
			if $aCharsArray[$i] = $aStringArray[$nCount] then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 707, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("aCharsArray")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aCharsArray", $aCharsArray))
If SetError(@error, @extended, IsDeclared("i")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$i", $i))
If SetError(@error, @extended, IsDeclared("aStringArray")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aStringArray", $aStringArray))
If SetError(@error, @extended, IsDeclared("nCount")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nCount", $nCount))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 708, False))
				$nFoundChar = 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 708, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nFoundChar")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nFoundChar", $nFoundChar))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 709, False))
			EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 709, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 710, False))
		next
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 710, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 711, False))
		if $nFoundChar = 0 then return StringTrimRight( $sString, ($aStringArray[0] - $nCount) )
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 711, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nFoundChar")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nFoundChar", $nFoundChar))
If SetError(@error, @extended, IsDeclared("sString")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sString", $sString))
If SetError(@error, @extended, IsDeclared("aStringArray")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$aStringArray", $aStringArray))
If SetError(@error, @extended, IsDeclared("nCount")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nCount", $nCount))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 712, False))
	next
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 712, False, @error, @extended))
 endfunc
 
 ;Function for getting HWND from PID

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 716, False))
Func _GetHwndFromPID($PID)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 716, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("PID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$PID", $PID))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 717, False))
	$hWnd = 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 717, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hWnd")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hWnd", $hWnd))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 718, False))
	$winlist = WinList()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 718, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("winlist")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$winlist", $winlist))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 719, False))
	Do
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 719, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 720, False))
		For $i = 1 To $winlist[0][0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 720, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("i")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$i", $i))
If SetError(@error, @extended, IsDeclared("winlist")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$winlist", $winlist))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 721, False))
			If $winlist[$i][0] <> "" Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 721, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("winlist")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$winlist", $winlist))
If SetError(@error, @extended, IsDeclared("i")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$i", $i))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 722, False))
				$iPID2 = WinGetProcess($winlist[$i][1])
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 722, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("iPID2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$iPID2", $iPID2))
If SetError(@error, @extended, IsDeclared("winlist")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$winlist", $winlist))
If SetError(@error, @extended, IsDeclared("i")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$i", $i))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 723, False))
				If $iPID2 = $PID Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 723, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("iPID2")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$iPID2", $iPID2))
If SetError(@error, @extended, IsDeclared("PID")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$PID", $PID))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 724, False))
					$hWnd = $winlist[$i][1]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 724, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hWnd")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hWnd", $hWnd))
If SetError(@error, @extended, IsDeclared("winlist")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$winlist", $winlist))
If SetError(@error, @extended, IsDeclared("i")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$i", $i))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 725, False))
					ExitLoop
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 725, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 726, False))
				EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 726, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 727, False))
			EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 727, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 728, False))
		Next
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 728, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 729, False))
	Until $hWnd <> 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 729, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hWnd")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hWnd", $hWnd))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 730, False))
	Return $hWnd
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 730, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hWnd")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hWnd", $hWnd))
 EndFunc;==>_GetHwndFromPID
 
;output the error and exit

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 734, False))
Func _logErr ($string)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 734, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("string")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string", $string))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 735, False))
   If $string <> "" Then 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 735, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("string")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string", $string))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 736, False))
	  _logRunningStat ("Killing any running IE instances")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 736, False, @error, @extended))
	  ;_killProc('iexplore.exe')

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 738, False))
	  If IsDeclared("oIE") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 738, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 739, False))
		 _IEQuit($oIE)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 739, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 740, False))
		 _logRunningStat ("[Cleaning up] Clearing the IE cache")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 740, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 741, False))
		 Run("RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess " & 255) ; clear the cache
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 741, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 742, False))
	  EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 742, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 743, False))
	  sleep(6000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 743, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 744, False))
	  BlockInput(0) ; enable user input
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 744, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 745, False))
	  Sleep (4000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 745, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 746, False))
	  $ret = "Error "
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 746, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ret")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ret", $ret))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 747, False))
	  _logReturnStat ($ret & " : " & $string)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 747, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ret")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ret", $ret))
If SetError(@error, @extended, IsDeclared("string")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string", $string))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 748, False))
	  _logRunningStat ($ret & " : " & $string)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 748, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ret")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ret", $ret))
If SetError(@error, @extended, IsDeclared("string")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string", $string))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 749, False))
	  exit(0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 749, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 750, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 750, False, @error, @extended))
EndFunc

;output the return stat

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 754, False))
Func _logReturnStat ($string)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 754, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("string")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string", $string))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 755, False))
   If $string <> "" Then 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 755, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("string")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string", $string))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 756, False))
	  ConsoleWrite("[Auto-AP]-Return Status: " & $string & @LF )
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("[Auto-AP]-Return Status: " & $string & @LF ))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 756, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("string")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string", $string))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 757, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 757, False, @error, @extended))
EndFunc


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 760, False))
Func _logRunningStat ($string)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 760, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("string")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string", $string))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 761, False))
   If $string <> "" And $loggingEnabled = 1 Then 
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 761, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("string")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string", $string))
If SetError(@error, @extended, IsDeclared("loggingEnabled")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loggingEnabled", $loggingEnabled))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 762, False))
	  FileWrite ($logFile, "[ " & @Hour & ":" & @Min & ":" & @Sec & " ] " & "[Auto-AP <PID:" & @AutoItPID & ">]-Running Status: " & $string & @CRLF )
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 762, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logFile")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFile", $logFile))
If SetError(@error, @extended, IsDeclared("string")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string", $string))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 763, False))
   ElseIf $string <> "" And $loggingEnabled = 0 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 763, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("string")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string", $string))
If SetError(@error, @extended, IsDeclared("loggingEnabled")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$loggingEnabled", $loggingEnabled))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 764, False))
	  ConsoleWrite ("[Auto-AP]-Running Status: " & $string & @LF )
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("[Auto-AP]-Running Status: " & $string & @LF ))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 764, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("string")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$string", $string))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 765, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 765, False, @error, @extended))
EndFunc


;killing previous unstopped Auto-AP

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 770, False))
Func _killPrevRunInstance()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 770, False, @error, @extended))
   ; List just notepad.exe processes

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 772, False))
   $list = ProcessList("Auto-AP.exe")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 772, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("list")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$list", $list))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 773, False))
   For $i = 1 To $list[0][0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 773, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("i")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$i", $i))
If SetError(@error, @extended, IsDeclared("list")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$list", $list))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 774, False))
	   $pid = $list[$i][1]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 774, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("pid")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$pid", $pid))
If SetError(@error, @extended, IsDeclared("list")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$list", $list))
If SetError(@error, @extended, IsDeclared("i")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$i", $i))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 775, False))
	   If $pid <> @AutoItPID Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 775, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("pid")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$pid", $pid))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 776, False))
		  $killPrev = "C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe Stop-Process -id " & $pid
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 776, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("killPrev")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$killPrev", $killPrev))
If SetError(@error, @extended, IsDeclared("pid")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$pid", $pid))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 777, False))
		  ConsoleWrite ("Killing Auto-AP with pid " & $pid & @LF )
SetError(@error, @extended, AutoIt_Debugger_SendConsoleWrite("Killing Auto-AP with pid " & $pid & @LF ))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 777, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("pid")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$pid", $pid))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 778, False))
		  Run($killPrev , @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)		  
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 778, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("killPrev")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$killPrev", $killPrev))
If SetError(@error, @extended, IsDeclared("STDERR_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDERR_CHILD", $STDERR_CHILD))
If SetError(@error, @extended, IsDeclared("STDOUT_CHILD")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$STDOUT_CHILD", $STDOUT_CHILD))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 779, False))
	   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 779, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 780, False))
   Next
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 780, False, @error, @extended))
EndFunc

;adding the ip address to the putty cache

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 784, False))
Func _addPuttyCache($ipAdress, $id, $pw)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 784, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ipAdress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAdress", $ipAdress))
If SetError(@error, @extended, IsDeclared("id")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$id", $id))
If SetError(@error, @extended, IsDeclared("pw")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$pw", $pw))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 785, False))
   $plinkPath = "C:\ISCT\AVE\plink.exe"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 785, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("plinkPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkPath", $plinkPath))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 786, False))
   $cmd = "echo y | " & $plinkPath & " " & $ipAdress & " -l " & $id & " -pw " & $pw
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 786, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("cmd")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$cmd", $cmd))
If SetError(@error, @extended, IsDeclared("plinkPath")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$plinkPath", $plinkPath))
If SetError(@error, @extended, IsDeclared("ipAdress")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ipAdress", $ipAdress))
If SetError(@error, @extended, IsDeclared("id")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$id", $id))
If SetError(@error, @extended, IsDeclared("pw")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$pw", $pw))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 787, False))
   RunWait(@ComSpec & " /C " & $cmd, "", @SW_HIDE);   
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 787, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("cmd")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$cmd", $cmd))
EndFunc


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 790, False))
Func _cleanUp()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 790, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 791, False))
   _logRunningStat ("Killing any running IE instances")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 791, False, @error, @extended))
   

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 793, False))
   If IsDeclared("oIE") Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 793, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 794, False))
	  _IEQuit($oIE)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 794, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("oIE")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$oIE", $oIE))
	  ;_killProc('iexplore.exe')

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 796, False))
	  _logRunningStat ("[Cleaning up] Clearing the IE cache")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 796, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 797, False))
	  Run("RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess " & 255) ; clear the cache
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 797, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 798, False))
   EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 798, False, @error, @extended))
   ;_killProc('iexplore.exe')

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 800, False))
   sleep(6000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 800, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 801, False))
   BlockInput(0) ; enable user input
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 801, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 802, False))
   _logReturnStat ($ret)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 802, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ret")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ret", $ret))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 803, False))
   _logRunningStat ("Return Status: " & $ret)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 803, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ret")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ret", $ret))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 804, False))
   Sleep (4000)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 804, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 805, False))
   FileClose ($logFile)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 805, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("logFile")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$logFile", $logFile))

SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 806, False))
   exit(0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 806, False, @error, @extended))
EndFunc


SetError(@error, @extended, AutoIt_Debugger_NextLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 809, False))
#EndRegion ROUTINES (FUNCTIONS) DECLARATION
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("C:\Development\ISCT-Scripts\Auto-AP.au3", "Auto-AP.au3", 809, False, @error, @extended))

Func AutoIt_Debugger_OnAutoItExit()
   AutoIt_Debugger_WaitForExit()
EndFunc

Func CheckForVariableChange($VariableName, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   If $VariableName = "$error" Then
      AutoIt_Debugger_GetVariableFromEvent("$error", $error, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$ret" Then
      AutoIt_Debugger_GetVariableFromEvent("$ret", $ret, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$configFilePath" Then
      AutoIt_Debugger_GetVariableFromEvent("$configFilePath", $configFilePath, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$interface" Then
      AutoIt_Debugger_GetVariableFromEvent("$interface", $interface, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$opt" Then
      AutoIt_Debugger_GetVariableFromEvent("$opt", $opt, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$logPath" Then
      AutoIt_Debugger_GetVariableFromEvent("$logPath", $logPath, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$timestamp" Then
      AutoIt_Debugger_GetVariableFromEvent("$timestamp", $timestamp, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$logFileName" Then
      AutoIt_Debugger_GetVariableFromEvent("$logFileName", $logFileName, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$loggingEnabled" Then
      AutoIt_Debugger_GetVariableFromEvent("$loggingEnabled", $loggingEnabled, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$logFile" Then
      AutoIt_Debugger_GetVariableFromEvent("$logFile", $logFile, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$oIE" Then
      AutoIt_Debugger_GetVariableFromEvent("$oIE", $oIE, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$isct_conf" Then
      AutoIt_Debugger_GetVariableFromEvent("$isct_conf", $isct_conf, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$hasDDWRT" Then
      AutoIt_Debugger_GetVariableFromEvent("$hasDDWRT", $hasDDWRT, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$SSID" Then
      AutoIt_Debugger_GetVariableFromEvent("$SSID", $SSID, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$ipAddress" Then
      AutoIt_Debugger_GetVariableFromEvent("$ipAddress", $ipAddress, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$plinkPath" Then
      AutoIt_Debugger_GetVariableFromEvent("$plinkPath", $plinkPath, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$dd_wrt_RF_Name" Then
      AutoIt_Debugger_GetVariableFromEvent("$dd_wrt_RF_Name", $dd_wrt_RF_Name, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$dd_wrt_userName" Then
      AutoIt_Debugger_GetVariableFromEvent("$dd_wrt_userName", $dd_wrt_userName, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$dd_wrt_password" Then
      AutoIt_Debugger_GetVariableFromEvent("$dd_wrt_password", $dd_wrt_password, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$CMDLINE" Then
      AutoIt_Debugger_GetVariableFromEvent("$CMDLINE", $CMDLINE, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$toGet" Then
      AutoIt_Debugger_GetVariableFromEvent("$toGet", $toGet, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$address" Then
      AutoIt_Debugger_GetVariableFromEvent("$address", $address, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$checkResult" Then
      AutoIt_Debugger_GetVariableFromEvent("$checkResult", $checkResult, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$string2" Then
      AutoIt_Debugger_GetVariableFromEvent("$string2", $string2, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$plinkCommand" Then
      AutoIt_Debugger_GetVariableFromEvent("$plinkCommand", $plinkCommand, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$switch" Then
      AutoIt_Debugger_GetVariableFromEvent("$switch", $switch, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$process_id" Then
      AutoIt_Debugger_GetVariableFromEvent("$process_id", $process_id, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$STDERR_CHILD" Then
      AutoIt_Debugger_GetVariableFromEvent("$STDERR_CHILD", $STDERR_CHILD, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$STDOUT_CHILD" Then
      AutoIt_Debugger_GetVariableFromEvent("$STDOUT_CHILD", $STDOUT_CHILD, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$process_id_reboot" Then
      AutoIt_Debugger_GetVariableFromEvent("$process_id_reboot", $process_id_reboot, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$checkReturn" Then
      AutoIt_Debugger_GetVariableFromEvent("$checkReturn", $checkReturn, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$sSrc" Then
      AutoIt_Debugger_GetVariableFromEvent("$sSrc", $sSrc, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$isTRENDNET" Then
      AutoIt_Debugger_GetVariableFromEvent("$isTRENDNET", $isTRENDNET, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$o_form" Then
      AutoIt_Debugger_GetVariableFromEvent("$o_form", $o_form, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$o_login" Then
      AutoIt_Debugger_GetVariableFromEvent("$o_login", $o_login, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$o_password" Then
      AutoIt_Debugger_GetVariableFromEvent("$o_password", $o_password, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$web_userName" Then
      AutoIt_Debugger_GetVariableFromEvent("$web_userName", $web_userName, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$web_password" Then
      AutoIt_Debugger_GetVariableFromEvent("$web_password", $web_password, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$oSubmit" Then
      AutoIt_Debugger_GetVariableFromEvent("$oSubmit", $oSubmit, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$isCorrectLogin" Then
      AutoIt_Debugger_GetVariableFromEvent("$isCorrectLogin", $isCorrectLogin, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$addressWireless" Then
      AutoIt_Debugger_GetVariableFromEvent("$addressWireless", $addressWireless, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$oForm" Then
      AutoIt_Debugger_GetVariableFromEvent("$oForm", $oForm, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$sleepTime" Then
      AutoIt_Debugger_GetVariableFromEvent("$sleepTime", $sleepTime, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$portNum" Then
      AutoIt_Debugger_GetVariableFromEvent("$portNum", $portNum, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$switchIP" Then
      AutoIt_Debugger_GetVariableFromEvent("$switchIP", $switchIP, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$switchPw" Then
      AutoIt_Debugger_GetVariableFromEvent("$switchPw", $switchPw, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$switchEnPw" Then
      AutoIt_Debugger_GetVariableFromEvent("$switchEnPw", $switchEnPw, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$killPutty" Then
      AutoIt_Debugger_GetVariableFromEvent("$killPutty", $killPutty, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$puttyWinTitle" Then
      AutoIt_Debugger_GetVariableFromEvent("$puttyWinTitle", $puttyWinTitle, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$putty_pid" Then
      AutoIt_Debugger_GetVariableFromEvent("$putty_pid", $putty_pid, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$puttyWin" Then
      AutoIt_Debugger_GetVariableFromEvent("$puttyWin", $puttyWin, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$mode" Then
      AutoIt_Debugger_GetVariableFromEvent("$mode", $mode, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$sPID" Then
      AutoIt_Debugger_GetVariableFromEvent("$sPID", $sPID, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$loop" Then
      AutoIt_Debugger_GetVariableFromEvent("$loop", $loop, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$i" Then
      AutoIt_Debugger_GetVariableFromEvent("$i", $i, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$errOnPage" Then
      AutoIt_Debugger_GetVariableFromEvent("$errOnPage", $errOnPage, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$aMatch" Then
      AutoIt_Debugger_GetVariableFromEvent("$aMatch", $aMatch, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$state" Then
      AutoIt_Debugger_GetVariableFromEvent("$state", $state, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$check_result" Then
      AutoIt_Debugger_GetVariableFromEvent("$check_result", $check_result, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$resultStr" Then
      AutoIt_Debugger_GetVariableFromEvent("$resultStr", $resultStr, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$cmd_pid" Then
      AutoIt_Debugger_GetVariableFromEvent("$cmd_pid", $cmd_pid, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$RUN_CREATE_NEW_CONSOLE" Then
      AutoIt_Debugger_GetVariableFromEvent("$RUN_CREATE_NEW_CONSOLE", $RUN_CREATE_NEW_CONSOLE, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$cmd_hwnd" Then
      AutoIt_Debugger_GetVariableFromEvent("$cmd_hwnd", $cmd_hwnd, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$kill_console" Then
      AutoIt_Debugger_GetVariableFromEvent("$kill_console", $kill_console, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$result" Then
      AutoIt_Debugger_GetVariableFromEvent("$result", $result, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$toRet" Then
      AutoIt_Debugger_GetVariableFromEvent("$toRet", $toRet, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$ip" Then
      AutoIt_Debugger_GetVariableFromEvent("$ip", $ip, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$foo" Then
      AutoIt_Debugger_GetVariableFromEvent("$foo", $foo, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$line" Then
      AutoIt_Debugger_GetVariableFromEvent("$line", $line, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$aSplit" Then
      AutoIt_Debugger_GetVariableFromEvent("$aSplit", $aSplit, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$x" Then
      AutoIt_Debugger_GetVariableFromEvent("$x", $x, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$idIndex" Then
      AutoIt_Debugger_GetVariableFromEvent("$idIndex", $idIndex, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$toGetIndex" Then
      AutoIt_Debugger_GetVariableFromEvent("$toGetIndex", $toGetIndex, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$sString" Then
      AutoIt_Debugger_GetVariableFromEvent("$sString", $sString, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$sTrimChars" Then
      AutoIt_Debugger_GetVariableFromEvent("$sTrimChars", $sTrimChars, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$nCount" Then
      AutoIt_Debugger_GetVariableFromEvent("$nCount", $nCount, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$nFoundChar" Then
      AutoIt_Debugger_GetVariableFromEvent("$nFoundChar", $nFoundChar, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$aStringArray" Then
      AutoIt_Debugger_GetVariableFromEvent("$aStringArray", $aStringArray, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$aCharsArray" Then
      AutoIt_Debugger_GetVariableFromEvent("$aCharsArray", $aCharsArray, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$PID" Then
      AutoIt_Debugger_GetVariableFromEvent("$PID", $PID, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$hWnd" Then
      AutoIt_Debugger_GetVariableFromEvent("$hWnd", $hWnd, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$winlist" Then
      AutoIt_Debugger_GetVariableFromEvent("$winlist", $winlist, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$iPID2" Then
      AutoIt_Debugger_GetVariableFromEvent("$iPID2", $iPID2, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$string" Then
      AutoIt_Debugger_GetVariableFromEvent("$string", $string, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$list" Then
      AutoIt_Debugger_GetVariableFromEvent("$list", $list, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$pid" Then
      AutoIt_Debugger_GetVariableFromEvent("$pid", $pid, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$killPrev" Then
      AutoIt_Debugger_GetVariableFromEvent("$killPrev", $killPrev, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$ipAdress" Then
      AutoIt_Debugger_GetVariableFromEvent("$ipAdress", $ipAdress, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$id" Then
      AutoIt_Debugger_GetVariableFromEvent("$id", $id, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$pw" Then
      AutoIt_Debugger_GetVariableFromEvent("$pw", $pw, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
   If $VariableName = "$cmd" Then
      AutoIt_Debugger_GetVariableFromEvent("$cmd", $cmd, $AutoItDebugger_ArrayIndexString,  $VariableValue)
   EndIf
EndFunc
#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.2.1.11 (beta)
	Author:         myName

	Script Function:
	The command code for the AutoIt Debugger (this was the Include file)

#ce ----------------------------------------------------------------------------

;Uncomment the following to check that all variables are defined
;AutoItSetOption("MustDeclareVars", 1)

Func AutoIt_Debugger_CreateMessageWindow()
	;#Include <winapi.au3>
	;#include <GUIConstants.au3>
	;#include <WindowsConstants.au3>
	;#include-once

	#region ### START Koda GUI section ### Form=_AutoIt Debugger Include.kxf
	$AutoItDebuggerCommandWindow = GUICreate("AutoIt Debugger Command Window", 621, 328, 193, 126)
	$AutoItDebuggerCommandWindowListbox = GUICtrlCreateList("", 8, 8, 609, 305)
	#endregion ### END Koda GUI section ###
	;GUISetState(@SW_SHOW)

	; Register Windows Messages
	GUIRegisterMsg(0x004A, "_GUIRegisterMsgProc") ;Global Const $WM_COPYDATA = 0x004A

	;Dim $AutoItDebugger_ClosedByUser
	;Dim $AutoItDebugger_LastError
	;Dim $AutoItDebugger_LastExtended
EndFunc   ;==>AutoIt_Debugger_CreateMessageWindow


Func AutoItDebuggerEvent_ChangeVariable($VariableName, $VariableValue)
	;MsgBox(0, "_AutoIt Debugger Include", "Entered 'AutoItDebuggerEvent_ChangeVariable'")

	Dim $AutoItDebugger_ArrayIndexString = ""
	Dim $StrippedVariableName = $VariableName

	;Convert array variables from $asMyArray[1] format to a
	Local $iOpenSquareBracketPos
	$iOpenSquareBracketPos = StringInStr($VariableName, "[")
	If $iOpenSquareBracketPos <> 0 Then
		$StrippedVariableName = StringLeft($VariableName, $iOpenSquareBracketPos - 1)
		;Strip the variable name and open bracket to leave '1][1]' etc.
		$AutoItDebugger_ArrayIndexString = StringTrimLeft($VariableName, $iOpenSquareBracketPos)
		;Strip the close bracket to leave '1][1' etc.
		$AutoItDebugger_ArrayIndexString = StringTrimRight($AutoItDebugger_ArrayIndexString, 1)
		;Remove any ][ from the string and replace with | to make 1][1 into 1|1
		$AutoItDebugger_ArrayIndexString = StringReplace($AutoItDebugger_ArrayIndexString, "][", "|")
		;MsgBox(0, "_AutoIt Debugger Include", $AutoItDebugger_ArrayIndexString)
	EndIf

	;Check if the variable is actually a variable
	If IsDeclared(StringTrimLeft($VariableName, 1)) Then
		CheckForVariableChange($StrippedVariableName, $AutoItDebugger_ArrayIndexString, $VariableValue)
	Else
		;MsgBox features: Title=Yes, Text=Yes, Buttons=OK, Icon=Warning
		MsgBox(48, "_AutoIt Debugger Include", "AutoIt Debugger GUI sent attempted to change the value of an undeclared variable (" & $StrippedVariableName & ")")
	EndIf
EndFunc   ;==>AutoItDebuggerEvent_ChangeVariable


Func AutoIt_Debugger_NextLine($Filepath, $Filename, $LineNumber, $SkipLine)
	Local $sChangedVariableName

	;Default to single step
	$AutoItDebugger_Paused = 1

	;Send new line status to the Debug GUI
	_AU3COM_SendData_NewLine($Filepath & "|" & $Filename & "|" & $LineNumber & "|" & $SkipLine)

	;Wait for the GUI to come off pause
	While $AutoItDebugger_Paused
		;Quit if necessary
		If $AutoItDebugger_Quit Then
			Exit
		EndIf

		;Wait
		Sleep(50)
	WEnd
EndFunc   ;==>AutoIt_Debugger_NextLine


Func AutoIt_Debugger_FinishedLine($Filepath, $Filename, $LineNumber, $SkipLine, $NextLine_Error, $NextLine_Extended)

	;If Not $SkipLine Then
	;Send new line status to the Debug GUI
	_AU3COM_SendData_FinishedLine($Filepath & "|" & $Filename & "|" & $LineNumber & "|" & $SkipLine)

	;Send the @error and @extended data on each new line
	_AU3COM_SendData_SendVariable("@error" & "|" & $NextLine_Error)
	_AU3COM_SendData_SendVariable("@extended" & "|" & $NextLine_Extended)
	;EndIf
EndFunc   ;==>AutoIt_Debugger_FinishedLine


Func AutoIt_Debugger_WaitForExit()
	;Send script finished message
	_AU3COM_SendData_ScriptFinished("ScriptFinishing")

	#region --- CodeWizard generated code Start ---
	;MsgBox features: Title=No, Text=Yes, Buttons=OK, Icon=Question
	MsgBox(64, "AutoIt Debugger", "Script Finished. Click OK to return to development mode.")
	#endregion --- CodeWizard generated code Start ---

	_AU3COM_SendData_ScriptFinished("ScriptFinished")
EndFunc   ;==>AutoIt_Debugger_WaitForExit


Func AutoIt_Debugger_LoadFile($ORiginalScriptFilePath, $ORiginalScriptFileName)
	If $AutoItDebuggerCommandWindowName = "" Then
		;Take the first script name as the command window name
		$AutoItDebuggerCommandWindowName = $ORiginalScriptFilePath

		;Change this windows name
		WinSetTitle("AutoIt Debugger Command Window", "", $AutoItDebuggerCommandWindowName & " AutoIt Debugger Command Window")
	EndIf

	;Default to single step
	$AutoItDebugger_Paused = 1

	_AU3COM_SendData_LoadFile($ORiginalScriptFilePath & "|" & $ORiginalScriptFileName)

	;Wait for the GUI to come off pause
	While $AutoItDebugger_Paused
		;Quit if necessary
		If $AutoItDebugger_Quit Then
			Exit
		EndIf

		;Wait
		Sleep(50)
	WEnd
EndFunc   ;==>AutoIt_Debugger_LoadFile


Func AutoIt_Debugger_DebugFile($DebugScriptFilePath)
	;Default to single step
	$AutoItDebugger_Paused = 1

	_AU3COM_SendData_DebugFile($DebugScriptFilePath)

	;Wait for the GUI to come off pause
	While $AutoItDebugger_Paused
		;Quit if necessary
		If $AutoItDebugger_Quit Then
			Exit
		EndIf

		;Wait
		Sleep(50)
	WEnd
EndFunc   ;==>AutoIt_Debugger_DebugFile


Func AutoIt_Debugger_SendVariable($VariableName, $VariableValue)
	Local $iNumberOfDims
	Local $iDimXIndex
	Local $iDimYIndex
	Local $iDimZIndex

	;Determine if this is a array variable
	If IsArray($VariableValue) Then
		;Find the number of dimensions
		$iNumberOfDims = UBound($VariableValue, 0)
		Select
			Case $iNumberOfDims = 1
				;Send each array index seperatly
				For $iDimXIndex = 0 To UBound($VariableValue, 1) - 1
					;$oDebug.SendVariable ($VariableName & "[" & $iDimXIndex & "]", AutoIt_Debugger_ReturnVariableValue($VariableName, $VariableValue[$iDimXIndex]))
					_AU3COM_SendData_SendVariable($VariableName & "[" & $iDimXIndex & "]" & "|" & AutoIt_Debugger_ReturnVariableValue($VariableName, $VariableValue[$iDimXIndex]))
				Next

			Case $iNumberOfDims = 2
				;Repeat for each X dimension
				For $iDimXIndex = 0 To UBound($VariableValue, 1) - 1
					;Repeat for each Y dimension
					For $iDimYIndex = 0 To UBound($VariableValue, 2) - 1
						;$oDebug.SendVariable ($VariableName & "[" & $iDimXIndex & "][" & $iDimYIndex & "]", AutoIt_Debugger_ReturnVariableValue($VariableName, $VariableValue[$iDimXIndex][$iDimYIndex]))
						_AU3COM_SendData_SendVariable($VariableName & "[" & $iDimXIndex & "][" & $iDimYIndex & "]" & "|" & AutoIt_Debugger_ReturnVariableValue($VariableName, $VariableValue[$iDimXIndex][$iDimYIndex]))
					Next
				Next

			Case $iNumberOfDims = 3
				;Repeat for each X dimension
				For $iDimXIndex = 0 To UBound($VariableValue, 1) - 1
					;Repeat for each Y dimension
					For $iDimYIndex = 0 To UBound($VariableValue, 2) - 1
						;Repeat for each Z dimension
						For $iDimZIndex = 0 To UBound($VariableValue, 3) - 1
							;$oDebug.SendVariable ($VariableName & "[" & $iDimXIndex & "][" & $iDimYIndex & "][" & $iDimZIndex & "]", AutoIt_Debugger_ReturnVariableValue($VariableName, $VariableValue[$iDimXIndex][$iDimYIndex][$iDimZIndex]))
							_AU3COM_SendData_SendVariable($VariableName & "[" & $iDimXIndex & "][" & $iDimYIndex & "][" & $iDimZIndex & "]" & "|" & AutoIt_Debugger_ReturnVariableValue($VariableName, $VariableValue[$iDimXIndex][$iDimYIndex][$iDimZIndex]))
						Next
					Next
				Next

			Case Else
				;$oDebug.SendVariable ($VariableName, "<Array has too many dims>")
				_AU3COM_SendData_SendVariable($VariableName & "|" & "<Array has too many dims>")
		EndSelect
	Else
		;$oDebug.SendVariable ($VariableName, AutoIt_Debugger_ReturnVariableValue($VariableValue))
		_AU3COM_SendData_SendVariable($VariableName & "|" & AutoIt_Debugger_ReturnVariableValue($VariableName, $VariableValue))
	EndIf
EndFunc   ;==>AutoIt_Debugger_SendVariable


Func AutoIt_Debugger_SendConsoleWrite($OutputString)
	_AU3COM_SendData_ConsoleWrite($OutputString)
EndFunc   ;==>AutoIt_Debugger_SendConsoleWrite


Func AutoIt_Debugger_ReturnVariableValue($AutoIt_Debugger_VariableName, $AutoIt_Debugger_VariableValue)
	Local $AutoIt_Debugger_sRes = ""
	;$AutoIt_Debugger_VariableValue = Execute($AutoIt_Debugger_VariableName)
	If IsBool($AutoIt_Debugger_VariableValue) Then $AutoIt_Debugger_sRes &= $AutoIt_Debugger_VariableValue
	If IsFloat($AutoIt_Debugger_VariableValue) Then $AutoIt_Debugger_sRes &= $AutoIt_Debugger_VariableValue
	If IsInt($AutoIt_Debugger_VariableValue) Then $AutoIt_Debugger_sRes &= $AutoIt_Debugger_VariableValue
	;If IsNumber($AutoIt_Debugger_VariableValue) Then $AutoIt_Debugger_sRes &= $AutoIt_Debugger_VariableValue
	If IsString($AutoIt_Debugger_VariableValue) Then $AutoIt_Debugger_sRes &= StringLeft($AutoIt_Debugger_VariableValue, 256)
	If IsArray($AutoIt_Debugger_VariableValue) Then $AutoIt_Debugger_sRes &= $AutoIt_Debugger_VariableValue
	If IsObj($AutoIt_Debugger_VariableValue) Then $AutoIt_Debugger_sRes &= "<Object>" & $AutoIt_Debugger_VariableValue
	If IsBinary($AutoIt_Debugger_VariableValue) Then $AutoIt_Debugger_sRes &= "<Binary>" & $AutoIt_Debugger_VariableValue
	If IsHWnd($AutoIt_Debugger_VariableValue) Then $AutoIt_Debugger_sRes &= "<HWnd>" & $AutoIt_Debugger_VariableValue
	If IsKeyword($AutoIt_Debugger_VariableValue) Then $AutoIt_Debugger_sRes &= "<Keyword>" & $AutoIt_Debugger_VariableValue
	If IsDllStruct($AutoIt_Debugger_VariableValue) Then $AutoIt_Debugger_sRes &= "<DllStructure>" & $AutoIt_Debugger_VariableValue

	;If StringLeft($AutoIt_Debugger_VariableName, 1) <> "$" Then $AutoIt_Debugger_VariableName = "$" & $AutoIt_Debugger_VariableName
	;If Not IsDeclared(StringTrimLeft($AutoIt_Debugger_VariableName, 1)) Then $AutoIt_Debugger_sRes &= "<Undeclared>"

	Return $AutoIt_Debugger_sRes
EndFunc   ;==>AutoIt_Debugger_ReturnVariableValue


Func AutoIt_Debugger_GetVariableFromEvent($VariableName, ByRef $Variable, $AutoItDebugger_ArrayIndexString, $VariableValue)
	;MsgBox(0, "_AutoIt Debugger Include", "Entered 'AutoIt_Debugger_GetVariableFromEvent'")

	Local $iNumberOfDims
	Local $iDimXIndex
	Local $iDimYIndex
	Local $iDimZIndex
	Local $ArrayIndexArray

	If IsBool($Variable) Or IsFloat($Variable) Or IsInt($Variable) Or IsNumber($Variable) Or IsString($Variable) Then
		$Variable = $VariableValue
		;MsgBox(0, "_AutoIt Debugger Include", "New value of '" & $VariableName & " is '" & $Variable & "'")
	ElseIf IsArray($Variable) Then
		;Extract the array section, split by |s
		$ArrayIndexArray = StringSplit($AutoItDebugger_ArrayIndexString, "|")

		;Find the number of dimensions
		$iNumberOfDims = $ArrayIndexArray[0]
		Select
			Case $iNumberOfDims = 1
				;Set the value based on the array index
				$Variable[$ArrayIndexArray[1]] = $VariableValue

			Case $iNumberOfDims = 2
				;Set the value based on the array index
				$Variable[$ArrayIndexArray[1]][$ArrayIndexArray[2]] = $VariableValue

			Case $iNumberOfDims = 3
				;Set the value based on the array index
				$Variable[$ArrayIndexArray[1]][$ArrayIndexArray[2]][$ArrayIndexArray[3]] = $VariableValue

			Case Else
				;Do nothing
		EndSelect

	ElseIf IsObj($Variable) Then
		;Do nothing
	ElseIf IsBinary($Variable) Then
		;Do nothing
	ElseIf IsHWnd($Variable) Then
		;Do nothing
	ElseIf IsKeyword($Variable) Then
		;Do nothing
	EndIf
EndFunc   ;==>AutoIt_Debugger_GetVariableFromEvent


; Message Handler
Func _GUIRegisterMsgProc($hWnd, $MsgID, $WParam, $LParam)
	If $MsgID = 0x004A Then ;Global Const $WM_COPYDATA = 0x004A

		; $LParam = Poiter to a COPYDATA Struct
		Local $STRUCTDEF_AU3MESSAGE = "char var1[256]"
		Local $STRUCTDEF_AU3MESSAGELEN = "dword var1"
		Local $StructDef_COPYDATA = "dword var1;dword var2;ptr var3"

		;Set a reference to the COPYDATA structure
		Local $vs_cds = DllStructCreate($StructDef_COPYDATA, $LParam)
		;Extract the command (the 1st element)
		Local $msgType = DllStructGetData($vs_cds, 1)

		;MsgBox(0, "AutoIt Debugger", "Command Received: " & $msgType)

		Select
			Case $msgType = 0

				;Log message
				;GUICtrlSetData($AutoItDebuggerCommandWindowListbox,_Now() & ": New variable")

				;Get the message length from the 2nd element
				Local $msglen1 = DllStructGetData($vs_cds, 2)
				Local $STRUCTDEF_AU3MESSAGE1 = "char var1[" & $msglen1 & "]"
				Local $vs_msg1 = DllStructCreate($STRUCTDEF_AU3MESSAGE1, DllStructGetData($vs_cds, 3))

				;Display what we have recived
				Local $MSGRECVD = DllStructGetData($vs_msg1, 1)
				;MsgBox(0, "Recver - Test String", $MSGRECVD)

				Local $iSpacePos
				$iSpacePos = StringInStr($MSGRECVD, " ")
				Dim $sChangedVariableName = StringLeft($MSGRECVD, $iSpacePos - 1)
				Dim $sChangedVariableValue = StringRight($MSGRECVD, StringLen($MSGRECVD) - $iSpacePos)

				;MsgBox(0, "Variable Name", "'" & $sChangedVariableName & "'")
				;MsgBox(0, "Variable Value", "'" & $sChangedVariableValue & "'")

				;Run change variable code
				AutoItDebuggerEvent_ChangeVariable($sChangedVariableName, $sChangedVariableValue)

			Case $msgType = 1
				$AutoItDebugger_Paused = 0

				;Log message
				;GUICtrlSetData($AutoItDebuggerCommandWindowListbox,_Now() & ": Removed Pause")

			Case $msgType = 2
				$AutoItDebugger_Quit = 1

				;Log message
				;GUICtrlSetData($AutoItDebuggerCommandWindowListbox, _Now() & ": Received Quit")

		EndSelect

	ElseIf $MsgID = 0x0010 Then ;=== We Recived a WM_CLOSE Message ;Global Const $WM_CLOSE = 0x0010
		Exit
	EndIf
EndFunc   ;==>_GUIRegisterMsgProc


Func _AU3COM_SendData($MessageType, $InfoToSend)
	Local $StructDef_COPYDATA = "dword var1;dword var2;ptr var3"
	Local $CDString = DllStructCreate("char var1[256];char var2[256]") ;the array to hold the string we are sending

	DllStructSetData($CDString, 1, $InfoToSend)
	Local $pCDString = DllStructGetPtr($CDString) ;the pointer to the string
	Local $vs_cds = DllStructCreate($StructDef_COPYDATA);create the message struct
	DllStructSetData($vs_cds, "var1", $MessageType)
	DllStructSetData($vs_cds, "var2", String(StringLen($InfoToSend)));tell the receiver the length of the string
	DllStructSetData($vs_cds, "var3", $pCDString) ;the pointer to the string
	Local $pStruct = DllStructGetPtr($vs_cds)

	AutoIt_Debugger_SendMessage(WinGetHandle("AutoIt Debugger - " & $AutoItDebuggerCommandWindowName), 0x004A, 0, $pStruct) ;Global Const $WM_COPYDATA = 0x004A

	$vs_cds = 0 ;free the struct
	$CDString = 0 ;free the struct

	Return 1
EndFunc   ;==>_AU3COM_SendData


Func _AU3COM_SendData_NewLine($InfoToSend)
	_AU3COM_SendData(1, $InfoToSend)
EndFunc   ;==>_AU3COM_SendData_NewLine


Func _AU3COM_SendData_FinishedLine($InfoToSend)
	_AU3COM_SendData(2, $InfoToSend)
EndFunc   ;==>_AU3COM_SendData_FinishedLine


Func _AU3COM_SendData_SendVariable($InfoToSend)
	_AU3COM_SendData(3, $InfoToSend)
EndFunc   ;==>_AU3COM_SendData_SendVariable


Func _AU3COM_SendData_LoadFile($InfoToSend)
	_AU3COM_SendData(4, $InfoToSend)
EndFunc   ;==>_AU3COM_SendData_LoadFile


Func _AU3COM_SendData_ScriptFinished($InfoToSend)
	_AU3COM_SendData(5, $InfoToSend)
EndFunc   ;==>_AU3COM_SendData_ScriptFinished


Func _AU3COM_SendData_DebugFile($InfoToSend)
	_AU3COM_SendData(6, $InfoToSend)
EndFunc   ;==>_AU3COM_SendData_DebugFile

Func _AU3COM_SendData_ConsoleWrite($InfoToSend)
	_AU3COM_SendData(7, $InfoToSend)
EndFunc   ;==>_AU3COM_SendData_ConsoleWrite

; #FUNCTION# ====================================================================================================================
; Name...........: _SendMessage
; Description ...: Wrapper for commonly used Dll Call
; Syntax.........: _SendMessage($hWnd, $iMsg[, $wParam = 0[, $lParam = 0[, $iReturn = 0[, $wParamType = "wparam"[, $lParamType = "lparam"[, $sReturnType = "lresult"]]]]]])
; Parameters ....: $hWnd       - Window/control handle
;                  $iMsg       - Message to send to control (number)
;                  $wParam     - Specifies additional message-specific information
;                  $lParam     - Specifies additional message-specific information
;                  $iReturn    - What to return:
;                  |0 - Return value from dll call
;                  |1 - $ihWnd
;                  |2 - $iMsg
;                  |3 - $wParam
;                  |4 - $lParam
;                  |<0 or > 4 - array same as dllcall
;                  $wParamType - See DllCall in Related
;                  $lParamType - See DllCall in Related
;                  $sReturnType - See DllCall in Related
; Return values .: Success      - User selected value from the DllCall() result
;                  Failure      - @error is set
; Author ........: Valik
; Modified.......: Gary Frost (GaryFrost) aka gafrost
; Remarks .......:
; Related .......: _SendMessage, DllCall
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func AutoIt_Debugger_SendMessage($hWnd, $iMsg, $WParam = 0, $LParam = 0, $iReturn = 0, $wParamType = "wparam", $lParamType = "lparam", $sReturnType = "lresult")
	Local $aResult = DllCall("user32.dll", $sReturnType, "SendMessageW", "hwnd", $hWnd, "uint", $iMsg, $wParamType, $WParam, $lParamType, $LParam)
	If @error Then Return SetError(@error, @extended, "")
	If $iReturn >= 0 And $iReturn <= 4 Then Return $aResult[$iReturn]
	Return $aResult
EndFunc   ;==>AutoIt_Debugger_SendMessage

