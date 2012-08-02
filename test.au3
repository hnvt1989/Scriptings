#include <IE.au3>
#include <constants.au3>
#include <File.au3>

$result = _checkLAN("192.168.8.102", 1)
ConsoleWrite ( "Result = " & $result)

Func _checkLAN($ipAddress, $switch)
   $cmd_pid = Run("cmd.exe", "", @SW_MAXIMIZE, $STDOUT_CHILD + $RUN_CREATE_NEW_CONSOLE + $STDERR_CHILD)
   Sleep(5000)
   $cmd_hwnd = _GetHwndFromPID($cmd_pid)
   ControlSend($cmd_hwnd, "", "", "ping " & $ipAddress & @CR)
   Sleep(5000)
   $kill_console = "C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe Stop-Process -id " & $cmd_pid
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