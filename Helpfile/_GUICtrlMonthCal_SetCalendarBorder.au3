#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hMonthCal

	; Create GUI
	GUICreate("Month Calendar", 400, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Create memo control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Get/Set calendar border
	MemoWrite("Border in pixels: " & _GUICtrlMonthCal_GetCalendarBorder($hMonthCal))
	Sleep(3000)
	GUISetState(@SW_LOCK)
	_GUICtrlMonthCal_SetCalendarBorder($hMonthCal, 2)
	MemoWrite("Border in pixels: " & _GUICtrlMonthCal_GetCalendarBorder($hMonthCal))
	GUISetState(@SW_UNLOCK)
	Sleep(3000)
	GUISetState(@SW_LOCK)
	_GUICtrlMonthCal_SetCalendarBorder($hMonthCal, 0, False)
	MemoWrite("Border in pixels: " & _GUICtrlMonthCal_GetCalendarBorder($hMonthCal))
	GUISetState(@SW_UNLOCK)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Write message to memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
