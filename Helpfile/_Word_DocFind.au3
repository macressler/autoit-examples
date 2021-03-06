#include <Word.au3>
#include <MsgBoxConstants.au3>

; Create application object
Global $oWord = _Word_Create()
If @error <> 0 Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Example", _
		"Error creating a new Word application object." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Open test document read-only
Global $oDoc = _Word_DocOpen($oWord, @ScriptDir & "\Extras\Test.doc", Default, Default, True)
If @error <> 0 Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Example", _
		"Error opening '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; *****************************************************************************
; Find the last text "test document" in the document and mark it bold.
; *****************************************************************************
Global $oRangeFound
#forceref $oRangeFound
$oRangeFound = _Word_DocFind($oDoc, "test document", 0, Default, False)
If @error <> 0 Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Example", _
		"Error locating the specified text in the document." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
$oRangeFound.Bold = True
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Example", _
		"Last occurrence of string 'test document' in the document marked as bold.")
