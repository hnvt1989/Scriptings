#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.3.6.0
	
	Author:         myName
	
	Script Function: Template AutoIt script.
	
#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here


#include <IE.au3>
#include <constants.au3>
#include <File.au3>	

$cmd_pid = Run("cmd.exe", "", @SW_MAXIMIZE, $STDOUT_CHILD + $RUN_CREATE_NEW_CONSOLE + $STDERR_CHILD)
Sleep(5000)
$cmd_hwnd = _GetHwndFromPID($cmd_pid)
			   
ControlSend($cmd_hwnd, "", "", "C:\ISCT\AVE\psexec.exe \\192.168.1.141 -u PCCA-CASE -p intel@1234 netsh wlan show networks" & @CR)
;$kill_console = "C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe Stop-Process -id " & $cmd_pid
;Run($kill_console, @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
;ProcessWaitClose($cmd_pid)

$data = ""
While True
   $str = StdoutRead($cmd_pid )
   $data &= $str
   $err = StderrRead($cmd_pid)
   ;ConsoleWrite($err)
   ;ConsoleWrite($str)
   If StringRegExp($err, '.*error code 0*', 0) Then
	  ;ConsoleWrite("Hit the error code line" & @CR)
	  $data &= $err
	  ExitLoop
   EndIf
   Sleep(500)
WEnd
$kill_console = "C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe Stop-Process -id " & $cmd_pid
Run($kill_console, @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)

ConsoleWrite($data)
ConsoleWrite("hey" & @CR)
;$resultStr = StdoutRead($cmd_pid)
;exit()
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