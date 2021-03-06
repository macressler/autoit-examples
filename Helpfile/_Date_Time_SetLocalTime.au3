#include <GUIConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

; Under Vista the Windows API "SetLocalTime" may be rejected due to system security

Global $iMemo

Example()

Func Example()
	Local $tCur, $tNew

	; Create GUI
	GUICreate("Time", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Show current local time
	$tCur = _Date_Time_GetLocalTime()
	MemoWrite("Current date/time .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; Set new local time
	$tNew = _Date_Time_EncodeSystemTime(8, 19, @YEAR, 3, 10, 45)
	If Not _Date_Time_SetLocalTime(DllStructGetPtr($tNew)) Then
		MsgBox($MB_SYSTEMMODAL, "Error", "System clock cannot be SET" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
		Exit
	EndIf
	$tNew = _Date_Time_GetLocalTime()
	MemoWrite("New date/time .....: " & _Date_Time_SystemTimeToDateTimeStr($tNew))

	; Reset local time
	_Date_Time_SetLocalTime(DllStructGetPtr($tCur))

	; Show current local time
	$tCur = _Date_Time_GetLocalTime()
	MemoWrite("Current date/time .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Write a line to the memo control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
